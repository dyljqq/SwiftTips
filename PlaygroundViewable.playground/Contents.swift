//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

//let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
//label.backgroundColor = .white
//label.font = UIFont.systemFont(ofSize: 32)
//label.textAlignment = .center
//label.text = "Hello world"
//PlaygroundPage.current.liveView = label

//class ViewController: UITableViewController {
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//
//    view.backgroundColor = .cyan
//  }
//
//}
//
//extension ViewController {
//  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return 30
//  }
//
//  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = UITableViewCell()
//    cell.textLabel?.text = String(indexPath.row)
//    cell.backgroundColor = .red
//    return cell
//  }
//}
//
//extension ViewController {
//  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    print("select: \(indexPath.row)")
//  }
//}
//
//let vc = ViewController()
//PlaygroundPage.current.liveView = vc


//let jsonString = """
//{\"menu\": {
//"id": "file",
//"value": "File",
//"popup": {
//  "menuitem": [
//  {"value": "New", "onclick": "CreateNewDoc()"},
//  {"value": "Open", "onclick": "OpenDoc()"},
//  {"value": "Close", "onclick": "CloseDoc()"}
//  ]
//}
//}}
//"""
//
//struct Obj: Codable {
//
//  let menu: Menu
//
//  struct Menu: Codable {
//    let id: String
//    let value: String
//    let popup: Popup
//  }
//
//  struct Popup: Codable {
//    let menuItem: [MenuItem]
//
//    enum CodingKeys: String, CodingKey {
//      case menuItem = "menuitem"
//    }
//  }
//
//  struct MenuItem: Codable {
//    let value: String
//    let onClick: String
//
//    enum CodingKeys: String, CodingKey {
//      case value
//      case onClick = "onclick"
//    }
//  }
//
//}
//
//let data = jsonString.data(using: .utf8)!
//do {
//  let obj = try JSONDecoder().decode(Obj.self, from: data)
//  let value = obj.menu.popup.menuItem[0].value
//  print(value)
//} catch {
//  print("出错啦")
//}

/**
 #file 包含这个符号的文件路径
 #line 符号出现处的行号
 #column 符号出现处的列号
 #functon 包含这个符号的方法名字
 **/
func printLog<T>(_ message: T,
                 file: String = #file,
                 method: String = #function,
                 line: Int = #line) {
  print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
}

printLog("这是一条输出")
