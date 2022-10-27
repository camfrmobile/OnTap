//
//  main.swift
//  TimPhanTuLonHon
//
//  Created by Trần Văn Cam on 26/10/2022.
//

import Foundation

//Cho dãy số tự nhiên bất kỳ gồm n phần tử. Với mỗi phần tử thứ i, hãy tìm phần tử bên phải lớn hơn nó. Nếu không tồn tại, in ra -1.

print("Nhập số phần tử của dãy số tự nhiên: ")
let n: Int = Int(readLine() ?? "") ?? 0
var i: Int = 0
while i <= 0 || i > n {
    print("Nhập vị trí phần tử lớn hơn 0 nhỏ hơn \(n): ")
    i = Int(readLine() ?? "") ?? 0
}
var array: [Int] = []
for _ in 0..<n {
    array.append(Int.random(in: 1...100))
}
print(array)

// tìm phần tử
var index = -1
for j in i..<n {
    if array[j] > array[i-1] {
        index = j
    }
}
print("Phần tử bên phải lớn hơn: ", index)
