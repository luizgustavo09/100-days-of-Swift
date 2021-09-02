//
//  ViewController.swift
//  Project2
//
//  Created by Luiz Gustavo Silva Aguiar on 30/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var answered = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion()
        // Do any additional setup after loading the view.
    }
    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = "What is the flag of " + countries[correctAnswer].uppercased() + "?"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        var ac = UIAlertController()
        answered+=1
        if sender.tag == correctAnswer{
            score+=1
            title = "Correct"
        }
        else{
            title = "Wrong, that's the flag of \(countries[correctAnswer])"
        }
        message = "Your score is \(score)"
        if answered==10{
            title = "Congratulations!!"
            message = "You got \(score) of 10 flags"
        }
        ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: answered==10 ? "Play again" : "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
}

