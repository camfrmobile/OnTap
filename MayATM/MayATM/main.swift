//
//  main.swift
//  MayATM
//
//  Created by Trần Văn Cam on 26/10/2022.
//

import Foundation

// Một máy ATM hiện có n (n <= 30) tờ tiền có giá trị 50.000, 100.000, 200.000, 500.000. Hãy tìm cách trả ít tờ nhất với số tiền đúng bằng S nhập từ bàn phím (mỗi loại tiền có số lượng tờ khác nhau, tổng các tờ tiền = n). Trường hợp S nhập từ bàn phím không hợp lệ, hãy đưa ra thông báo.

var n = 0
while n <= 0 || n > 30 {
    print("Nhập tổng số lượng tờ tiền, nhiều nhất 30:")
    n = Int(readLine() ?? "") ?? 0
}
print("Nhập số tiền cần rút:")
var soTienRut = Int(readLine() ?? "") ?? 0

var soTo50k = Int.random(in: 0..<n)
var soTo100k = Int.random(in: 0..<(n-soTo50k))
var soTo200k = Int.random(in: 0..<(n-soTo50k-soTo100k))
var soTo500k = n-soTo50k-soTo100k-soTo200k
soTo500k = soTo500k > 0 ? soTo500k : 0

print(soTo50k, soTo100k, soTo200k, soTo500k)
let tongSoTien = soTo50k*50000 + soTo100k*100000 + soTo200k*200000 + soTo500k*500000

if (soTienRut % 50000 != 0) {
    print("Số tiền rút phải là bội số 50.000")
    exit(0)
}
if soTienRut > tongSoTien {
    print("Số tiền rút lớn hơn số tiền trong ATM")
    exit(0)
}
var soToRut500k: Int = 0
var soToRut200k: Int = 0
var soToRut100k: Int = 0
var soToRut50k: Int = 0

soToRut500k = soTienRut / 500000
soToRut500k = min(soToRut500k, soTo500k)
soTienRut -= soToRut500k * 500000

if soTienRut > 0 {
    soToRut200k = soTienRut / 200000
    soToRut200k = min(soToRut200k, soTo200k)
    soTienRut -= soToRut200k * 200000
}
if soTienRut > 0 {
    soToRut100k = soTienRut / 100000
    soToRut100k = min(soToRut100k, soTo100k)
    soTienRut -= soToRut100k * 100000
}
if soTienRut > 0 {
    soToRut50k = soTienRut / 50000
    soToRut50k = min(soToRut50k, soTo50k)
    soTienRut -= soToRut50k * 50000
}
if soTienRut > 0 {
    print("Số tiền rút lớn hơn số tiền trong ATM")
    exit(0)
}

print("50K: ", soToRut50k)
print("100k: ", soToRut100k)
print("200k: ", soToRut200k)
print("500k: ", soToRut500k)
