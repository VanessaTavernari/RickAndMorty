//
//  DatailViewController.swift
//  desafioRickAndMorty
//
//  Created by Vanessa Tavares Tavernari on 24/01/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var character: Character?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var specieLabel: UILabel!
}
