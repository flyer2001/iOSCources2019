//
//  Cource.swift
//  Altarix API Homework
//
//  Created by Sergey Popyvanov on 26.11.2019.
//  Copyright © 2019 Sergey Popyvanov. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class Cource : Object, Decodable {
    @objc dynamic var event: Event?
    
    enum CodingKeys: String, CodingKey {
        case event
    }
    
    required init(event: Event){
        self.event = event
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        event = try container.decode(Event.self, forKey: .event)
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
    
    enum CodingKeys: String, CodingKey {
        case title
        case dayes
    }
            
    required init(title: String){
        self.title = title
        super.init()
    }
    
    required init() {
        title = ""
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        
        let dayesParsing = try container.decode([Day].self, forKey: .dayes)   // парсить List научитсья +  убрат паррент + appen в самом классе
        
        dayes.append(objectsIn: dayesParsing)
        
        super.init()
    }
    
    
}

class Day : Object, Decodable {
    @objc dynamic var title: String
    var items = List<Item> ()
    
    enum CodingKeys: String, CodingKey {
        case title
        case items
    }
    
    required init(title: String){
        self.title = title
        super.init()
    }
    
    required init() {
        title = ""
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        
        let itemsParsing = try container.decode([Item].self, forKey: .items)
        items.append(objectsIn: itemsParsing)
        super.init()
    }
    
    
}

@objcMembers class Item : Object, Decodable {
    
    @objc dynamic var title: String
    @objc dynamic var itemDescription: String
    @objc dynamic var timeString: String
    var links = List<Links>()
    
    enum CodingKeys: String, CodingKey {
        case title
        case itemDescription
        case timeString
        case links
    }
    
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
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        itemDescription = try container.decode(String.self, forKey: .itemDescription)
        timeString = try container.decode(String.self, forKey: .timeString)
        
        let linksParsing = try container.decode([Links].self, forKey: .links)
        links.append(objectsIn: linksParsing)
        super.init()
    }
  
}

@objcMembers class Links: Object, Decodable {
    @objc dynamic var url: String
    @objc dynamic var title: String
    
    enum CodingKeys: String, CodingKey {
        case url
        case title
    }

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
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        url = try container.decode(String.self, forKey: .url)
        super.init()
    }
    
    
}
