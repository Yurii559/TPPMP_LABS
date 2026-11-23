import Foundation


struct Point {
    private(set) var x: Double = 0.0
    private(set) var y: Double = 0.0
    
    init(x: Double = 0.0, y: Double = 0.0) {
        self.x = x
        self.y = y
    }
    
    func description() -> String {
        return String(format: "(%.2f; %.2f)", x, y)
    }
    
    static func distance(from first: Point, to second: Point) -> Double {
        let dx = second.x - first.x
        let dy = second.y - first.y
        return sqrt(dx * dx + dy * dy)
    }
}


enum ShapeType: String {
    case unknown = "Невідомо"
    case point = "Точка"
    case line = "Лінія"
    case triangle = "Трикутник"
    case quadrilateral = "Чотирикутник"
    case polygon = "Багатокутник"
}

struct Shape {
    private(set) var points: [Point]
    private(set) var type: ShapeType
    
    init(points: [Point]) {
        self.points = points
        self.type = Shape.determineType(for: points.count)
    }
    
    init(points: Point...) {
        self.init(points: points)
    }
    
    subscript(index: Int) -> Point? {
        guard points.indices.contains(index) else {
            return nil
        }
        return points[index]
    }
    
    private static func determineType(for count: Int) -> ShapeType {
        switch count {
        case 0: return .unknown
        case 1: return .point
        case 2: return .line
        case 3: return .triangle
        case 4: return .quadrilateral
        default: return .polygon
        }
    }
}


extension Shape {
    static func perimeter(of shape: Shape) -> Double {
        let count = shape.points.count
        guard count >= 2 else { return 0.0 }
        
        if count == 2 {
            return Point.distance(from: shape.points[0], to: shape.points[1])
        }
        
        var totalPerimeter = 0.0
        for i in 0..<count {
            let current = shape.points[i]
            let next = shape.points[(i + 1) % count]
            totalPerimeter += Point.distance(from: current, to: next)
        }
        return totalPerimeter
    }
    
    static func area(of shape: Shape) -> Double {
        let count = shape.points.count
        guard count >= 3 else { return 0.0 }
        
        var sum = 0.0
        for i in 0..<count {
            let current = shape.points[i]
            let next = shape.points[(i + 1) % count]
            sum += (current.x * next.y) - (next.x * current.y)
        }
        return abs(sum) / 2.0
    }
    
    var perimeter: Double {
        return Shape.perimeter(of: self)
    }
    
    var area: Double {
        return Shape.area(of: self)
    }
}


let triangle = Shape(
    points: Point(x: 0, y: 0),
    Point(x: 3, y: 0),
    Point(x: 0, y: 4)
)
print("Фігура 1: \(triangle.type.rawValue)")
print("Точка [0]: \(triangle[0]?.description() ?? "nil")")
print("Точка [5]: \(triangle[5]?.description() ?? "nil")")
print("Периметр: \(triangle.perimeter), Площа: \(triangle.area)")

let squarePoints = [
    Point(x: 0, y: 0),
    Point(x: 4, y: 0),
    Point(x: 4, y: 4),
    Point(x: 0, y: 4)
]
let square = Shape(points: squarePoints)
print("\nФігура 2: \(square.type.rawValue)")
print("Периметр (static): \(Shape.perimeter(of: square)), Площа (static): \(Shape.area(of: square))")