//
//  Cource.swift
//  Altarix API Homework
//
//  Created by Sergey Popyvanov on 26.11.2019.
//  Copyright © 2019 Sergey Popyvanov. All rights reserved.
//

import Realm
import RealmSwift

class Cource : Object, Decodable {
    @objc dynamic var event: Event?
    
    required init(event: Event){
        self.event = event
        super.init()
    }
    
    required init()
    {
        event = Event()
        super.init()
    }

}

class Event : Object, Decodable {

    @objc dynamic var title: String?
    
    var dayes = List<Day>()
            
    required init(title: String){
        self.title = title
        super.init()
    }
    
    required init() {
        title = ""
        super.init()
    }
    
}

class Day : Object, Decodable {
    @objc dynamic var title: String
    var items = List<Item> ()
    
    required init(title: String){
        self.title = title
        super.init()
    }
    
    required init() {
        title = ""
        super.init()
    }
    
}

class Item : Object, Decodable {
    
    @objc dynamic var title: String
    @objc dynamic var itemDescription: String
    @objc dynamic var timeString: String
    var links = List<Links>()
    
    required init(title: String, itemDescription: String, timeString: String){
        self.title = title
        self.itemDescription = itemDescription
        self.timeString = timeString
        super.init()
    }
    
    required init() {
        title = ""
        itemDescription = ""
        timeString = ""
        super.init()
    }
  
}

class Links: Object, Decodable {
    @objc dynamic var url: String
    @objc dynamic var title: String

    required init(url: String, title: String){
        self.title = title
        self.url = url
        super.init()
    }
        
        required init() {
            title = ""
            url = ""
            super.init()
        }
    
}
