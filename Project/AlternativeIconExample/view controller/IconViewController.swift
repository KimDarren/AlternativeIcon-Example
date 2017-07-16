//
//  IconViewController.swift
//  AlternativeIconExample
//
//  Created by KimTae jun on 2017. 7. 16..
//  Copyright © 2017년 TAEJUN KIM. All rights reserved.
//

import UIKit

class IconViewController: UIViewController {
  
  // MARK: Defines
  
  struct Reusable {
    static let IconCell = "IconViewController.Reusable.IconCell"
  }
  
  
  // MAKR: UI
  
  fileprivate let tableView = UITableView().then {
    $0.backgroundColor = .white
    $0.register(IconTableViewCell.self,
                forCellReuseIdentifier: Reusable.IconCell)
  }
  
  
  // MARK: Properties
  
  fileprivate let icons = Icon.allIcons()
  

  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.setNeedsUpdateConstraints()
    
    self.title = "Alternative Icon"
    
    self.tableView.delegate = self
    self.tableView.dataSource = self
    
    self.view.add(
      self.tableView
    )
  }
  
  
  // MARK: View lifecycle (Layout)
  
  fileprivate var didMakeConstraints = false
  override func updateViewConstraints() {
    if !didMakeConstraints {
      self.makeConstraints()
      self.didMakeConstraints = true
    }
    
    super.updateViewConstraints()
  }
  
  func makeConstraints() {
    self.tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
}


extension IconViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.icons.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Reusable.IconCell, for: indexPath) as! IconTableViewCell
    let icon = self.icons[indexPath.row]
    cell.configure(icon: icon)
    
    return cell
  }
  
}

extension IconViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    guard #available(iOS 10.3, *) else {
      self.alert.present(title: "Oops!",
                         message: "Please update your device to iOS 10.3 or later.")
      return
    }
    
    let icon = self.icons[indexPath.row]
    UIApplication.shared.setAlternateIconName(icon.iconName) { [weak self] error in
      if let error = error {
        self?.alert.present(title: "Oops!",
                           message: error.localizedDescription)
        return
      }
      self?.tableView.reloadData()
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
}
