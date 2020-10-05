//
//  main.swift
//  MoreSwiftFun
//
//  Created by Crawford, Chloe on 10/2/20.
//  Copyright © 2020 Crawford, Chloe. All rights reserved.
//

import Foundation

print("Hello, World!")

func getPositiveInteger() throws -> Int {
    print("Enter a positive integer:")
    guard let inputString = readLine(), let inputInt = Int(inputString), inputInt > 0 else {
        // if here, one of the boolean conditions failed
        // return as part of an early exit
        throw UserInputError.invalidPositiveInteger
    }
    // if here, the boolean conditions succeeded
    // can use input string and input int
    return inputInt
}

do{
    let value = try getPositiveInteger()
}
catch {
    print("Failed to get a positive integer")
}

enum UserInputError: Error {
    case invalidInteger
    case invalidPositiveInteger
}

// MARK: - Optional Chaining
print("Enter an integer:")
let inputStringOptional = readLine()

let numDigits = inputStringOptional?.count
print(numDigits)

// MARK: - Nil Coalescing Operator ??
if let inputString = inputStringOptional {
    let num = Int(inputString) ?? 0
    print(num)
}

// MARK: - Closure Practice

// 1. map

let nums = [1, 2, 3, 4, 5]

let numsDoubled = nums.map({(value) -> Int in
    return value * 2
})
print(numsDoubled)
// shorthand
print(nums.map{$0 * 2})

// 2. filter

let numsEven = nums.filter({ (value) -> Bool in
    if value % 2 == 0 {
        return true
    }
    return false
})
print(numsEven)

//shorthand
print(nums.filter{$0 % 2 == 0})

// 3. reduce

let product = nums.reduce(1, { (productSoFar, value) -> Int in
    return productSoFar * value
})
print(product)

// shorthand
print(nums.reduce(1) {$0 * $1})

let sentence = ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]
print(sentence)

let oSentence = sentence.filter({ (value) -> Bool in
    return value.contains("o")
})
print(oSentence)

// shorthand
print(sentence.filter{$0.contains("o")})

let capSentence = sentence.map({ (value) -> String in
    return value.uppercased()
})
print(capSentence)

// shorthand
print(sentence.map{$0.uppercased()})



print(sentence.reduce("") {$0 + String($1[$1.startIndex])})
