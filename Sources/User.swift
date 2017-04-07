//SAMPLE DATA

let c3po = User(
    id: "1000",
    name: "C-3PO",
    email: "c3po@email.com"
)

let john = User(
    id: "2000",
    name: "John Doe",
    email: "john@email.com"
)

let mike = User(
    id: "3000",
    name: "Mike Michael",
    email: "miike@email.com"
)

let userData: [String: User] = [
    "1000": c3po,
    "2000": john,
    "3000": mike,
]


struct User {
    let id: String
    let name: String
    let email: String
    
    init(id: String, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}

func getUser(id: String) -> User? {
    return userData[id]
}