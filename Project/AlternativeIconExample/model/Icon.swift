//
//  Icon.swift
//  AlternativeIconExample
//
//  Created by KimTae jun on 2017. 7. 16..
//  Copyright © 2017년 TAEJUN KIM. All rights reserved.
//

import UIKit

struct Icon {
  let identifier: String
  let name: String
  
  var isCurrentIcon: Bool {
    guard
      #available(iOS 10.3, *),
      let alternateIconName = UIApplication.shared.alternateIconName else {
      return (self.identifier == "default")
    }
    return self.imageName == alternateIconName
  }
  
  var imageName: String {
    return "AppIcon-\(self.identifier)"
  }
  
  var iconName: String? {
    guard self.identifier != "default" else {
      return nil
    }
    return self.imageName
  }
  
  // MARK: Initializer
  
  init(identifier: String, name: String) {
    self.identifier = identifier
    self.name = name
  }
  
}

extension Icon {
  static func allIcons() -> [Icon] {
    return [
      Icon(identifier: "default", name: "Default"),
      Icon(identifier: "instagram", name: "Instagram"),
      Icon(identifier: "facebook", name: "Facebook"),
      Icon(identifier: "snapchat", name: "Snapchat")
    ]
  }
}

