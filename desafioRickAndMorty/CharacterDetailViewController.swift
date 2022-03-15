//
//  CharacterDetailViewController.swift
//  desafioRickAndMorty
//
//  Created by Vanessa Tavares Tavernari on 25/01/2022.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    static let identifier = "DetailTableViewCell"
    
    let pictureImage = UIImageView()
    let nameLabel = UILabel()
    let specieLabel = UILabel()
    let genderLabel = UILabel()
    let statusLabel = UILabel()
    let buttonInfo = UIButton()
    
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pictureImage.translatesAutoresizingMaskIntoConstraints = false
        self.pictureImage.clipsToBounds = true
        self.pictureImage.layer.cornerRadius = 15
        self.view.backgroundColor = .lightGray

        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.font = .italicSystemFont(ofSize: 20)
        
        self.specieLabel.translatesAutoresizingMaskIntoConstraints = false
        self.specieLabel.font = .italicSystemFont(ofSize: 15)
        
        self.genderLabel.translatesAutoresizingMaskIntoConstraints = false
        self.genderLabel.font = .italicSystemFont(ofSize: 15)
        
        self.statusLabel.translatesAutoresizingMaskIntoConstraints = false
        self.statusLabel.font = .italicSystemFont(ofSize: 15)
        
        self.buttonInfo.translatesAutoresizingMaskIntoConstraints = false
        
        let backgroundViewCharacter = UIView()
        backgroundViewCharacter.translatesAutoresizingMaskIntoConstraints = false
        backgroundViewCharacter.backgroundColor = .white.withAlphaComponent(0.7)
        backgroundViewCharacter.layer.cornerRadius = 15
        
        self.view.addSubview(backgroundViewCharacter)
        self.view.addSubview(self.pictureImage)
        self.view.addSubview(self.nameLabel)
        self.view.addSubview(self.specieLabel)
        self.view.addSubview(self.genderLabel)
        self.view.addSubview(self.statusLabel)
        self.view.addSubview(self.buttonInfo)
        
        NSLayoutConstraint.activate([
            
            backgroundViewCharacter.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 350),
            backgroundViewCharacter.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            backgroundViewCharacter.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8),
            backgroundViewCharacter.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8),
            
            self.pictureImage.heightAnchor.constraint(equalToConstant: 330),
            self.pictureImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            self.pictureImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),
            self.pictureImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8),
           
            self.nameLabel.bottomAnchor.constraint(equalTo: self.pictureImage.bottomAnchor, constant: 60),
            self.nameLabel.leftAnchor.constraint(equalTo: self.pictureImage.leftAnchor,constant: 12),
            self.nameLabel.rightAnchor.constraint(equalTo: self.pictureImage.rightAnchor,constant: 12),
            
            self.specieLabel.bottomAnchor.constraint(equalTo: self.pictureImage.bottomAnchor, constant: 90),
            self.specieLabel.leftAnchor.constraint(equalTo: self.pictureImage.leftAnchor, constant: 12),
            self.specieLabel.rightAnchor.constraint(equalTo: self.pictureImage.rightAnchor, constant: 12),
           
            self.genderLabel.bottomAnchor.constraint(equalTo: self.pictureImage.bottomAnchor, constant: 120),
            self.genderLabel.leftAnchor.constraint(equalTo: self.pictureImage.leftAnchor, constant: 12),
            self.genderLabel.rightAnchor.constraint(equalTo: self.pictureImage.rightAnchor, constant: 12),
            
            self.statusLabel.bottomAnchor.constraint(equalTo: self.pictureImage.bottomAnchor, constant: 150),
            self.statusLabel.leftAnchor.constraint(equalTo: self.pictureImage.leftAnchor, constant: 12),
            self.statusLabel.rightAnchor.constraint(equalTo: self.pictureImage.rightAnchor, constant: 12),
           
            self.buttonInfo.bottomAnchor.constraint(equalTo: self.pictureImage.bottomAnchor, constant: 170),
            self.buttonInfo.leftAnchor.constraint(equalTo: self.pictureImage.leftAnchor, constant: 200),
            self.buttonInfo.rightAnchor.constraint(equalTo: self.pictureImage.rightAnchor, constant: 0),
        
        ])
    }
    
    @objc func buttonAction(_ sender: UIButton!) {
        print("Button tapped")
        
        let infoViewController = InfoViewController()
        self.present(infoViewController, animated: true) {
            infoViewController.carregarTelaInfo(character: self.character!)
        }
    }
    
    func carregarTela(character: Character) {
        self.nameLabel.text = "\(character.name)"
        self.specieLabel.text = "Specie: \(character.species)"
        self.genderLabel.text = "Gender: \(character.gender)"
        self.statusLabel.text = "Status: \(character.status)"
        self.buttonInfo.setTitle("+ info", for: .normal)
        self.buttonInfo.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        
        self.character = character
        
        DispatchQueue.global().async {
        
            let urlImage = character.image
            let imageUrl = URL(string: urlImage)!
            let imageData: NSData = NSData(contentsOf: imageUrl)!
            let image = UIImage(data: imageData as Data)
            
            DispatchQueue.main.async {
                self.pictureImage.image = image
            }
        }
    }
}


