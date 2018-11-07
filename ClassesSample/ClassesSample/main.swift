//
//  main.swift
//  ClassesSample
//
//  Created by Oleksandr on 10/18/18.
//  Copyright © 2018 Oleksandr. All rights reserved.
//

import Foundation

print("Hello, World!")

class Parent {
    var name: String?
    var age: Int?
    
    func fullName() -> String? {
        return name
    }
}

//Inheritance example:
class Child: Parent {
    var surname: String?
    
    //Polymorphism:
    override func fullName() -> String? {
        return "\(name ?? "") + \(surname ?? "")"
    }
}
class Granchild: Child {
    var sursurname: String?
    //Polymorphism:
    override func fullName() -> String? {
        return "\(name ?? "") + \(surname ?? "") + \(sursurname ?? "")"
    }
}

//protocol example
protocol Havat {
    func eatSome()
}

protocol Walk {
    func walk()
}

class Human: Walk, Havat {
    func walk() {
        
    }
    
    func hello() {
        
    }
    
    func eatSome() {
            
    }
    
    
}





struct Car {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var mazda = Car(name: "Mazda")
var bmw = mazda
bmw.name = "Bmw"

print(bmw.name)
print(mazda.name)

class Animal {
    //Stored properties (variable and constant)
    let name: String        //constant
    var age: UInt16         //variable
    
    
    //Lazy Stored Properties
    lazy var nameAndAge: String = "\(name) \(age)"

    //Computed Properties
    var computableNameAndAge: String {
        set {
           surname = newValue.appending(" as new")
        }
        get {
           return surname
        }
    }
    
    //Read-Only Computed Properties
    var nameAndAgeComputed: String {
        return "\(name) \(age)"
    }
    
    //Property Observers
    var surname: String = "" {
        didSet {
            print("Did setted: \(surname) on \(oldValue)")
        }
        willSet {
            print("Will set: \(newValue) on \(surname)")
        }
    }
    
    //Type Properties
    static let concerningClass = "This is Animal"
    static let thisIsDefinetelyClass = 123
    
    init(name: String = "Default", age: UInt16 = 123) {
        self.age = age
        self.name = name
    }
    
    class func some() {
        print(thisIsDefinetelyClass)
        print(concerningClass)
    }
}

Animal.some()

let human = Animal()
human.age = 1000
print(human.surname)

human.computableNameAndAge = "11"
print(human.computableNameAndAge)
print(human.surname)
human.computableNameAndAge = "12"

var human2 = Animal(name: "Human", age: 2)
human2 = human


struct AllOPt {
    var name: String?
}


class Calculator {
    
    var add1: (Int, Int) -> Int {
        return { first, second in
            return first + second
        }
    }
    
    func add(first: Int, second: Int) -> Int {
        return first + second
    }
}


let obj = Calculator()
let a = obj.add(first: 1, second: 2)
let a1 = obj.add1(1, 2)


var list: [Int] = [1,2,3,-5,-6]
var filteredList: [Int] = []
for val in list {
    if val > 0 {
        filteredList.append(val)
    }
}


extension Array where Element == Int {
    func filter1(_ closure: (Element) -> Bool) -> [Element] {
        var filteredList: [Element] = []
        for val in self {
            if closure(val) {
                filteredList.append(val)
            }
        }
        return filteredList
    }
}



let filteredList1 = list.filter1 {
    return $0 > 0
}












