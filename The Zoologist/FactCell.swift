//
//  FactCell.swift
//  The Zoologist
//
//  Created by Tijana Jung on 2/22/23.
//

import UIKit

class FactCell: UITableViewCell {
    
    var factLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(factLabel)
        configureTitleLabel()
        setTitleLabelContstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(fact: String) {
        factLabel.text = fact
    }

    
    func configureTitleLabel() {
        factLabel.numberOfLines = 0
        factLabel.adjustsFontSizeToFitWidth = true
    }

    func setTitleLabelContstraints() {
        factLabel.translatesAutoresizingMaskIntoConstraints = false
        factLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 6).isActive = true
        factLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        factLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        factLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6).isActive = true
    }
    

}
