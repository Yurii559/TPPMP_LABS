class Contact {
    let name: String
    var number: Number? 

    init(name: String) {
        self.name = name
        print("Contact \(name) init")
    }
    deinit {
        print("Contact \(name) deinit")
    }
}

class Number {
    let digits: String
    unowned var contact: Contact 

    init(digits: String, contact: Contact) {
        self.digits = digits
        self.contact = contact
        print("Number \(digits) init")
    }
    deinit {
        print("Number \(digits) deinit")
    }
}

print("=== Симуляція видалення контакту  ===")
do {
    let contact = Contact(name: "Олег")
    let phone = Number(digits: "+380501234567", contact: contact)
    contact.number = phone
}