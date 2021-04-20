//
//  ViewController.swift
//  Project2
//
//  Created by Luciene Ventura on 27/03/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String] ()
    var score = 0
    var correctAnswer = 0
    var wrongAnswer = 0
    var questionAsked = 0
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        countries += ["estonia", "france", "germany" ,"ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us" ]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    
        button1.setImage(UIImage(named: countries[0]),for: .normal)
        button2.setImage(UIImage(named: countries[1]),for: .normal)
        button3.setImage(UIImage(named: countries[2]),for: .normal)
        
        title = "\(countries[correctAnswer].uppercased())"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "\(questionAsked)", style: .plain, target: self, action: #selector(question))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Score", style: .plain, target: self, action: #selector(showScore))
        
    }
    
    @objc func question(sender: UIBarButtonItem) {
        print("something")
        
    }
    
    @objc func showScore() {
        let ac = UIAlertController(title: "\(score)", message: nil, preferredStyle: .alert)
                present(ac, animated: true)
                ac.addAction(UIAlertAction(title: "Back to the game", style: .cancel))
    }
    
    
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct, that's \(countries[correctAnswer].uppercased())"
            score += 1
            questionAsked += 1
        } else if sender.tag == 0 {
            title = "Wrong, that's \(countries[0].uppercased())"
            
            questionAsked += 1
        } else if sender.tag == 1 {
            title = "Wrong, that's \(countries[1].uppercased())"
            
            questionAsked += 1
        } else if sender.tag == 2 {
            title = "Wrong, that's \(countries[2].uppercased())"
            
            questionAsked += 1
        } else {
            title = "Don't know what flag it is"
        }
        
    
            
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .alert)
               
                present(ac, animated: true)
                
                if questionAsked < 10 {
                    ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            } else if questionAsked == 10 {
                ac.addAction(UIAlertAction(title: "Your final score is \(score)", style: .default))
                ac.addAction(UIAlertAction(title: "Play Again", style: .default, handler: askQuestion))
                score = 0
                questionAsked = 0

            }  else if questionAsked > 10 {
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            }
        
        
}
    
    
}

