func analyzeString(_ text: String) -> [Character: Int] {
    var counts: [Character: Int] = [:]
    for char in text {
        counts[char, default: 0] += 1
    }
    return counts
}

let inputText = "Swift 2026!"
let table = analyzeString(inputText)

print("Рядок: \"\(inputText)\"")
print("Символ | Кількість")
print("-------+----------")
for (char, count) in table {
    print("  '\(char)'  | \(count)")
}