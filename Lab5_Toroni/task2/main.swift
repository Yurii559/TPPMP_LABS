enum SortAlgorithm {
    case bubble
    case selection
}

func sortArray(_ array: [Int], algorithm: SortAlgorithm = .bubble) -> [Int] {
    var result = array
    let count = result.count
    guard count > 1 else { return result }

    switch algorithm {
    case .bubble:
        for i in 0..<(count - 1) {
            var swapped = false
            for j in 0..<(count - 1 - i) {
                if result[j] > result[j + 1] {
                    let temp = result[j]
                    result[j] = result[j + 1]
                    result[j + 1] = temp
                    swapped = true
                }
            }
            if !swapped { break }
        }
    case .selection:
        for i in 0..<(count - 1) {
            var minIndex = i
            for j in (i + 1)..<count {
                if result[j] < result[minIndex] {
                    minIndex = j
                }
            }
            if minIndex != i {
                let temp = result[i]
                result[i] = result[minIndex]
                result[minIndex] = temp
            }
        }
    }

    return result
}

let numbers = [64, 25, 12, 22, 11]
print("Початковий масив: \(numbers)")
print("Бульбашкою (за замовчуванням): \(sortArray(numbers))")
print("Вибором: \(sortArray(numbers, algorithm: .selection))")