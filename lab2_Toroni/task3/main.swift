import Foundation

let nDict = ["1": "One", "2": "Two", "3": "Three", "4": "Four", "5": "Five"]
print("1. Словник nDict: \(nDict)")
print("2. Значення за ключем '3': \(String(describing: nDict["3"]))")

if let index4 = nDict.index(forKey: "4") {
    print("3. Значення за індексом ключа '4': \(nDict[index4].value)")
}

var mNDict = nDict
print("4. Mutable словник mNDict: \(mNDict)")

mNDict["6"] = "Seven"
mNDict["7"] = "Six"
print("5. Додано 6:Seven та 7:Six: \(mNDict)")

mNDict.updateValue("Six", forKey: "6")
mNDict.updateValue("Seven", forKey: "7")
mNDict.updateValue("Eight", forKey: "8")
print("6. Оновлено значення 6:Six, 7:Seven, 8:Eight: \(mNDict)")

mNDict.removeValue(forKey: "5")
print("7. Видалено елемент за ключем '5': \(mNDict)")

if let indexKey4 = mNDict.index(forKey: "4") {
    mNDict.remove(at: indexKey4)
}
print("8. Видалено елемент за індексом ключа '4': \(mNDict)")

if let index1 = mNDict.index(forKey: "1"), let index7 = mNDict.index(forKey: "7") {
    let dist = mNDict.distance(from: index1, to: index7)
    print("9. Відстань між 1:One та 7:Seven: \(dist)")
}

let mNDictKeys = Array(mNDict.keys)
print("10. Масив ключів mNDictKeys: \(mNDictKeys)")

let mNDictValues = Array(mNDict.values)
print("11. Масив значень mNDictValues: \(mNDictValues)")

print("12. Кількість елементів: \(mNDict.count), ключів: \(mNDict.keys.count), значень: \(mNDict.values.count)")
print("13. Рядкове представлення mNDict: \(mNDict.description)")
