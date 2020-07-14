//
//  StaticStorageViewController.swift
//  FBSnapshotTestCase
//
//  Created by WangLei on 2020/7/14.
//

import UIKit

var static_1:Int = 1
var static_2:Int = 2
var static_3:Int = 3
var static_4:Int = 1


struct TestStruct {
    var name: String
    var age: Int8
}

class TestClass {
    var name: String = ""
    var age: Int8 = 0
    
    init(name: String, age: Int8) {
        self.name = name
        self.age = age
    }
}

@objc(StaticStorageViewController)
class StaticStorageViewController: UIViewController {
    
    static var class_var_1:Int = 1
    static var class_var_2:Int = 2
    static var class_var_3:Int = 3
    static var class_var_4:Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        print("静态存储空间")
        do{
            print(UnsafePointer(&static_1))
            print(UnsafePointer(&static_2))
            print(UnsafePointer(&static_3))
            print(UnsafePointer(&static_4))
        }
        print("类变量存储空间")
        do{
            print(UnsafePointer(&StaticStorageViewController.class_var_1))
            print(UnsafePointer(&StaticStorageViewController.class_var_2))
            print(UnsafePointer(&StaticStorageViewController.class_var_3))
            print(UnsafePointer(&StaticStorageViewController.class_var_4))
        }
        print("栈变量存储空间")
        do{
            var func_var_1 = 1
            var func_var_2 = 2
            var func_var_3 = 3
            var func_var_4 = 1
            
            print("\(UnsafePointer(&func_var_1))     \(UnsafePointer(&func_var_1).pointee)")
            print("\(UnsafePointer(&func_var_2))     \(UnsafePointer(&func_var_2).pointee)")
            print("\(UnsafePointer(&func_var_3))     \(UnsafePointer(&func_var_3).pointee)")
            print("\(UnsafePointer(&func_var_4))     \(UnsafePointer(&func_var_4).pointee)")
        }
        print("swift结构体存储空间")
        do{
            var func_struct_1 = TestStruct(name: "a", age: 1)
            var func_struct_2 = TestStruct(name: "b", age: 2)
            var func_struct_3 = TestStruct(name: "c", age: 3)
            var func_struct_4 = TestStruct(name: "a", age: 1)
            
            print("\(UnsafePointer(&func_struct_1))     \(UnsafePointer(&func_struct_1).pointee)")
            print("\(UnsafePointer(&func_struct_2))     \(UnsafePointer(&func_struct_2).pointee)")
            print("\(UnsafePointer(&func_struct_3))     \(UnsafePointer(&func_struct_3).pointee)")
            print("\(UnsafePointer(&func_struct_4))     \(UnsafePointer(&func_struct_4).pointee)")
        }
        print("swift实例存储空间")
        do{
            var func_instance_1 = TestClass(name: "a", age: 1)
            var func_instance_2 = TestClass(name: "b", age: 2)
            var func_instance_3 = TestClass(name: "c", age: 3)
            var func_instance_4 = TestClass(name: "a", age: 1)
            
            print("\(UnsafePointer(&func_instance_1))  \(Unmanaged.passUnretained(func_instance_1).toOpaque()) \(UnsafePointer(&func_instance_1).pointee)")
            print("\(UnsafePointer(&func_instance_2))  \(Unmanaged.passUnretained(func_instance_2).toOpaque()) \(UnsafePointer(&func_instance_2).pointee)")
            print("\(UnsafePointer(&func_instance_3))  \(Unmanaged.passUnretained(func_instance_3).toOpaque()) \(UnsafePointer(&func_instance_3).pointee)")
            print("\(UnsafePointer(&func_instance_4))  \(Unmanaged.passUnretained(func_instance_4).toOpaque()) \(UnsafePointer(&func_instance_4).pointee)")
        }
        print("swift字符串存储空间")
        do{
            var func_string_1 = "123"
            var func_string_2 = "1234567890"
            var func_string_3 = "123456789012345"
            var func_string_4 = "12345678901234567890"
            
            print("\(UnsafePointer(&func_string_1))  \(UnsafePointer(&func_string_1).pointee) \(MemoryLayout.size(ofValue: func_string_1))")
            print("\(UnsafePointer(&func_string_2))  \(UnsafePointer(&func_string_2).pointee) \(MemoryLayout.size(ofValue: func_string_2))")
            print("\(UnsafePointer(&func_string_3))  \(UnsafePointer(&func_string_3).pointee) \(MemoryLayout.size(ofValue: func_string_3))")
            print("\(UnsafePointer(&func_string_4))  \(UnsafePointer(&func_string_4).pointee) \(MemoryLayout.size(ofValue: func_string_4))")
        }
        print("swift数组存储空间")
        do{
            var func_array_1:[Int] = [1,2,3]
            var func_array_2 = ["1","2","3"]
            
            print("\(UnsafePointer(&func_array_1))  \(UnsafePointer(&func_array_1).pointee) \(MemoryLayout.size(ofValue: func_array_1))")
            print("\(UnsafePointer(&func_array_2))  \(UnsafePointer(&func_array_2).pointee) \(MemoryLayout.size(ofValue: func_array_2))")
//
//            print("\(UnsafePointer(&func_array_1))  \(Unmanaged.passUnretained(func_array_1).toOpaque())")
//            print("\(UnsafePointer(&func_array_2))  \(Unmanaged.passUnretained(func_array_2).toOpaque())")
        }
    }
    
    func address(o: UnsafeRawPointer) -> String {
         return String.init(format: "%018p", Int(bitPattern: o))
     }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
