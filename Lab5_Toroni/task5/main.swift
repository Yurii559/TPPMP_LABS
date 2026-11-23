typealias MathOperation = (Int, Int) -> Int?

func chooseOperation(_ symbol: String) -> MathOperation? {
    func add(_ a: Int, _ b: Int) -> Int? { a + b }
    func subtract(_ a: Int, _ b: Int) -> Int? { a - b }
    func multiply(_ a: Int, _ b: Int) -> Int? { a * b }
    func remainder(_ a: Int, _ b: Int) -> Int? {
        guard b != 0 else { return nil }
        return a % b
    }
    func power(_ a: Int, _ b: Int) -> Int? {
        guard b >= 0 else { return nil }
        var result = 1
        for _ in 0..<b {
            result *= a
        }
        return result
    }

    switch symbol {
    case "+": return add
    case "-": return subtract
    case "*": return multiply
    case "%": return remainder
    case "^": return power
    default: return nil
    }
}

func calculate(_ a: Int, _ b: Int, operation: MathOperation) -> Int? {
    return operation(a, b)
}

print("Введіть перше число (за замовчуванням 5):")
let a = Int(readLine() ?? "") ?? 5

print("Введіть друге число (за замовчуванням 3):")
let b = Int(readLine() ?? "") ?? 3

let operations = ["+", "-", "*", "%", "^"]
for symbol in operations {
    if let op = chooseOperation(symbol), let result = calculate(a, b, operation: op) {
        print("\(a) \(symbol) \(b) = \(result)")
    } else {
        print("\(a) \(symbol) \(b) = помилка обчислення")
    }
}