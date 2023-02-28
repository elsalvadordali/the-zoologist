//
//  AnimalCell.swift
//  The Zoologist
//
//  Created by Tijana Jung on 2/22/23.
//

import UIKit

class AnimalCell: UITableViewCell {
    
    var animalImageView = UIImageView()
    var animalNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(animalImageView)
        addSubview(animalNameLabel)
            
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleLabelContstraints()
        

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(animal: Animal) {
        animalImageView.image = animal.image
        animalNameLabel.text = animal.name
    }
    
    func configureImageView() {
        animalImageView.layer.cornerRadius = 12
        animalImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        animalNameLabel.numberOfLines = 0
        animalNameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        animalImageView.translatesAutoresizingMaskIntoConstraints = false
        animalImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        animalImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        animalImageView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        animalImageView.widthAnchor.constraint(equalToConstant: 220).isActive = true
    }
    
    func setTitleLabelContstraints() {
        animalNameLabel.translatesAutoresizingMaskIntoConstraints = false
        animalNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        animalNameLabel.leadingAnchor.constraint(equalTo: animalImageView.trailingAnchor, constant: 20).isActive = true
        animalNameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        animalNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    

}
