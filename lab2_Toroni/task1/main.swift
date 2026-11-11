import Foundation

let fibArray = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
print("1. Масив fibArray: \(fibArray)")

let revArray = Array(fibArray.reversed())
print("2. Обернений масив revArray: \(revArray)")

let snglArray = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
print("3. Прості числа snglArray: \(snglArray)")
print("4. Кількість елементів snglArray: \(snglArray.count)")
print("5. 10-й елемент snglArray: \(snglArray[9])")
print("6. Підмасив snglArray з 15-го по 20-й елементи: \(Array(snglArray[14...19]))")

let rptArray = Array(repeating: snglArray[9], count: 10)
print("7. Масив rptArray з 10 повторень 10-го елемента: \(rptArray)")

var oddArray = Array<Int>(arrayLiteral: 1, 3, 5, 7, 9)
print("8. Непарні числа oddArray: \(oddArray)")

oddArray.append(11)
print("9. Додано число 11: \(oddArray)")

oddArray.append(contentsOf: [15, 17, 19])
print("10. Додано підмасив [15, 17, 19]: \(oddArray)")

if let index15 = oddArray.firstIndex(of: 15) {
    oddArray.insert(13, at: index15)
}
print("11. Вставлено 13 між 11 та 15: \(oddArray)")

oddArray.removeSubrange(4..<7)
print("12. Видалено елементи з 5-го по 8-й (невключно): \(oddArray)")

let removedLast = oddArray.removeLast()
print("13. Видалений останній елемент: \(removedLast), масив після видалення: \(oddArray)")

oddArray.replaceSubrange(1..., with: [2, 3, 4])
print("14. Замінено елементи з 2-го до останнього на [2, 3, 4]: \(oddArray)")

if let indexOfThree = oddArray.firstIndex(of: 3) {
    oddArray.remove(at: indexOfThree)
}
print("15. Видалено елемент, рівний 3: \(oddArray)")
print("16. Чи міститься число 3 у oddArray?: \(oddArray.contains(3))")
print("17. Рядкове представлення oddArray: \(oddArray.description)")
