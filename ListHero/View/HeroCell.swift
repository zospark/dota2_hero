//
//  HeroCell.swift
//  ListHero
//
//  Created by developer team on 17/10/2562 BE.
//  Copyright © 2562 developer team. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class HeroCell: UITableViewCell {
    
    private let nameLabel = UILabel()
    private let detailLabel = UILabel()
    private let heroImage = UIImageView()
    
    var heroViewModel: HeroViewModel! {
        didSet {
            nameLabel.text = heroViewModel.name
            detailLabel.text = heroViewModel.type.rawValue
            heroImage.kf.setImage(with: URL(string: heroViewModel.image))
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
//        textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        textLabel?.numberOfLines = 1
//
//        detailTextLabel?.textColor = .black
//        detailTextLabel?.font = UIFont.systemFont(ofSize: 18, weight: .light)
        setupCell()
        
        selectionStyle = .none
        layoutMargins = .zero
        preservesSuperviewLayoutMargins = false
    }
    
    private func setupCell() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(detailLabel)
        contentView.addSubview(heroImage)
        heroImage.contentMode = .scaleAspectFill
        heroImage.clipsToBounds = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        heroImage.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.leftAnchor.constraint(equalTo: heroImage.leftAnchor, constant: -16).isActive = true
        heroImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        heroImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        contentView.centerYAnchor.constraint(equalTo: heroImage.centerYAnchor, constant: 0).isActive = true
        
        heroImage.rightAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: -8).isActive = true
        heroImage.rightAnchor.constraint(equalTo: detailLabel.leftAnchor, constant: -8).isActive = true
        
        contentView.rightAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 16).isActive = true
        contentView.rightAnchor.constraint(equalTo: detailLabel.rightAnchor, constant: 16).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: heroImage.topAnchor, constant: 0).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: heroImage.bottomAnchor, constant: 0).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
