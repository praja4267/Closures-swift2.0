//
//  ViewController.swift
//  ClosuresInSwift
//
//  Created by Active Mac05 on 18/03/16.
//  Copyright © 2016 techactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let numbers1 = [1, 2, 3, 4, 6, 8, 9, 3, 12, 11]
    let numbers2 = [2, 4, 8, 16, 32, 128, 1, 123, 456, 10]
    let numbers3 = [3, 3, 27, 3, 99]
    let strings = ["We", "Heart", "Swift"]
    var countryArray = ["india", "china", "pakistan", "Zimbabwe", "USA", "Australia"]
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        functionThatTakesAClosureWhichTakesNothingAndReturnsNothing { () -> () in
            print("after calling closure takes nothing and returns nothing.")
        }
        
        functionThatTakesAClosureWhichTakesStringAndReturnsNothing { (newString) -> () in
            print(newString)
        }
        
        functionThatTakesATwoIntsAndReturnsSumUsingClosure(1, y: 2) { (result) -> () in
            print("The result inside closure is \(result)")
        }
        
        */
        functionThatTakesArrayOfStrngsAndSortThem(countryArray) { (resultArray) -> () in
            print("The result Array Elements are \n")
            for i in resultArray {
                print(i)
            }
        }

        applyKTimes(2) { () -> () in
            print("Tic")
            print("Tac")
        }

        
        multiplesOfThreeUsingFilterAndClosure(3) { (resultArray) -> () in
            print("multiples of 3 array is \(resultArray)")
        }
        
       findLargestNumberFromGivenArray(numbers1) { (max) -> () in
        print("maximum value in \(self.numbers1) is \(max)")
        }
        
        findLargestNumberFromGivenArray(numbers2) { (max) -> () in
            print("maximum value in \(self.numbers2) is \(max)")
        }
        findLargestNumberFromGivenArray(numbers3) { (max) -> () in
            print("maximum value in \(self.numbers3) is \(max)")
        }
        
        combineArrayOfStringsByAddingSpacesBetweenThem(countryArray) { (resultingString) -> () in
            print("supplied array is \(self.countryArray) and resulting String is \(resultingString)")
        }
        
        
        
        sortIntegersBasedOnNumberOfDivisors(numbers1) { (rajaArray) -> () in
            print("supplied array is \(self.numbers1) and resulting Array is \(rajaArray)")
        }
        
        
        findSumOfSquaresOfAllOddNumbersInGivenArray(numbers1) { (sum) -> () in
            print("supplied array is \(self.numbers1) and resulting sum of squares of odd numbers is \(sum)")
        }
        
        
        functionThatCallsTheClosureForEachElementOfGivenIntegerArray(numbers1) {
             print("supplied array is \(self.numbers1) and current value  is \($0)")
        }
        
        forEach(numbers3) {
            print("supplied array is \(self.numbers3) and current value  is \($0)")
        }
        
        
        combineArrays(numbers1, array2: numbers2) { (x, y) -> Int in
            return x + y
        }
        
        
        
        
        
        
        
    }

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
/*
    func functionThatTakesAClosureWhichTakesNothingAndReturnsNothing(completion: () -> ()){
        print("before calling closure takesnothing and returns nothing.")
        completion()
    }
    
    
    func functionThatTakesAClosureWhichTakesStringAndReturnsNothing(onCompletion completion: (newString : String) -> () ){
        print("before calling closure takes String and returns nothing.")
       completion(newString: "After calling closure --> takes String and returns nothing.")
    }
    
    func functionThatTakesATwoIntsAndReturnsSumUsingClosure(x:Int, y: Int, completion : (result : Int)->()){
        print("The supplied Values are x = \(x), y = \(y)")
        completion(result: x + y)
    }
   
    */
    func functionThatTakesArrayOfStrngsAndSortThem(countryArray : [String], completion : (resultArray : [String]) -> ()){
        print("The supplied Array Elements are ")
        var sortedArray = [String]()
        for i in countryArray {
            sortedArray = countryArray.sort(backwards)
            print(i)
        }
        completion(resultArray: sortedArray)
    }
    
    func backwards(s1: String, _ s2: String) -> Bool {
        return s1 > s2
    }
   // MARK:- Write a function named applyKTimes that takes an integer K and a closure and calls the closure K times. The closure will not take any parameters and will not have a return value.
    
    func applyKTimes(val : Int, closure : () -> ()){
        for _ in 0..<val {  // for _ in 1...val { closure() }
            closure()
        }
        return
    }
    
    //MARK:- Use filter to create an array called multiples that contains all the multiples of 3 from numbers and then print it.
    func multiplesOfThreeUsingFilterAndClosure(numberOfArrays : Int, closure :(resultArray : [Int])->()) {
        for i in 0..<numberOfArrays {
            if i == 0 {
                print("supplied Array is \(numbers1)")
                let newVal = numbers1.filter{$0 % 3 == 0}
                closure(resultArray: newVal)
            }else if i == 1 {
                print("supplied Array is \(numbers2)")
                let newVal = numbers2.filter{$0 % 3 == 0}
                closure(resultArray: newVal)
            }else if i == 2 {
                print("supplied Array is \(numbers3)")
                let newVal = numbers3.filter{$0 % 3 == 0}
                closure(resultArray: newVal)
            }
            
            
 
        }
    }
    
    
    
    //MARK:- Find the largest number from numbers and then print it. Use reduce to solve this exercise.
    
    func findLargestNumberFromGivenArray(numArray : [Int], closure : (max : Int) -> ()){
        
        let max = numArray.reduce(numArray[0]) {
            if $0 > $1 {
                return $0
            } else {
                return $1
            }
        }
        closure(max: max)
    }
    
    
    //MARK:- Join all the strings from stringsArray into one using reduce. Add spaces in between strings. Print your result.
    
    func combineArrayOfStringsByAddingSpacesBetweenThem(stringArray : [String], completion : (resultingString : String)->()){
        let combinedString = stringArray.reduce(""){
            if $0 == "" {
                return $1
            }else {
                 return $0 + " " + $1
            }
        }
        completion(resultingString: combinedString)
    }

    //Mark:- Sort numbers in ascending order by the number of divisors. If two numbers have the same number of divisors the order in which they appear in the sorted array does not matter.
    
    func sortIntegersBasedOnNumberOfDivisors(var intArray : [Int], closure : ([Int])->()) {
          //  Input:
        var numbers = [1, 2, 3, 4, 5, 6]
        // Expected values:
        
        numbers = [1, 2, 3, 5, 4, 6]
        // 1 has one divisor
        // 2, 3 and 5 have 2
        // 4 has 3 divisors
        // 6 has 4 divisors
        
        // [1, 5, 2, 3, 4, 6] would also have been a valid solution
        
       // Hint : You’ll have to pass a closure that tells you how the numbers should be compared.
        
        // solution :
      
        /*
        numbers.sortInPlace { (x, y) -> Bool in
            func divisersCont(number : Int) -> Int {
                var count = 0
                for i in 1...number {
                    if number % i == 0 {
                        count++
                        
                    }
                }
                return count
            }
            return divisersCont(x) < divisersCont(y)
        }
        
        */
        
        intArray.sortInPlace({ x, y in
            func countDivisors(number: Int) -> Int {
                var count = 0
                for i in 1...number {
                    if number % i == 0 {
                        ++count
                    }
                }
                return count
            }
            return countDivisors(x) < countDivisors(y)
        })
        closure(intArray)
    }
    
    //Mark:- Find the sum of the squares of all the odd numbers from numbersArray and then print it. Use map, filter and reduce to solve this problem.
    
    func findSumOfSquaresOfAllOddNumbersInGivenArray(intArray : [Int], completion : (sum : Int) -> ()){
        
        var tempArray = intArray.filter{$0 % 2 == 1}
        var sum = 0
       tempArray = tempArray.map { $0 * $0 }
        sum = tempArray.reduce(0) { $0 + $1 }
        completion(sum: sum)
        
         //by using Chaining functions it can be done in one line as shown below
        
        completion(sum: intArray.filter{$0%2 == 1}.map { $0 * $0 }.reduce(0) { $0 + $1 })
        
        // or
        
        
        var newnumbers = [1, 2, 3, 4, 5, 6]
        
        let newsum = newnumbers.filter {
            $0 % 2 == 1 //select all the odd numbers
            }.map {
                $0 * $0 // square them
            }.reduce(0, combine: +) // get their sum
        
        print(newsum)
    }
    
    //MARK:- Implement a function forEach(array: [Int], _ closure: Int -> ()) that takes an array of integers and a closure and runs the closure for each element of the array.
    
    func functionThatCallsTheClosureForEachElementOfGivenIntegerArray(intArray : [Int], closure : (val : Int) -> ()) {
        for i in intArray {
            closure(val: i)
        }
    }
    
    
    // OR
    func forEach(array: [Int], _ closure: Int -> ()) {
        for i in array {
            closure(i)
        }
    }
    
    
    //MARK:- Implement a function "combineArrays" that takes 2 arrays and a closure that combines 2 Ints into a single Int. The function combines the two arrays into a single array using the provided closure. Assume that the 2 arrays have equal length.
    
    
    func combineArrays(array1 : [Int], array2 : [Int], closure :(Int, Int) -> Int) {
        
        var tempArray = [Int]()
        for i in 0..<array1.count {
            tempArray.append(closure(array1[i], array2[i]))
        }
        print("The supplied Arrays Are \(array1) and \(array2) the resukt array is \(tempArray)")
    }
    
}

