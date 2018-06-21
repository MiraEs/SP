//: Playground - noun: a place where people can play

import UIKit
/*
Question 1 -- sortByStrings(s,t): Sort the letters in the string s by the order they occur in the string t. You can assume t will not have repetitive characters. For s = "weather" and t = "therapyw", the output should be sortByString(s, t) = "theeraw". For s = "good" and t = "odg", the output should be sortByString(s, t) = "oodg".
 */

func sortByStrings(_ s: String, _ t: String) -> String {
    var map = [Int:Character]()
    var letterDict = [Character:Int]()
    let tArr = Array(t)
    var sArr = Array(s)
    var extraLetters = ""
    var sortedString = ""
    
    
    for i in 0..<tArr.count {
        map[i] = tArr[i]
    }
    
    for i in 0..<sArr.count {
        letterDict[sArr[i]] != nil ? (letterDict[sArr[i]]! += 1) : (letterDict[sArr[i]] = 1)
    }
    
    for i in 0..<tArr.count {
      let char = map[i]!
        if let _ = letterDict[char] {
            while letterDict[char] != 0 {
                sortedString.append(char)
                letterDict[char]! -= 1
            }
        } else {
            extraLetters.append(char)
        }
    }
    
    return (sortedString + extraLetters)
}

//sortByStrings("weather", "therapywg")

/*
Question 2 -- decodeString(s): Given an encoded string, return its corresponding decoded string.

The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is repeated exactly k times. Note: k is guaranteed to be a positive integer.

For s = "4[ab]", the output should be decodeString(s) = "abababab"
For s = "2[b3[a]]", the output should be decodeString(s) = "baaabaaa"
 */

func decodeString(s: String) -> String {
    var decodedArr = [String]()
    var currentStack = ""
    for i in s {
        if i != "]" {
            decodedArr.append(String(i))
        } else {
            var temp = ""
            while i != "[" {
                if let num = decodedArr.popLast() {
                    temp = num + temp
                }
            }
            decodedArr.popLast()
            var amount = 0
            if (decodedArr.count > 0 && isNumber(decodedArr[decodedArr.count-1])) {
                if let num = decodedArr.popLast() {
                    amount = Int(num)!
                }
            }
            for _ in 0...amount {
                currentStack += temp
            }
            decodedArr.append(currentStack)
        }
    }
    return currentStack
}

func isNumber(_ c: String) -> Bool {
    return !c.isEmpty && (c.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil)
}

//decodeString(s: "4[ab]")


/*
Question 3 -- changePossibilities(amount,amount): Your quirky boss collects rare, old coins. They found out you're a programmer and asked you to solve something they've been wondering for a long time.

Write a function that, given an amount of money and an array of coin denominations, computes the number of ways to make the amount of money with coins of the available denominations.

Example: for amount=4 (4¢) and denominations=[1,2,3] (1¢, 2¢ and 3¢), your program would output 4—the number of ways to make 4¢ with those denominations:
    
    1¢, 1¢, 1¢, 1¢
    1¢, 1¢, 2¢
    1¢, 3¢
    2¢, 2¢
    
*/


func changePossibilities(amount: Int, denominations: [Int]) -> Int {
    let sortedDenom = denominations.sorted { $0 > $1 }
    var roots = [Int]()
    var children = [Int]()
    
    for root in sortedDenom {
        roots.append(root)
        var count = root
        while count > 0 {
            count -= 1
            children.append(count)
        }
    }
    return roots.count
}


changePossibilities(amount: 4, denominations: [1, 2, 3])







