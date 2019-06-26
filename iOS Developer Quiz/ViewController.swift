//
//  ViewController.swift
//  iOS Developer Quiz
//
//  Created by udom on 26/6/2562 BE.
//  Copyright © 2562 udom Neakaew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a1 = Test()
        let a2 = Test()
        let a3 = a1
        if a1 === a2 {
            print ("same")
        }
        if a1 === a3 {
            print ("like")
        }
        if a1.name == a2.name && a1.name == a3.name {
            print ("equal")
        }
    
        
        // ทดสอบ เรียกข้อ 2
        let start1 = "20150201"
        let end1 = "20150218"
        let start2 = "20150301"
        let end2 = "20150330"
        
        let type = isOverlapped(start1: start1, end1: end1, start2: start2, end2: end2)
        print("......... select type \(type)")
        
        
        // ทดสอบ เรียกข้อ 3
        let dataArray = [1,2,3,4,5]
        let selectGetMaxTwo = GetMaxTwo(numbers: dataArray)
        print("select Get Max Two ....... \(selectGetMaxTwo)")
    }
    
    
    //------------------------------------------- ข้อ 1 คำตอบ -----------------------------------------------------------
    // คำอธิบาย ข้อ 1 ค่าที่ได้คือ like equal เนื่องจาก if แรก ค่า object ของ test มีค่าไม่เท่ากันจึงไม่เข้า case แต่ case ที่ 2, 3 เมื่อเช็คเงื่อนไขแล้วถูกต้องจึงเข้า if ทำให้ปริ้นค่าออกมาเป็น like equal
    class Test {
        let name = "Test"
    }
    

    
    
    //------------------------------------------- ข้อ 2 คำตอบ -----------------------------------------------------------
    func isOverlapped(start1: String, end1: String, start2: String, end2: String) -> Bool {
        if let startDateOne = dateFormatter(date: start1),
            let endDateOne = dateFormatter(date: end1),
            let startDateTwo = dateFormatter(date: start2),
            let endDateTwo = dateFormatter(date: end2) {
            let overlap = max(0, min(endDateOne.timeIntervalSinceReferenceDate, endDateTwo.timeIntervalSinceReferenceDate)) - max(startDateOne.timeIntervalSinceReferenceDate, startDateTwo.timeIntervalSinceReferenceDate)
            if overlap > 0 {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    func dateFormatter(date: String) -> Date? {
        let dateFormat = "yyyyMMdd"
        let dateformatterGet = DateFormatter()
        dateformatterGet.dateFormat = dateFormat
        return dateformatterGet.date(from: date)
    }
    // คำอธิบาย ข้อ2 ตอนแรกเมื่อได้วันที่มา ผมก็จะนำมาแปลงให้ตรงกับ Format โดยมี Function ในการแปลง คือ dateFormatter จากนั้นนำค่าวันที่ ที่ได้ไปหาค่า max ของวันเริ่มต้นและสิ้นสุดของ 2 ช่วงเวลา เมื่อได้ค่า max มา ก็จะนำค่า max วันสิ้นสุดของ 2 ช่วงเวลามาลบกับ max ของวันเริ่มต้น 2 ช่วงเวลา โดยถ้ามีค่า น้อยกว่า 0 จะแสดง false แต่ถ้ามากกว่า 0 จะแสดงค่า true ออกมา
    
    
    //------------------------------------------- ข้อ 3 คำตอบ -----------------------------------------------------------
    func GetMaxTwo(numbers:[Int]) -> [Int] {
        var maxValue: [Int] = []
        let selectData = numbers.sorted(by: {$0 > $1})
        let data1 = selectData[0]
        let data2 = selectData[1]
        maxValue.append(data1)
        maxValue.append(data2)
        
        print("select max data two value ....... \(maxValue)")
        return maxValue
    }
    // คำอธิบาย ข้อ3 ขั้นตอนแรก ผมจะทำการ sorted ค่าที่ได้มา ให้มีค่าเรียงจาก มากไปหาน้อย จากนั้นผมสร้างตัวแปร array มา 1 ตัว เพื่อเก็บค่า จากนั้นผมก็จะทำการ append ค่าลงไปในตัวแปรนั้น โดยจะ append แค่ 2 Index คือ Index 0 และ Index 1
}

