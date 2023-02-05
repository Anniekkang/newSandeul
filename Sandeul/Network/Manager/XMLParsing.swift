//
//  XMLParsing.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/04.
//

import UIKit


extension UIViewController : XMLParserDelegate {
    
    struct constant {
        static var currentElement : String = "currentElement"
        static var model : MountainModel = MountainModel()
        static var models : [MountainModel] = []
    }
    
    //delegate 임명
    public func setParser(from url: URL) {
        guard let parser = XMLParser(contentsOf: url) else { return }
        parser.delegate = self
        if parser.parse() {
            
            print("parsing succeed")
            //UserDefaults.standard.set(true, forKey: "first")
            
        } else {
            print("parsing error")
        }
        
    }
    
    // XML 파서가 시작 태그를 만나면 호출됨
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName Name: String?, attributes attributeDict: [String : String] = [:]) {
        
        
        print(elementName)
        constant.currentElement = elementName
        
        if elementName == "item" {
            constant.model = MountainModel()
        }
        
    }
    
    // 그 태그에 담겨있는 문자열 전달
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        print("string : \(string)")
       
        
        if constant.currentElement == "mntheight" {
            constant.model.altitude = string
        } else if constant.currentElement == "areanm" {
            constant.model.location = string
        } else if constant.currentElement == "mntnm" {
            constant.model.title = string
            print("title : \(constant.model.title)")
        } else if constant.currentElement == "etccourse" {
            constant.model.course = string
        }
        
        
        
    }
    
    // XML 파서가 종료 태그를 만나면 호출됨
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
       
        print("=======\(elementName)")
        if elementName == "item" {
            constant.models.append(constant.model)
            print("model : \(constant.model.title)")
        }
        print("총갯수 : \(constant.models.count)")
    }
    
    
    
    
}


