#if os(iOS)
import Combine
import ComposableArchitecture
import PrimeAlert
import PrimeModal
import SwiftUI

public struct CounterView: View {
  struct State: Equatable {
    let alertNthPrime: PrimeAlert?
    let count: Int
    let isNthPrimeButtonDisabled: Bool
    let isPrimeModalShown: Bool
    let isIncrementButtonDisabled: Bool
    let isDecrementButtonDisabled: Bool
    let nthPrimeButtonTitle: String
  }
  public enum Action {
    case decrTapped
    case incrTapped
    case nthPrimeButtonTapped
    case alertDismissButtonTapped
    case isPrimeButtonTapped
    case primeModalDismissed
    case doubleTap
  }
  
  let store: Store<CounterFeatureState, CounterFeatureAction>
  @ObservedObject var viewStore: ViewStore<State, Action>

  public init(store: Store<CounterFeatureState, CounterFeatureAction>) {
    print("CounterView.init")
    self.store = store
    self.viewStore = self.store
      .scope(
        value: State.init,
        action: CounterFeatureAction.init
    )
      .view
  }

  public var body: some View {
    print("CounterView.body")
    return VStack {
      HStack {
        Button("-") { self.viewStore.send(.decrTapped) }
          .disabled(self.viewStore.value.isDecrementButtonDisabled)
        Text("\(self.viewStore.value.count)")
        Button("+") { self.viewStore.send(.incrTapped) }
          .disabled(self.viewStore.value.isIncrementButtonDisabled)
      }
      Button("Is this prime?") { self.viewStore.send(.isPrimeButtonTapped) }
      Button(self.viewStore.value.nthPrimeButtonTitle) {
        self.viewStore.send(.nthPrimeButtonTapped)
      }
      .disabled(self.viewStore.value.isNthPrimeButtonDisabled)
    }
    .font(.title)
    .navigationBarTitle("Counter demo")
    .sheet(
      isPresented: .constant(self.viewStore.value.isPrimeModalShown),
      onDismiss: { self.viewStore.send(.primeModalDismissed) }
    ) {
      IsPrimeModalView(
        store: self.store.scope(
          value: { ($0.count, $0.favoritePrimes) },
          action: { .primeModal($0) }
        )
      )
    }
    .alert(
      item: .constant(self.viewStore.value.alertNthPrime)
    ) { alert in
      Alert(
        title: Text(alert.title),
        dismissButton: .default(Text("Ok")) {
          self.viewStore.send(.alertDismissButtonTapped)
        }
      )
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .background(Color.white)
    .onTapGesture(count: 2) {
      self.viewStore.send(.doubleTap)
    }
  }
}

extension CounterView.State {
  init(counterFeatureState: CounterFeatureState) {
    self.alertNthPrime = counterFeatureState.alertNthPrime
    self.count = counterFeatureState.count
    self.isNthPrimeButtonDisabled = counterFeatureState.isNthPrimeRequestInFlight
    self.isPrimeModalShown = counterFeatureState.isPrimeDetailShown
    self.isIncrementButtonDisabled = counterFeatureState.isNthPrimeRequestInFlight
    self.isDecrementButtonDisabled = counterFeatureState.isNthPrimeRequestInFlight
    self.nthPrimeButtonTitle = "What is the \(ordinal(counterFeatureState.count)) prime?"
  }
}

extension CounterFeatureAction {
  init(action: CounterView.Action) {
    switch action {
    case .decrTapped:
      self = .counter(.decrTapped)
    case .incrTapped:
      self = .counter(.incrTapped)
    case .nthPrimeButtonTapped:
      self = .counter(.requestNthPrime)
    case .alertDismissButtonTapped:
      self = .counter(.alertDismissButtonTapped)
    case .isPrimeButtonTapped:
      self = .counter(.isPrimeButtonTapped)
    case .primeModalDismissed:
      self = .counter(.primeDetailDismissed)
    case .doubleTap:
      self = .counter(.requestNthPrime)
    }
  }
}
#endif
