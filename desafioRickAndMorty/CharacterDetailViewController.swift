//
//  CharacterDetailViewController.swift
//  desafioRickAndMorty
//
//  Created by Vanessa Tavares Tavernari on 25/01/2022.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    static let identifier = "DetailTableViewCell"
    
    let characterImage = UIImageView()
    let characterName = UILabel()
    let characterSpecie = UILabel()
    let characterGender = UILabel()
    let characterStatus = UILabel()
    let characterID = UILabel()
    let moreInformation = UIButton()
    
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.characterImage.translatesAutoresizingMaskIntoConstraints = false
        self.characterImage.clipsToBounds = true
        self.characterImage.layer.cornerRadius = 15
        self.view.backgroundColor = .lightGray

        self.characterName.translatesAutoresizingMaskIntoConstraints = false
        self.characterName.font = .italicSystemFont(ofSize: 30)
        self.characterName.textAlignment = .center
        
        self.characterSpecie.translatesAutoresizingMaskIntoConstraints = false
        self.characterSpecie.font = .italicSystemFont(ofSize: 20)
        
        self.characterGender.translatesAutoresizingMaskIntoConstraints = false
        self.characterGender.font = .italicSystemFont(ofSize: 20)
        
        self.characterStatus.translatesAutoresizingMaskIntoConstraints = false
        self.characterStatus.font = .italicSystemFont(ofSize: 20)
        
        self.characterID.translatesAutoresizingMaskIntoConstraints = false
        self.characterID.font = .italicSystemFont(ofSize: 20)
        
        self.moreInformation.translatesAutoresizingMaskIntoConstraints = false
        self.moreInformation.backgroundColor = .brown.withAlphaComponent(0.4)
        
        let backgroundViewCharacter = UIView()
        backgroundViewCharacter.translatesAutoresizingMaskIntoConstraints = false
        backgroundViewCharacter.backgroundColor = .white.withAlphaComponent(0.7)
        backgroundViewCharacter.layer.cornerRadius = 16
        
        
        self.view.addSubview(backgroundViewCharacter)
        self.view.addSubview(self.characterImage)
        self.view.addSubview(self.characterName)
        self.view.addSubview(self.characterSpecie)
        self.view.addSubview(self.characterGender)
        self.view.addSubview(self.characterStatus)
        self.view.addSubview(self.characterID)
        self.view.addSubview(self.moreInformation)
        
        NSLayoutConstraint.activate([
            
            backgroundViewCharacter.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 350),
            backgroundViewCharacter.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            backgroundViewCharacter.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8),
            backgroundViewCharacter.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8),
            
            self.characterImage.heightAnchor.constraint(equalToConstant: 330),
            self.characterImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            self.characterImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),
            self.characterImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8),

            self.characterName.topAnchor.constraint(equalTo: backgroundViewCharacter.topAnchor, constant: 20),
            self.characterName.leftAnchor.constraint(equalTo: backgroundViewCharacter.leftAnchor,constant: 15),
            self.characterName.rightAnchor.constraint(equalTo: backgroundViewCharacter.rightAnchor,constant: -15),

            self.characterSpecie.topAnchor.constraint(equalTo: self.characterName.bottomAnchor, constant: 10),
            self.characterSpecie.leftAnchor.constraint(equalTo: backgroundViewCharacter.leftAnchor, constant: 15),
            self.characterSpecie.rightAnchor.constraint(equalTo: backgroundViewCharacter.rightAnchor, constant: -15),

            self.characterGender.topAnchor.constraint(equalTo: self.characterSpecie.bottomAnchor, constant: 10),
            self.characterGender.leftAnchor.constraint(equalTo: backgroundViewCharacter.leftAnchor, constant: 15),
            self.characterGender.rightAnchor.constraint(equalTo: backgroundViewCharacter.rightAnchor, constant: -15),

            self.characterStatus.topAnchor.constraint(equalTo: self.characterGender.bottomAnchor, constant: 10),
            self.characterStatus.leftAnchor.constraint(equalTo: backgroundViewCharacter.leftAnchor, constant: 15),
            self.characterStatus.rightAnchor.constraint(equalTo: backgroundViewCharacter.rightAnchor, constant: -15),

            self.characterID.topAnchor.constraint(equalTo: self.characterStatus.bottomAnchor, constant: 10),
            self.characterID.leftAnchor.constraint(equalTo: backgroundViewCharacter.leftAnchor, constant: 15),
            self.characterID.rightAnchor.constraint(equalTo: backgroundViewCharacter.rightAnchor, constant: -15),

            self.moreInformation.leftAnchor.constraint(equalTo: backgroundViewCharacter.leftAnchor, constant: 0),
            self.moreInformation.rightAnchor.constraint(equalTo: backgroundViewCharacter.rightAnchor, constant: 0),
            self.moreInformation.bottomAnchor.constraint(equalTo: backgroundViewCharacter.bottomAnchor, constant: -16),
            
        ])
    }
    
    @objc func buttonAction(_ sender: UIButton!) {
        let infoViewController = InfoViewController()
        self.present(infoViewController, animated: true) {
            infoViewController.loadMoreCharacterDetail(character: self.character!)
        }
    }
    
    func loadCharacterDetail(character: Character) {
        self.characterName.text = "\(character.name)"
        self.characterSpecie.text = "Specie: \(character.species)"
        self.characterGender.text = "Gender: \(character.gender)"
        self.characterStatus.text = "Status: \(character.status)"
        self.characterID.text = "ID: \(character.id)"
        self.moreInformation.setTitle("+ info", for: .normal)
        self.moreInformation.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        
        
        self.character = character
        
        DispatchQueue.global().async {
        
            let urlImage = character.image
            let imageUrl = URL(string: urlImage)!
            let imageData: NSData = NSData(contentsOf: imageUrl)!
            let image = UIImage(data: imageData as Data)
            
            DispatchQueue.main.async {
                self.characterImage.image = image
            }
        }
    }
}


