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
 
    
    //most part of the Buttons was made on the storyboard using Auto Layout
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
        
        //this sets a right bar button that shows how many questions were madee
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "\(questionAsked)", style: .plain, target: self, action: #selector(question))
        
        //this sets a left bar button that pops up an UIAlertController that shows the score when it's tapped
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Score", style: .plain, target: self, action: #selector(showScore))
    }
    
    @objc func question(sender: UIBarButtonItem) {
        print("something")
    }
    
    //UIAlertController that was set on the left bar button
    @objc func showScore() {
        let ac = UIAlertController(title: "\(score)", message: nil, preferredStyle: .alert)
                present(ac, animated: true)
                ac.addAction(UIAlertAction(title: "Back to the game", style: .cancel))
    }


    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String = "Flags"
        
        UIView.animate(withDuration: 0.2, delay: 0, options: []) {
            
            sender.transform = CGAffineTransform(scaleX: -2, y: -2)
            
            if sender.tag == self.correctAnswer {
                title = "Correct, that's \(self.countries[self.correctAnswer].uppercased())"
                self.score += 1
                self.questionAsked += 1
                
            } else {
                
                switch sender.tag {
                case 0:
                    title = "Wrong, that's \(self.countries[0].uppercased())"
                    self.score -= 1
                    self.questionAsked += 1
                
                case 1:
                    title = "Wrong, that's \(self.countries[1].uppercased())"
                    self.score -= 1
                    self.questionAsked += 1
                   
                    
                case 2:
                    title = "Wrong, that's \(self.countries[2].uppercased())"
                    self.score -= 1
                    self.questionAsked += 1
                    
                default:
                    title = "Don't know what flag it is"
                }
                
            }
            
            sender.transform = .identity
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
               
                present(ac, animated: true)
                
                if questionAsked < 10 {
                    ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            } else if questionAsked == 10 {
                ac.addAction(UIAlertAction(title: "Your final score is \(score)", style: .default, handler: askQuestion))
                ac.addAction(UIAlertAction(title: "Play Again", style: .default, handler: askQuestion))
                score = 0
                questionAsked = 0

            }  else if questionAsked > 10 {
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            }
    }
}

