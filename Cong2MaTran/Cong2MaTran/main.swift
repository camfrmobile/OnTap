//
//  main.swift
//  Cong2MaTran
//
//  Created by Trần Văn Cam on 26/10/2022.
//

import Foundation

//Cộng 2 ma trận nxn bất kì (0 < n <= 5)

var n: Int = 0
while n <= 0 || n > 5 {
    print("Nhập kích thước ma trận (0 < n <= 5):")
    n = Int(readLine() ?? "") ?? 0
}
// Khai báo và nhập 2 ma trận
var maTran1: [[Int]] = []
var maTran2: [[Int]] = []
var maTranTong: [[Int]] = []

for _ in 0..<n {
    var arr1: [Int] = []
    var arr2: [Int] = []
    for _ in 0..<n {
        arr1.append(Int.random(in: 0..<100))
        arr2.append(Int.random(in: 0..<100))
    }
    maTran1.append(arr1)
    maTran2.append(arr2)
}
print(maTran1)
print(maTran2)

// Cộng 2 ma trận
for x in 0..<n {
    var arr: [Int] = []
    for y in 0..<n {
        arr.append(maTran1[x][y] + maTran2[x][y])
    }
    maTranTong.append(arr)
}

print("Ma trận tổng: ")
print(maTranTong)
