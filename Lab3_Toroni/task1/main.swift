class PersonBasic {
    let name: String

    init(name: String) {
        self.name = name
        print("PersonBasic \(name) ініціалізовано (init)")
    }

    deinit {
        print("PersonBasic \(name) видалено з пам'яті (deinit)")
    }
}

print("--- Завдання 4–5: Глобальний об'єкт ---")
let globalPerson = PersonBasic(name: "Іван")

print("\n--- Завдання 6: Локальний scope (do {}) ---")
do {
    let localPerson = PersonBasic(name: "Олександр")
    print("Працюємо з об'єктом: \(localPerson.name)")
} 



class PersonLeaky {
    let name: String
    var child: SonLeaky? 

    init(name: String) {
        self.name = name
        print("PersonLeaky \(name) init")
    }

    deinit {
        print("PersonLeaky \(name) deinit")
    }
}

class SonLeaky {
    let name: String
    var parent: PersonLeaky? 

    init(name: String) {
        self.name = name
        print("SonLeaky \(name) init")
    }

    deinit {
        print("SonLeaky \(name) deinit")
    }
}

print("\n--- Завдання 7–9: Взаємні сильні посилання (deinit НЕ викличеться) ---")
do {
    let father = PersonLeaky(name: "Андрій")
    let son = SonLeaky(name: "Максим")

    father.child = son   
    son.parent = father  
}



class PersonFixed {
    let name: String
    var child: SonFixed? 

    init(name: String) {
        self.name = name
        print("PersonFixed \(name) init")
    }

    deinit {
        print("PersonFixed \(name) deinit")
    }
}

class SonFixed {
    let name: String
    weak var parent: PersonFixed? 

    init(name: String) {
        self.name = name
        print("SonFixed \(name) init")
    }

    deinit {
        print("SonFixed \(name) deinit")
    }
}

print("\n--- Завдання 10: Слабке посилання weak (deinit ВИКЛИКАЄТЬСЯ) ---")
do {
    let father = PersonFixed(name: "Андрій")
    let son = SonFixed(name: "Максим")

    father.child = son   
    son.parent = father  
}