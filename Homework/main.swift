//
//  main.swift
//  Homework
//
//  Created by Мостовий Ігор on 30.10.18.
//  Copyright © 2018 Мостовий Ігор. All rights reserved.
//

import Foundation

class Engine {
    let maxSpeed: Int
    var status: String = "Off"
    init (maxSpead: Int = 150) {
        self.maxSpeed = maxSpead
    }
    
    func movingWheels() ->String {
        if status == "On" {
            return "Wheels are moving"
        }
        return "Breaks are working"
    }
}

class Car{
    let model: String
    private var speed: Int?
    private let engine: Engine
    private let disp: Display
    init(model: String, engine: Engine = Engine(), display: Display = Display()) {
        self.model = model
        self.disp = display
        self.engine = engine
    }
    
    var speedOfACar: Int {
        set {
            if newValue < 0 {
                speed = 0
            } else if newValue > engine.maxSpeed {
                speed = engine.maxSpeed
            } else {
                speed = newValue
            }
        }
        get {
            return speed ?? 0
        }
    }
    
    func turnOffTheEngine() {
        if engine.status == "On"{
            engine.status = "Off"
            print("Engine is off")
        } else {
            print("Engine has been turned off already")
        }
        
    }
    
    func turnOnTheEngine() {
        if engine.status == "Off"{
            engine.status = "On"
            print("Engine is on")
        } else {
            print("Engine has been turned on already")
        }
        
    }
    
    func display() {
        disp.displayAll(model: model, speedOfACar: speedOfACar, engineStatus: engine.status, engineMovingWheels: engine.movingWheels(), engineMaxSpeed: engine.maxSpeed)
    }
}

class Display {
    func displayAll(model: String, speedOfACar: Int, engineStatus: String, engineMovingWheels: String, engineMaxSpeed: Int) {
        print("""
            Car model is \(model), speed is \(speedOfACar),
            engine status is \(engineStatus), \(engineMovingWheels), \(engineMaxSpeed)
            """)
    }
}


var carOne = Car(model: "Moskvich 412")
carOne.turnOnTheEngine()
carOne.speedOfACar=120
carOne.display()
carOne.turnOffTheEngine()
carOne.display()

class Scoop {
    var status: Bool = false
    var up: Bool = false
    
    func turnOnTheScoop() {
        if status == false {
            status = true
            print("Scope is on")
        } else {
            print("Scope has been turned on already")
        }
    }
    
    func turnOffTheScoop() {
        if status == true {
            status = false
            print("Scope is off")
        } else {
            print("Scope has been turned off already")
        }
    }
    
    func moveTheScoopUp() {
        if !status {
            print("Scoop is off. Turn it firs")
            return
        }
        if !up {
            up = true
            print("Scoope is up")
        } else {
            print("Scoop has been moved olready")
        }
    }
    
    func moveTheScoopDown() {
        if !status {
            print("Scoop is off. Turn it firs")
            return
        }
        if up {
            up = false
            print("Scoope is up")
        } else {
            print("Scoop has been moved olready")
        }
    }
    
    func turnTheScoop() {
        if !status {
            print("Scoop is off. Turn it firs")
            return
        }
        print("The scoop is turned")
    }
}

class Truck: Car {
    let scoop = Scoop()
    init(engine: Engine = Engine(maxSpead: 50), model: String = "John Deer") {
        super.init(model: model, engine: engine, display: Display())
    }
    
    override func turnOffTheEngine() {
        super.turnOffTheEngine()
        scoop.turnOffTheScoop()
    }
    
    override func turnOnTheEngine() {
        super.turnOnTheEngine()
        scoop.turnOnTheScoop()
    }
    
    override func display() {
        super.display()
        print("Scoop is \(scoop.status)")
    }
    
    
}

let truckOne = Truck(model: "John Deer")
truckOne.turnOnTheEngine()
truckOne.turnOffTheEngine()
truckOne.display()

extension Array where Element == Int {
    func ownForEach() {
        for val in self {
            print(val)
        }
    }
}

let arr = [Int](1...15)
arr.ownForEach()

extension Array where Element == Int {
    func ownSort(_ closure: (Element)->Bool)->[Element] {
        var result: [Int] = []
        for val in self{
            if(closure(val)) {
                result.append(val)
            }
        }
        return result
    }
}

let result = arr.ownSort{$0 % 2 == 0}
print(result)
