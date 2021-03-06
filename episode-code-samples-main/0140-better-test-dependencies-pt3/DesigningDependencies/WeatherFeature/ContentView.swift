import Combine
import CombineSchedulers
import CoreLocation
import SwiftUI
import Network
import PathMonitorClient
import WeatherClient
import LocationClient

public class AppViewModel: ObservableObject {
  @Published var currentLocation: Location?
  @Published var isConnected = true
  @Published var weatherResults: [WeatherResponse.ConsolidatedWeather] = []

  var weatherRequestCancellable: AnyCancellable?
  var pathUpdateCancellable: AnyCancellable?
  var searchLocationsCancellable: AnyCancellable?
  var locationDelegateCancellable: AnyCancellable?

  let weatherClient: WeatherClient
  let pathMonitorClient: PathMonitorClient
  let locationClient: LocationClient
  let mainQueue: AnySchedulerOf<DispatchQueue>
  // AnyScheduler<DispatchQueue.SchedulerTimeType, DispatchQueue.SchedulerOptions>
  // any Scheduler

  public init(
    locationClient: LocationClient,
    pathMonitorClient: PathMonitorClient,
    weatherClient: WeatherClient,
    mainQueue: AnySchedulerOf<DispatchQueue>
  ) {
    self.weatherClient = weatherClient
    self.locationClient = locationClient
    self.pathMonitorClient = pathMonitorClient
    self.mainQueue = mainQueue

    self.pathUpdateCancellable = self.pathMonitorClient.networkPathPublisher
      .map { $0.status == .satisfied }
      .removeDuplicates()
      .sink(receiveValue: { [weak self] isConnected in
        guard let self = self else { return }
        self.isConnected = isConnected
        if self.isConnected {
          self.refreshWeather()
        } else {
          self.weatherResults = []
        }
      })

    self.locationDelegateCancellable = self.locationClient.delegate
      .sink { event in
        switch event {
        case let .didChangeAuthorization(status):
          switch status {
          case .notDetermined:
            break

          case .restricted:
            // TODO: show an alert
            break
          case .denied:
            // TODO: show an alert
            break

          case .authorizedAlways, .authorizedWhenInUse:
            self.locationClient.requestLocation()

          @unknown default:
            break
          }

        case let .didUpdateLocations(locations):
          guard self.isConnected, let location = locations.first else { return }

          self.searchLocationsCancellable =  self.weatherClient
            .searchLocations(location.coordinate)
            .receive(on: self.mainQueue)
            .sink(
              receiveCompletion: { _ in },
              receiveValue: { [weak self] locations in
                self?.currentLocation = locations.first
                self?.refreshWeather()
              }
            )

        case .didFailWithError:
          break
        }
      }

    if self.locationClient.authorizationStatus() == .authorizedWhenInUse {
      self.locationClient.requestLocation()
    }
  }
  
  func refreshWeather() {
    guard let location = self.currentLocation else { return }

    self.weatherResults = []
    
    self.weatherRequestCancellable = self.weatherClient
      .weather(location.woeid)
      .receive(on: self.mainQueue)
      .sink(
        receiveCompletion: { _ in },
        receiveValue: { [weak self] response in
          self?.weatherResults = response.consolidatedWeather
      })
  }

  func cancelButtonTapped() {
    self.searchLocationsCancellable = nil
    self.weatherRequestCancellable = nil
  }

  func locationButtonTapped() {
    switch self.locationClient.authorizationStatus() {
    case .notDetermined:
      self.locationClient.requestWhenInUseAuthorization()

    case .restricted:
      // TODO: show an alert
      break
    case .denied:
      // TODO: show an alert
      break

    case .authorizedAlways, .authorizedWhenInUse:
      self.locationClient.requestLocation()

    @unknown default:
      break
    }
  }
}

public struct ContentView: View {
  @ObservedObject var viewModel: AppViewModel

  public init(viewModel: AppViewModel) {
    self.viewModel = viewModel
  }

  public var body: some View {
    NavigationView {
      ZStack(alignment: .bottom) {
        ZStack(alignment: .bottomTrailing) {
          List {
            ForEach(self.viewModel.weatherResults, id: \.id) { weather in
              VStack(alignment: .leading) {
                Text(dayOfWeekFormatter.string(from: weather.applicableDate).capitalized)
                  .font(.title)

                Text("Current temp: \(weather.theTemp, specifier: "%.1f")??C")
                  .bold()
                Text("Max temp: \(weather.maxTemp, specifier: "%.1f")??C")
                Text("Min temp: \(weather.minTemp, specifier: "%.1f")??C")
              }
            }
          }

          Button(
            action: { self.viewModel.locationButtonTapped() }
          ) {
            Image(systemName: "location.fill")
              .foregroundColor(.white)
              .frame(width: 60, height: 60)
          }
          .background(Color.black)
          .clipShape(Circle())
          .padding()
        }

        if !self.viewModel.isConnected {
          HStack {
            Image(systemName: "exclamationmark.octagon.fill")

            Text("Not connected to internet")
          }
          .foregroundColor(.white)
          .padding()
          .background(Color.red)
        }
      }
      .navigationBarTitle(self.viewModel.currentLocation?.title ?? "Weather")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    return ContentView(
      viewModel: AppViewModel(
        locationClient: .notDetermined,
        pathMonitorClient: .satisfied,
        weatherClient: .happyPath,
        mainQueue: DispatchQueue.main.eraseToAnyScheduler()
      )
    )
  }
}

let dayOfWeekFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateFormat = "EEEE"
  return formatter
}()

extension Scheduler {
  static func immediate(now: SchedulerTimeType) -> AnySchedulerOf<Self> {
    .init(
      minimumTolerance: { .zero },
      now: { now },
      scheduleImmediately: { _, action in action() },
      delayed: { _, _, _, action in action() },
      interval: { _, _, _, _, action in action(); return AnyCancellable {} }
    )
  }
}

extension Scheduler
where
  SchedulerTimeType == DispatchQueue.SchedulerTimeType,
  SchedulerOptions == DispatchQueue.SchedulerOptions
{
  static var immediate: AnySchedulerOf<Self> {
    .immediate(now: .init(.now()))
  }
}
