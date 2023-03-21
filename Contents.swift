import UIKit

// MARK: - Object Oriented Programming

/// In Object Oriented Programming we have few concepts those are
/// 1. Class
/// 2. Object
/// 3. Abstractions
/// 4. Encapsulation
/// 5. Inheritance
/// 6. Polmorphism





// MARK: - CLASS
/// It's a Blue print of real world entity. It contains properties and methods.
/// We can create "N" number objects using this class.
/// We can achieve by creating class.

class VehicleClass {
    
    /// some common properties
    var brand: String
    var model: Int
    var color: UIColor
    var numberOfWheels: Int
    
    init(brand: String,
         model: Int,
         color: UIColor,
         numberOfWheels: Int) {
        self.brand = brand
        self.model = model
        self.color = color
        self.numberOfWheels = numberOfWheels
    }
    
    /// some common/default methods
    func start() {
        print("Started the car")
    }
    
    func stop() {
        print("Stopped the car")
    }
}





// MARK: - Object
/// Object is an instance on class.
/// we can create "N" number of objects for a class.
/// We can achieve by declare an instance of the class.

let car = VehicleClass(brand: "Tata Nexon", model: 2023, color: .blue, numberOfWheels: 4)
let bus = VehicleClass(brand: "Volva", model: 2023, color: .white, numberOfWheels: 6)
let auto = VehicleClass(brand: "Mahendra", model: 2023, color: .yellow, numberOfWheels: 3)





// MARK: - Abstraction
/// Hiding the implimentation details and Showing the only essential parts.
/// We can achieve it by uisng Protocols & Abstract classes

// Define a protocol that specifies the required methods and properties
protocol Vehicle {
    var wheels: Int { get }
    func start()
    func stop()
}

// Create a class that conforms to the Vehicle protocol
class Car: Vehicle {
    let wheels = 4
    
    func start() {
        print("Starting the car")
    }
    
    func stop() {
        print("Stopping the car")
    }
}

// Create another class that conforms to the Vehicle protocol
class Bicycle: Vehicle {
    let wheels = 2
    
    func start() {
        print("Starting the bicycle")
    }
    
    func stop() {
        print("Stopping the bicycle")
    }
}

// Use the protocol to create a function that takes any Vehicle object as input
func testVehicle(vehicle: Vehicle) {
    print("This vehicle has \(vehicle.wheels) wheels")
    vehicle.start()
    vehicle.stop()
}

// Create some instances of Car and Bicycle
let myCar = Car()
let myBicycle = Bicycle()

// Call the function with the Car and Bicycle instances
testVehicle(vehicle: myCar)
testVehicle(vehicle: myBicycle)





// MARK: - Encapsulation
/// Binding the properties and methods under one single unit, such as a class. It helps to ensure data privacy and security by controlling access to the data from outside the class.
/// We can achieve it by uisng Access control (public, internal, fileprivate,private, open).

class BankAccount {
    private var balance: Double = 0
    
    func deposit(amount: Double) {
        balance += amount
    }
    
    func withdraw(amount: Double) -> Bool {
        if balance >= amount {
            balance -= amount
            return true
        } else {
            return false
        }
    }
    
    func checkBalance() -> Double {
        return balance
    }
}

let myAccount = BankAccount()

myAccount.deposit(amount: 1000)
print(myAccount.checkBalance()) // Output: 1000.0

myAccount.withdraw(amount: 500)
print(myAccount.checkBalance()) // Output: 500.0

myAccount.withdraw(amount: 1000)
print(myAccount.checkBalance()) // Output: 500.0





// MARK: - Inheritance
/// Aquiring the properties and methods from another class
/// We can achieve it by creating sub-classes

class Human {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sayHello() {
        print("Hello, my name is \(name).")
    }
}

class Male: Human {
    var facialHair: Bool
    
    init(name: String, age: Int, facialHair: Bool) {
        self.facialHair = facialHair
        super.init(name: name, age: age)
    }
    
    func growBeard() {
        if facialHair == false {
            facialHair = true
            print("\(name) has grown a beard!")
        }
    }
}

class Female: Human {
    var makeup: Bool
    
    init(name: String, age: Int, makeup: Bool) {
        self.makeup = makeup
        super.init(name: name, age: age)
    }
    
    func applyMakeup() {
        if makeup == false {
            makeup = true
            print("\(name) has applied makeup!")
        }
    }
}

let john = Male(name: "John", age: 30, facialHair: true)
john.sayHello()
john.growBeard()

let jane = Female(name: "Jane", age: 25, makeup: false)
jane.sayHello()
jane.applyMakeup()





// MARK: - Polymorphism
/// Performing same task in different ways
/// We can achieve polymorphism through the use of inheritance and method overriding.

class Animal {
    func makeSound() {
        print("The animal makes a sound")
    }
}

class Dog: Animal {
    override func makeSound() {
        print("The dog barks")
    }
}

class Cat: Animal {
    override func makeSound() {
        print("The cat meows")
    }
}

let animal = Animal()
let dog = Dog()
let cat = Cat()

animal.makeSound() // The animal makes a sound
dog.makeSound() // The dog barks
cat.makeSound() // The cat meows

// Polymorphism example
let animalArray: [Animal] = [animal, dog, cat]

for animal in animalArray {
    animal.makeSound()
}

