import Foundation

var str = "Hello World. This is Swift programming language"
print("1. Довжина рядка: \(str.count)")

str = str.replacingOccurrences(of: "i", with: "u")
print("2. Після заміни: \(str)")

let indicesToRemove = [10, 7, 4]
for offset in indicesToRemove {
    let index = str.index(str.startIndex, offsetBy: offset)
    str.remove(at: index)
}
print("3. Після видалення символів: \(str)")

str += " (modified)"
print("4. Додано рядок: \(str)")
print("5. Чи рядок пустий?: \(str.isEmpty)")

let dot: Character = "."
str.append(dot)
print("6. Додано крапку: \(str)")
print("7. Починається з 'Hello'?: \(str.hasPrefix("Hello"))")
print("8. Закінчується на 'world.'?: \(str.hasSuffix("world."))")

let insertIndex = str.index(str.startIndex, offsetBy: 10)
str.insert("-", at: insertIndex)
print("9. Вставлено дефіс: \(str)")

str = str.replacingOccurrences(of: "Thus us", with: "It is")
print("10. Заміна 'Thus us' на 'It is': \(str)")

let index10 = str.index(str.startIndex, offsetBy: 10)
let index15 = str.index(str.startIndex, offsetBy: 15)
print("11. 10-й символ: '\(str[index10])', 15-й символ: '\(str[index15])'")

let substring = str[index10..<index15]
print("12. Підрядок [10..<15]: '\(substring)'")
