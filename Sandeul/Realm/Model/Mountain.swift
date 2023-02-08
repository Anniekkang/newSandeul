//
//  MountainModel.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/05.
//

import Foundation
import RealmSwift

class Mountain : Object {
    
    static var model = Mountain()
    
    @Persisted var title : String
    @Persisted var altitude : String
    @Persisted var location : String
    @Persisted var course : String
    
    @Persisted(primaryKey: true) var objectId : ObjectId //id
    
    convenience init(title : String, altitude : String, location : String, course : String){
        self.init()
        self.title = title
        self.altitude = altitude
        self.location = location
        self.course = course
        
    }
}
