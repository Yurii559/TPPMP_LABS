typealias Point = (x: Double, y: Double)
typealias Circle = (center: Point, radius: Double)

func findLargestContainingCircle(circles: [Circle], point: Point) -> Circle? {
    var largestCircle: Circle? = nil

    for circle in circles {
        guard circle.radius >= 0 else { continue }
        let dx = point.x - circle.center.x
        let dy = point.y - circle.center.y
        let distanceSquared = dx * dx + dy * dy
        let radiusSquared = circle.radius * circle.radius

        if distanceSquared <= radiusSquared {
            if let currentLargest = largestCircle {
                if circle.radius > currentLargest.radius {
                    largestCircle = circle
                }
            } else {
                largestCircle = circle
            }
        }
    }

    return largestCircle
}

let circles: [Circle] = [
    (center: (0.0, 0.0), radius: 2.0),
    (center: (1.0, 1.0), radius: 5.0),
    (center: (10.0, 10.0), radius: 10.0),
    (center: (0.0, 0.0), radius: 3.5)
]
let targetPoint: Point = (1.0, 1.0)

if let largest = findLargestContainingCircle(circles: circles, point: targetPoint) {
    print("Найбільше коло для точки \(targetPoint): центр \(largest.center), радіус \(largest.radius)")
} else {
    print("Точка \(targetPoint) не належить жодному колу.")
}