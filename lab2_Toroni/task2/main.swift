import Foundation

let chSet: Set<Character> = ["a", "b", "c", "d"]
print("1. Множина chSet: \(chSet)")

var mChSet = chSet
print("2. Mutable множина mChSet: \(mChSet)")
print("3. Кількість елементів mChSet: \(mChSet.count)")

mChSet.insert("e")
print("4. Після вставки символу 'e': \(mChSet)")

let srtChSet = mChSet.sorted()
print("5. Відсортована версія srtChSet: \(srtChSet)")

let removedF = mChSet.remove("f")
print("6. Видалений символ 'f': \(String(describing: removedF))")

if let indexD = mChSet.firstIndex(of: "d") {
    mChSet.remove(at: indexD)
}
print("7. Після видалення символу 'd' за індексом (рядкове представлення): \(mChSet.description)")

if let indexA = mChSet.firstIndex(of: "a") {
    let dist = mChSet.distance(from: mChSet.startIndex, to: indexA)
    print("8. Відстань між першим елементом та 'a': \(dist)")
}

mChSet.insert("a")
print("9. Після вставки 'a' в mChSet: \(mChSet)")

let aSet: Set<String> = ["One", "Two", "Three", "1", "2"]
let bSet: Set<String> = ["1", "2", "3", "One", "Two"]
print("10. Множина aSet: \(aSet), множина bSet: \(bSet)")

let commonSet = aSet.intersection(bSet)
print("11. Спільні елементи (intersection): \(commonSet)")

let uniqueASet = aSet.subtracting(bSet)
let uniqueBSet = bSet.subtracting(aSet)
print("12. Унікальні для aSet: \(uniqueASet), унікальні для bSet: \(uniqueBSet)")

let symDiffSet = aSet.symmetricDifference(bSet)
print("13. Неспільні елементи (symmetricDifference): \(symDiffSet)")

let unionSet = aSet.union(bSet)
print("14. Об'єднання множин (union): \(unionSet)")

let xSet = Set(2...4)
let ySet = Set(1...6)
let zSet: Set<Int> = [3, 4, 2]
let x1Set: Set<Int> = [5, 6, 7]
print("15. xSet: \(xSet), ySet: \(ySet), zSet: \(zSet), x1Set: \(x1Set)")
print("16. Чи xSet входить у ySet?: \(xSet.isSubset(of: ySet)), чи ySet входить у xSet?: \(ySet.isSubset(of: xSet))")
print("17. Чи xSet містить ySet?: \(xSet.isSuperset(of: ySet)), чи ySet містить xSet?: \(ySet.isSuperset(of: xSet))")
print("18. Чи xSet та zSet рівні?: \(xSet == zSet)")
print("19. Чи xSet строго входить у zSet (не рівна)?: \(xSet.isStrictSubset(of: zSet))")
print("20. Чи xSet строго містить zSet (не рівна)?: \(xSet.isStrictSuperset(of: zSet))")
