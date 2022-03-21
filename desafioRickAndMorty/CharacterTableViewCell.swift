//
//  CharacterTableViewCell.swift
//  desafioRickAndMorty
//
//  Created by Vanessa Tavares Tavernari on 24/01/2022.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    static let identifier = "CharacterTableViewCell"
    
    let characterImage = UIImageView()
    var characterName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.characterImage.translatesAutoresizingMaskIntoConstraints = false
        self.characterImage.contentMode = .scaleAspectFill
        self.characterImage.clipsToBounds = true
        self.characterImage.layer.cornerRadius = 16
        
        
        self.characterName.translatesAutoresizingMaskIntoConstraints = false
        self.characterName.font = .systemFont(ofSize: 25, weight: .light)
        self.characterName.textColor = .systemGray
        self.characterName.textAlignment = .center
        
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .white.withAlphaComponent(0.9)
        
        self.contentView.addSubview(self.characterImage)
        self.characterImage.addSubview(backgroundView)
        self.characterImage.addSubview(self.characterName)
        
        NSLayoutConstraint.activate([
            
            self.characterImage.heightAnchor.constraint(equalToConstant: 350),
            self.characterImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.characterImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8),
            self.characterImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor,constant: -8),
            
            backgroundView.topAnchor.constraint(equalTo: self.characterName.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.characterName.bottomAnchor),
            backgroundView.leftAnchor.constraint(equalTo: self.characterImage.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: self.characterImage.rightAnchor),
            
            self.characterName.bottomAnchor.constraint(equalTo: self.characterImage.bottomAnchor,constant: 0),
            self.characterName.leftAnchor.constraint(equalTo: self.characterImage.leftAnchor,constant: 12),
            self.characterName.rightAnchor.constraint(equalTo: self.characterImage.rightAnchor,constant: 0),
            self.characterName.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadCharacter(character: Character) {
        self.characterName.text = "\(character.name)"
        
        DispatchQueue.global().async {
        
            let urlimage = character.image
            let imageUrl = URL(string: urlimage)!
            let imageData: NSData = NSData(contentsOf: imageUrl)!
            
            DispatchQueue.main.async {
                
                self.characterImage.image = UIImage(data: imageData as Data)
            }
        }
    }
}
