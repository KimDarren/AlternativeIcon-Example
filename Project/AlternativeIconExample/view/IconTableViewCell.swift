//
//  IconTableViewCell.swift
//  AlternativeIconExample
//
//  Created by KimTae jun on 2017. 7. 16..
//  Copyright © 2017년 TAEJUN KIM. All rights reserved.
//

import UIKit

class IconTableViewCell: UITableViewCell {
  
  // MARK: UI
  
  fileprivate let iconImageView = UIImageView().then {
    $0.clipsToBounds = true
    $0.contentMode = .scaleAspectFill
    $0.layer.cornerRadius = 4
  }
  
  fileprivate let nameLabel = UILabel().then {
    $0.textColor = .black
    $0.font = .systemFont(ofSize: 14,
                          weight: UIFontWeightMedium)
  }
  
  fileprivate let badge = UIView().then {
    $0.clipsToBounds = true
    $0.backgroundColor = .red
    $0.layer.cornerRadius = 2
  }
  
  
  // MARK: Initializer
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.setNeedsUpdateConstraints()
    
    self.contentView.add(
      self.iconImageView,
      self.nameLabel,
      self.badge
    )
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  // MAKR: Layout
  
  fileprivate var didMakeConstraints = false
  override func updateConstraints() {
    if !didMakeConstraints {
      self.makeConstraints()
      self.didMakeConstraints = true
    }
    
    super.updateConstraints()
  }
  
  func makeConstraints() {
    
    self.iconImageView.snp.makeConstraints { make in
      make.left.top.equalTo(15)
      make.bottom.equalTo(-15)
      make.width.equalTo(self.iconImageView.snp.height)
    }
    
    self.nameLabel.snp.makeConstraints { make in
      make.left.equalTo(self.iconImageView.snp.right).offset(5)
      make.right.equalTo(-24)
      make.centerY.equalToSuperview()
    }
    
    self.badge.snp.makeConstraints { make in
      make.right.equalTo(-15)
      make.centerY.equalToSuperview()
      make.size.equalTo(4)
    }
  }
  
  
  // MARK: Data
  
  func configure(icon: Icon) {
    self.iconImageView.image = UIImage(named: icon.imageName)
    self.nameLabel.text = icon.name
    self.badge.isHidden = !icon.isCurrentIcon
  }
  
  
  // MARK: Reuse lifecycle
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    self.iconImageView.image = nil
    self.nameLabel.text = ""
    self.badge.isHidden = true
  }
  
}
