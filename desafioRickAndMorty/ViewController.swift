//
//  ViewController.swift
//  desafioRickAndMorty
//
//  Created by Vanessa Tavares Tavernari on 21/01/2022.
//

import UIKit

class ViewController: UITableViewController {
    var result: Response?
    
    let url = "https://rickandmortyapi.com/api/character"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData(from: url)
        title = "Rick & Morty"
        
        self.tableView.register(CharacterTableViewCell.self,
                                forCellReuseIdentifier: CharacterTableViewCell.identifier)
        self.tableView.separatorStyle = .none
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier,
                                                 for: indexPath) as! CharacterTableViewCell
        let character = self.result?.results[indexPath.row]
        
        cell.loadCharacter(character: character!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let character = self.result?.results[indexPath.row]
        let characterDetailViewController = CharacterDetailViewController()
        self.present(characterDetailViewController, animated: true) {
            characterDetailViewController.loadCharacterDetail(character: character!)
        }
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
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
        task.resume()
    }
}

struct Response: Codable {
    let info: ResponseInfo
    let results: [Character]
}

struct ResponseInfo: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
struct Character: Codable {
    let id: Int
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let episode: [String]
    let url: String
    let created: String
    let name: String
    let image: String
}

struct Location: Codable {
    let name: String
    let url: String
}
