//
//  Alert.swift
//  AlternativeIconExample
//
//  Created by KimTae jun on 2017. 7. 16..
//  Copyright © 2017년 TAEJUN KIM. All rights reserved.
//

import UIKit

public struct Alerter<T> {
  let alertable: T
  init(_ alertable: T) {
    self.alertable = alertable
  }
}

public protocol Alertable {
}

public extension Alertable {
  var alert: Alerter<Self> {
    return Alerter(self)
  }
}

public extension Alerter where T: UIViewController {
  func present(title: String?, message: String?) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let closeAction = UIAlertAction(title: "Close", style: .cancel)
    alert.addAction(closeAction)
    self.alertable.present(alert, animated: true, completion: nil)
  }
}


extension UIViewController: Alertable { }
