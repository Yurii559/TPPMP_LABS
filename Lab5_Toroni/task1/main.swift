func factorial(_ n: Int) -> Int? {
    guard n >= 0 else { return nil }
    if n <= 1 { return 1 }

    var result = 1
    for i in 2...n {
        result *= i
    }
    return result
}

let number = 6
if let result = factorial(number) {
    print("\(number)! = \(result)")
} else {
    print("Факторіал для від'ємного числа не визначений.")
}