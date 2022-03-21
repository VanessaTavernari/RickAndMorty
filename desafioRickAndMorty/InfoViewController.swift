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

    let characterLocation = UILabel()
    let characterCreated = UILabel()
    let characterEpisode = UILabel()
    let characterOrigin = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        
        self.characterLocation.translatesAutoresizingMaskIntoConstraints = false
        self.characterLocation.font = .italicSystemFont(ofSize: 20)
        self.characterLocation.textColor = .brown
        self.characterLocation.numberOfLines = 3
        self.characterLocation.lineBreakMode = NSLineBreakMode.byTruncatingHead

        self.characterCreated.translatesAutoresizingMaskIntoConstraints = false
        self.characterCreated.font = .italicSystemFont(ofSize: 20)
        self.characterCreated.textColor = .brown
        self.characterCreated.numberOfLines = 3
        self.characterCreated.lineBreakMode = NSLineBreakMode.byTruncatingHead
        
        self.characterEpisode.translatesAutoresizingMaskIntoConstraints = false
        self.characterEpisode.font = .italicSystemFont(ofSize: 20)
        self.characterEpisode.textColor = .brown
        self.characterEpisode.numberOfLines = 3
        self.characterEpisode.lineBreakMode = NSLineBreakMode.byTruncatingHead
        
        self.characterOrigin.translatesAutoresizingMaskIntoConstraints = false
        self.characterOrigin.font = .italicSystemFont(ofSize: 20)
        self.characterOrigin.textColor = .brown
        self.characterOrigin.numberOfLines = 3
        self.characterOrigin.lineBreakMode = NSLineBreakMode.byTruncatingHead
        
        
        let backgroundViewCharacter = UIView()
        backgroundViewCharacter.translatesAutoresizingMaskIntoConstraints = false
        backgroundViewCharacter.backgroundColor = .white.withAlphaComponent(0.7)
        backgroundViewCharacter.layer.cornerRadius = 15
        
        self.view.addSubview(backgroundViewCharacter)
        self.view.addSubview(self.characterLocation)
        self.view.addSubview(self.characterCreated)
        self.view.addSubview(self.characterEpisode)
        self.view.addSubview(self.characterOrigin)
        
        NSLayoutConstraint.activate([
            
            backgroundViewCharacter.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            backgroundViewCharacter.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            backgroundViewCharacter.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8),
            backgroundViewCharacter.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8),
            
            self.characterCreated.topAnchor.constraint(equalTo: backgroundViewCharacter.topAnchor, constant: 50),
            self.characterCreated.leftAnchor.constraint(equalTo: backgroundViewCharacter.leftAnchor, constant: 15),
            self.characterCreated.rightAnchor.constraint(equalTo: backgroundViewCharacter.rightAnchor, constant: -15),
            
            self.characterLocation.topAnchor.constraint(equalTo: backgroundViewCharacter.topAnchor,constant: 170),
            self.characterLocation.leftAnchor.constraint(equalTo: backgroundViewCharacter.leftAnchor,constant: 15),
            self.characterLocation.rightAnchor.constraint(equalTo: backgroundViewCharacter.rightAnchor,constant: -15),
            
            self.characterOrigin.topAnchor.constraint(equalTo: backgroundViewCharacter.topAnchor, constant: 330),
            self.characterOrigin.leftAnchor.constraint(equalTo: backgroundViewCharacter.leftAnchor, constant: 15),
            self.characterOrigin.rightAnchor.constraint(equalTo: backgroundViewCharacter.rightAnchor, constant: -15),
            
            self.characterEpisode.topAnchor.constraint(equalTo: backgroundViewCharacter.topAnchor, constant: 480),
            self.characterEpisode.leftAnchor.constraint(equalTo: backgroundViewCharacter.leftAnchor, constant: 15),
            self.characterEpisode.rightAnchor.constraint(equalTo: backgroundViewCharacter.rightAnchor, constant: -15),
        ])
    }
    
    func loadMoreCharacterDetail(character: Character) {
        self.characterCreated.text = "Created: \(character.created)"
        self.characterLocation.text = "Location: \(character.location)"
        self.characterOrigin.text = "Origin: \(character.origin)"
        self.characterEpisode.text = "Episode: \(character.episode)"
     
        
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
