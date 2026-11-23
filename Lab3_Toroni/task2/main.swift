class Operand {
    let number: Int
    var operand: Operand?       
    var sumClosure: (() -> Int)? 

    init(number: Int) {
        self.number = number
        print("Operand(\(number)) init")
    }

    deinit {
        print("Operand(\(number)) deinit")
    }
}

print("===  Retain Cycle  ===")
do {
    let op1 = Operand(number: 10)
    let op2 = Operand(number: 20)

    op1.operand = op2

    op1.sumClosure = {
        return op1.number + (op1.operand?.number ?? 0)
    }

    print("Сума (з витоком): \(op1.sumClosure?() ?? 0)")
} 

print("\n=== Вирішення через Capture List (завдання 5) ===")
do {
    let op1 = Operand(number: 100)
    let op2 = Operand(number: 200)

    op1.operand = op2
    op1.sumClosure = { [weak op1] in
        guard let op1 = op1 else { return 0 }
        return op1.number + (op1.operand?.number ?? 0)
    }

    print("Сума (без витоку): \(op1.sumClosure?() ?? 0)")
} 
class OperandBlockLeaky {
    let aConstant = 42
    var aBlock: (() -> ())? = nil

    init() {
        print("OperandBlockLeaky init")
        aBlock = {
            print("Значення константи (Leaky): \(self.aConstant)")
        }
        aBlock?()
    }

    deinit {
        print("OperandBlockLeaky deinit")
    }
}

class OperandBlockFixed {
    let aConstant = 42
    var aBlock: (() -> ())? = nil

    init() {
        print("OperandBlockFixed init")
        aBlock = { [weak self] in
            print("Значення константи (Fixed): \(self?.aConstant ?? 0)")
        }
        aBlock?()
    }

    deinit {
        print("OperandBlockFixed deinit")
    }
}

print("\n=== Занілення об'єктів ===")
var leakyObj: OperandBlockLeaky? = OperandBlockLeaky()
leakyObj = nil 

print("")
var fixedObj: OperandBlockFixed? = OperandBlockFixed()
fixedObj = nil