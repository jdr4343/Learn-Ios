
let bigString = String.init(repeating: "A", count: 1_000_000)

var copy = bigString
copy.removeFirst()

var anotherCopy = bigString
anotherCopy.removeFirst()

let truncatedBigString = bigString.dropFirst() as Substring

bigString.index(after: bigString.startIndex) == truncatedBigString.startIndex

var copy1 = truncatedBigString.dropFirst(100)
var copy2 = truncatedBigString.dropFirst(1_000)
var copy3 = truncatedBigString.dropFirst(10_000)

let acuteE1 = "Γ©"
let acuteE2 = "eΜ"
acuteE1 == acuteE2
acuteE1.count
acuteE2.count

acuteE1.unicodeScalars.count
acuteE2.unicodeScalars.count

Array(acuteE1.unicodeScalars)
Array(acuteE2.unicodeScalars)

acuteE1.unicodeScalars.elementsEqual(acuteE2.unicodeScalars)

"πΊ"
"πΈ"
"πΊ" + "πΈ"
"\u{1F1FA}\u{1F1F8}"



"πΊπΈ".dropFirst()

String("πΊπΈ".unicodeScalars.dropFirst())

Array(acuteE1.utf8)
Array(acuteE2.utf8)

Array("πΊπΈ".unicodeScalars)
Array("πΊπΈ".utf8)
Array("π¨βπ¨βπ§βπ§".unicodeScalars)
Array("π¨βπ¨βπ§βπ§".utf8)
"π¨βπ¨βπ§βπ§".utf8.count

"πΊπΈ".unicodeScalars.first == ("πΊ" as Unicode.Scalar)

"πΊπΈ".utf8.starts(with: [240, 159, 135, 186])
