//
//  Functions.swift
//  TimPhanTuLonHon
//
//  Created by Trần Văn Cam on 27/10/2022.
//

import Foundation

func bai3() {
    let array = [2,6,3,4,8,0,7,5,3,6,8,9,2,1]

    for (index, value) in array.enumerated() {
        var count = 0
        for i in index..<array.count {
            if value < array[i] {
                print("Sau phần tử thứ \(index) có giá trị \(value), các phần tử lớn hơn là ")
                count += 1
            }
        }
        if count == 0 {
            count = -1
        }
    }
}
