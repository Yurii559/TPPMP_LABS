@discardableResult
func analyzeCharacter(_ char: Character) -> (category: String, alphabet: String?, letterCase: String?) {
    let ukrUpper = "АБВГҐДЕЄЖЗИІЇЙКЛМНОПРСТУФХЦЧШЩЬЮЯ"
    let ukrLower = "абвгґдеєжзиіїйклмнопрстуфхцчшщьюя"

    let category: String
    var alphabet: String? = nil
    var letterCase: String? = nil

    switch char {
    case "0"..."9":
        category = "Цифра"
    case "A"..."Z":
        category = "Літера"
        alphabet = "Англійська"
        letterCase = "Великий регістр"
    case "a"..."z":
        category = "Літера"
        alphabet = "Англійська"
        letterCase = "Малий регістр"
    case let c where ukrUpper.contains(c):
        category = "Літера"
        alphabet = "Українська"
        letterCase = "Великий регістр"
    case let c where ukrLower.contains(c):
        category = "Літера"
        alphabet = "Українська"
        letterCase = "Малий регістр"
    default:
        category = "Інший символ"
    }

    var output = "Символ '\(char)': \(category)"
    if let alphabet = alphabet, let letterCase = letterCase {
        output += ", абетка: \(alphabet), регістр: \(letterCase)"
    }
    print(output)

    return (category, alphabet, letterCase)
}

analyzeCharacter("Ї")
analyzeCharacter("g")
analyzeCharacter("7")
analyzeCharacter("#")