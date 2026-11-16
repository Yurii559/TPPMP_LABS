protocol Copyable {
    func copy() -> Self
}

final class Rational: Copyable, Comparable, CustomStringConvertible {
    
    var numerator: Int {
        didSet {
            normalizeSign()
        }
    }
    
    var denominator: Int {
        didSet {
            if denominator == 0 {
                fatalError("Помилка: Знаменник не може дорівнювати нулю.")
            }
            normalizeSign()
        }
    }
    
    var decimalValue: Double {
        return Double(numerator) / Double(denominator)
    }
    
    var isZero: Bool {
        return numerator == 0
    }
    
    var reduced: Rational {
        let commonDivisor = Rational.gcd(abs(numerator), abs(denominator))
        return Rational(numerator: numerator / commonDivisor, denominator: denominator / commonDivisor)
    }
    
    var description: String {
        let r = self.reduced
        return r.denominator == 1 ? "\(r.numerator)" : "\(r.numerator)/\(r.denominator)"
    }
    
    // MARK: Ініціалізація
    init(numerator: Int, denominator: Int = 1) {
        guard denominator != 0 else {
            fatalError("Помилка: Знаменник не може дорівнювати нулю.")
        }
        let commonDivisor = Rational.gcd(abs(numerator), abs(denominator))
        let sign = denominator < 0 ? -1 : 1
        
        self.numerator = (numerator / commonDivisor) * sign
        self.denominator = abs(denominator) / commonDivisor
    }
    
    private func normalizeSign() {
        if denominator < 0 {
            numerator = -numerator
            denominator = -denominator
        }
    }
    
    // НСД
    private static func gcd(_ a: Int, _ b: Int) -> Int {
        var x = a
        var y = b
        while y != 0 {
            let temp = y
            y = x % y
            x = temp
        }
        return max(1, x)
    }
    
    func copy() -> Rational {
        return Rational(numerator: self.numerator, denominator: self.denominator)
    }
    
    static func == (lhs: Rational, rhs: Rational) -> Bool {
        return lhs.numerator * rhs.denominator == rhs.numerator * lhs.denominator
    }
    
    static func < (lhs: Rational, rhs: Rational) -> Bool {
        return lhs.numerator * rhs.denominator < rhs.numerator * lhs.denominator
    }
    
    func adding(_ other: Rational) -> Rational {
        let num = self.numerator * other.denominator + other.numerator * self.denominator
        let den = self.denominator * other.denominator
        return Rational(numerator: num, denominator: den)
    }
    
    func subtracting(_ other: Rational) -> Rational {
        let num = self.numerator * other.denominator - other.numerator * self.denominator
        let den = self.denominator * other.denominator
        return Rational(numerator: num, denominator: den)
    }
    
    func multiplying(by other: Rational) -> Rational {
        let num = self.numerator * other.numerator
        let den = self.denominator * other.denominator
        return Rational(numerator: num, denominator: den)
    }
    
    func dividing(by other: Rational) -> Rational {
        guard !other.isZero else {
            fatalError("Помилка: Ділення на нульове раціональне число.")
        }
        let num = self.numerator * other.denominator
        let den = self.denominator * other.numerator
        return Rational(numerator: num, denominator: den)
    }
}

final class Calculator {
    
    static let shared = Calculator()
    
    private init() {}
    
    var leftOperand: Rational?
    var rightOperand: Rational?
    private(set) var lastResult: Rational?
    
    static func add(_ a: Rational, _ b: Rational) -> Rational {
        let calc = Calculator.shared
        calc.leftOperand = a.copy()
        calc.rightOperand = b.copy()
        let result = a.adding(b)
        calc.lastResult = result
        return result
    }
    
    static func subtract(_ a: Rational, _ b: Rational) -> Rational {
        let calc = Calculator.shared
        calc.leftOperand = a.copy()
        calc.rightOperand = b.copy()
        let result = a.subtracting(b)
        calc.lastResult = result
        return result
    }
    
    func multiply(_ a: Rational, _ b: Rational) -> Rational {
        self.leftOperand = a.copy()
        self.rightOperand = b.copy()
        let result = a.multiplying(by: b)
        self.lastResult = result
        return result
    }
    
    func divide(_ a: Rational, _ b: Rational) -> Rational {
        self.leftOperand = a.copy()
        self.rightOperand = b.copy()
        let result = a.dividing(by: b)
        self.lastResult = result
        return result
    }
    
    enum Operation: String {
        case add = "+"
        case subtract = "-"
        case multiply = "*"
        case divide = "/"
    }
    
    func evaluate(numbers: [Rational], operations: [Operation]) -> Rational {
        guard !numbers.isEmpty, numbers.count == operations.count + 1 else {
            fatalError("Некоректна кількість операндів або операцій у виразі.")
        }
        
        var nums = numbers.map { $0.copy() }
        var ops = operations
        
        var i = 0
        while i < ops.count {
            if ops[i] == .multiply || ops[i] == .divide {
                let lhs = nums[i]
                let rhs = nums[i + 1]
                let res = (ops[i] == .multiply) ? self.multiply(lhs, rhs) : self.divide(lhs, rhs)
                
                nums[i] = res
                nums.remove(at: i + 1)
                ops.remove(at: i)
            } else {
                i += 1
            }
        }
        
        var finalResult = nums[0]
        for j in 0..<ops.count {
            let rhs = nums[j + 1]
            if ops[j] == .add {
                finalResult = Calculator.add(finalResult, rhs)
            } else if ops[j] == .subtract {
                finalResult = Calculator.subtract(finalResult, rhs)
            }
        }
        
        self.lastResult = finalResult
        return finalResult
    }
}

func runDemonstration() {
    print("=== 1. Ініціалізація та властивості Rational ===")
    let r1 = Rational(numerator: 2, denominator: 4) // Скоротиться до 1/2
    let r2 = Rational(numerator: 3, denominator: 5)
    let r3 = Rational(numerator: -4, denominator: -6) // Нормалізується до 2/3
    let r4 = Rational(numerator: 1, denominator: 4)
    
    print("r1 (2/4) -> \(r1), десяткове значення (readonly property): \(r1.decimalValue)")
    print("r2 (3/5) -> \(r2), десяткове значення: \(r2.decimalValue)")
    print("r3 (-4/-6) -> \(r3)")
    
    print("\n=== 2. Копіювання об'єктів ===")
    let r1Copy = r1.copy()
    r1Copy.numerator = 7 // Змінюємо чисельник копії через setter
    print("Оригінал r1: \(r1) | Модифікована копія r1Copy: \(r1Copy)")
    
    print("\n=== 3. Порівняння об'єктів Rational ===")
    let anotherHalf = Rational(numerator: 5, denominator: 10)
    print("\(r1) == \(anotherHalf) -> \(r1 == anotherHalf)")
    print("\(r1) < \(r2) -> \(r1 < r2)")
    print("\(r3) > \(r2) -> \(r3 > r2)")
    
    print("\n=== 4. Базові операції через Calculator ===")
    let calc = Calculator.shared
    
    let sum = Calculator.add(r1, r2)
    let diff = Calculator.subtract(r2, r1)
    print("Метод класу (+): \(r1) + \(r2) = \(sum)")
    print("Метод класу (-): \(r2) - \(r1) = \(diff)")
    
    let prod = calc.multiply(r1, r3)
    let quot = calc.divide(r2, r3)
    print("Метод екземпляра (*): \(r1) * \(r3) = \(prod)")
    print("Метод екземпляра (/): \(r2) / \(r3) = \(quot)")
    print("Властивість calc.lastResult: \(calc.lastResult!)")
    
    print("\n=== 5. Пріоритет арифметичних операцій (без дужок) ===")
    // Вираз: 1/2 + 3/5 * 2/3 - 1/4 / 1/2 = 2/5
    let numbers = [r1, r2, r3, r4, r1]
    let operations: [Calculator.Operation] = [.add, .multiply, .subtract, .divide]
    
    let expressionString = "\(r1) + \(r2) * \(r3) - \(r4) / \(r1)"
    let exprResult = calc.evaluate(numbers: numbers, operations: operations)
    print("Вираз: \(expressionString)")
    print("Результат з урахуванням пріоритету: \(exprResult) (десяткове: \(exprResult.decimalValue))")
}

runDemonstration()