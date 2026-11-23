import Foundation


enum CoordinateSystem {
    case cartesian
    case polar
}

struct CartesianPoint {
    private(set) var x: Double = 0.0
    private(set) var y: Double = 0.0
    
    init(x: Double = 0.0, y: Double = 0.0) {
        self.x = x
        self.y = y
    }
    
    mutating func update(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

struct PolarPoint {
    private(set) var radius: Double = 0.0
    private(set) var angle: Double = 0.0
    
    init(radius: Double = 0.0, angle: Double = 0.0) {
        self.radius = radius
        self.angle = angle
    }
    
    mutating func update(radius: Double, angle: Double) {
        self.radius = radius
        self.angle = angle
    }
}

struct Point {
    private(set) var cartesian: CartesianPoint = CartesianPoint()
    private(set) var polar: PolarPoint = PolarPoint()
    
    var x: Double { cartesian.x }
    var y: Double { cartesian.y }
    var radius: Double { polar.radius }
    var angle: Double { polar.angle }
    
    init() {}
    
    init(x: Double, y: Double) {
        self.cartesian = CartesianPoint(x: x, y: y)
        self.polar = Point.toPolar(x: x, y: y)
    }
    
    init(radius: Double, angle: Double) {
        self.polar = PolarPoint(radius: radius, angle: angle)
        self.cartesian = Point.toCartesian(radius: radius, angle: angle)
    }
    
    mutating func move(toX x: Double, y: Double) {
        self.cartesian.update(x: x, y: y)
        self.polar = Point.toPolar(x: x, y: y)
    }
    
    mutating func move(toRadius radius: Double, angle: Double) {
        self.polar.update(radius: radius, angle: angle)
        self.cartesian = Point.toCartesian(radius: radius, angle: angle)
    }
    
    func description(in system: CoordinateSystem = .cartesian) -> String {
        switch system {
        case .cartesian:
            return String(format: "Cartesian(x: %.2f, y: %.2f)", cartesian.x, cartesian.y)
        case .polar:
            return String(format: "Polar(radius: %.2f, angle: %.2f rad)", polar.radius, polar.angle)
        }
    }
    
    private static func toPolar(x: Double, y: Double) -> PolarPoint {
        let radius = sqrt(x * x + y * y)
        let angle = atan2(y, x)
        return PolarPoint(radius: radius, angle: angle)
    }
    
    private static func toCartesian(radius: Double, angle: Double) -> CartesianPoint {
        let x = radius * cos(angle)
        let y = radius * sin(angle)
        return CartesianPoint(x: x, y: y)
    }
}


extension Point {
    static func distance(from first: Point, to second: Point) -> Double {
        let dx = second.x - first.x
        let dy = second.y - first.y
        return sqrt(dx * dx + dy * dy)
    }
}


struct CartesianCoordinates {
    let x: Double
    let y: Double
}

struct PolarCoordinates {
    let radius: Double
    let angle: Double
}

extension Point {
    init(cartesianCoordinates: CartesianCoordinates) {
        self.init()
        self.move(toX: cartesianCoordinates.x, y: cartesianCoordinates.y)
    }
    
    init(polarCoordinates: PolarCoordinates) {
        self.init()
        self.move(toRadius: polarCoordinates.radius, angle: polarCoordinates.angle)
    }
}


extension Point {
    static func makePoint(x: Double, y: Double) -> Point {
        return Point(x: x, y: y)
    }
    
    static func makePoint(radius: Double, angle: Double) -> Point {
        return Point(radius: radius, angle: angle)
    }
    
    static func makePoint(cartesian: CartesianCoordinates) -> Point {
        return Point(cartesianCoordinates: cartesian)
    }
    
    static func makePoint(polar: PolarCoordinates) -> Point {
        return Point(polarCoordinates: polar)
    }
}


var p1 = Point(x: 3, y: 4)
print("p1 (декартова за замовч.): \(p1.description())")
print("p1 (полярна): \(p1.description(in: .polar))")

p1.move(toRadius: 10, angle: .pi / 2)
print("p1 після зміщення (r: 10, angle: pi/2): \(p1.description())")

let p2 = Point.makePoint(cartesian: CartesianCoordinates(x: 0, y: 0))
let p3 = Point.makePoint(polar: PolarCoordinates(radius: 5, angle: 0))
print("Відстань між p2 та p3: \(Point.distance(from: p2, to: p3))")