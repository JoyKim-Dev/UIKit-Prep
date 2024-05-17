//
//  ViewController.swift
//  sesac exercise_0514
//
//  Created by Joy Kim on 5/14/24.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var firstMovieImage: UIImageView!
    
    @IBOutlet weak var secondMovieImage: UIImageView!
    
    @IBOutlet weak var thirdMovieImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstMovieImage.layer.cornerRadius = firstMovieImage.frame.width / 2
        firstMovieImage.clipsToBounds = true
        firstMovieImage.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        firstMovieImage.layer.borderWidth = 2

        secondMovieImage.layer.cornerRadius = secondMovieImage.frame.width / 2
        secondMovieImage.clipsToBounds = true
        secondMovieImage.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        secondMovieImage.layer.borderWidth = 2
        
        thirdMovieImage.layer.cornerRadius = thirdMovieImage.frame.width / 2
        thirdMovieImage.clipsToBounds = true
        thirdMovieImage.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        thirdMovieImage.layer.borderWidth = 2
    }


}

