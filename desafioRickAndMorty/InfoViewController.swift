//
//  InfoViewController.swift
//  desafioRickAndMorty
//
//  Created by Vanessa Tavares Tavernari on 28/01/2022.
//

import UIKit

class InfoViewController: UIViewController {
    static let identifier = "InfoViewController"
    var result: Response?

    let nameInfoLabel = UILabel()
    let specieInfoLabel = UILabel()
    let genderInfoLabel = UILabel()
    let statusInfoLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        
        self.nameInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameInfoLabel.font = .italicSystemFont(ofSize: 20)
        self.nameInfoLabel.textColor = .yellow
        self.nameInfoLabel.numberOfLines = 0
        self.nameInfoLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        let backgroundViewCharacter = UIView()
        backgroundViewCharacter.translatesAutoresizingMaskIntoConstraints = false
        backgroundViewCharacter.backgroundColor = .white.withAlphaComponent(0.7)
        backgroundViewCharacter.layer.cornerRadius = 15
        
        self.view.addSubview(backgroundViewCharacter)
        self.view.addSubview(self.nameInfoLabel)
        
        NSLayoutConstraint.activate([
            
            backgroundViewCharacter.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            backgroundViewCharacter.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            backgroundViewCharacter.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8),
            backgroundViewCharacter.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8),
            
            self.nameInfoLabel.bottomAnchor.constraint(equalTo: backgroundViewCharacter.bottomAnchor,constant: -8),
            self.nameInfoLabel.leftAnchor.constraint(equalTo: backgroundViewCharacter.leftAnchor,constant: 12),
            self.nameInfoLabel.rightAnchor.constraint(equalTo: backgroundViewCharacter.rightAnchor,constant: -12),
        ])
    }
    
    func carregarTelaInfo(character: Character) {
        self.nameInfoLabel.text = "\(character.created)"
    }
    
    private func getData(from url: String) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { [self] data, response, error in
            
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            do {
                self.result = try JSONDecoder().decode(Response.self, from: data)
            }
            catch{
                print(error)
            }
        })
        task.resume()
    }
}
