//
//  ViewController.swift
//  SwiftDemo
//
//  Created by reino-wang on 05/18/2020.
//  Copyright (c) 2020 reino-wang. All rights reserved.
//

import UIKit
import SwiftDemo

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Learning Memory"
        
        test()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

struct Theme {
    var name: String
    var vcName: String
}

// MARK: tableView datasource and delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    static let themes:[Theme] = [
        Theme(name:"Static", vcName:"StaticStorageViewController")
    ]
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.themes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "Cell")
        }
        
        let theme = ViewController.themes[indexPath.row]
        cell?.textLabel?.text = theme.name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let theme = ViewController.themes[indexPath.row]
        let vcName = theme.vcName
        let anyClass: AnyClass? = NSClassFromString(vcName)
        guard let typeClass = anyClass as? UIViewController.Type else{
            return
        }
        let vc = typeClass.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController{
    func test() {
        var tt = 1
        withUnsafePointer(to: &tt) {print($0)}
        
//        test(a: UnsafePointer<String>(&tt))
        
    }
    
    func test(a: UnsafePointer<String>) {
        let b = UnsafeRawPointer(a)
        print("pointer::\(a)")
        let t = b.load(as: String.self)
        print("value::" + t)
    }
    
    func address(o: UnsafeRawPointer) -> String {
        return String.init(format: "%018p", Int(bitPattern: o))
    }
}
