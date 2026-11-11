import Foundation

var integerNumber: Int?
var decimalNumber: Double?
integerNumber = 15

if var value = integerNumber {
    value += value
    integerNumber = value
}

if let value = integerNumber {
    integerNumber = -value
}

if let intVal = integerNumber {
    decimalNumber = Double(intVal) // Явне приведення типів обов'язкове у Swift
}

var pairOfValues: (intVal: Int?, decVal: Double?)? = (integerNumber, decimalNumber)

if let pair = pairOfValues, let intVal = pair.intVal {
    print("8. Цілочислове значення з пари: \(intVal)")
}

if let pair = pairOfValues, let decVal = pair.decVal {
    print("9. Значення з плаваючою крапкою з пари: \(decVal)")
}

if let unwrappedDecimal = decimalNumber {
    print("10. Значення decimalNumber: \(unwrappedDecimal)")
} else {
    print("10. decimalNumber містить nil")
}
