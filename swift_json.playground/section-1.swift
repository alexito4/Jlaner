// Playground - noun: a place where people can play

import Cocoa

var str = "JSON Conversions"

let json: [String : AnyObject?] = [
    "array": [
        1,
        2,
        3,
    ],
    "boolean": true,
    "null": nil,
    "number": 123,
    "object": [
        "a": "b",
        "c": "d",
        "e": "f"
    ],
    "string": "Hello World"
]

println(json)
