//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestion = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion = allQuestion.list[questionNumber]
        questionLabel.text = ("Q\(questionNumber+1) \(firstQuestion.questionText)")
        progressLabel.text = ("\(questionNumber+1)/13")
        progressBar.frame.size.width = (view.frame.size.width / 13)
        scoreLabel.text = ("score:\(score)")
        
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
            
        }
        else if sender.tag == 2{
            pickedAnswer = false
        }
        checkAnswer()
  questionNumber += 1
        
        if questionNumber==13{
            finished()
        }
        else if questionNumber < 13 {
            nextQuestion()
        }
        
        updateUI()
        
    }
    
  
    func finished() {
        let alert = UIAlertController(title: "End of quiz", message: "You have finished the quiz succesfully and you can repeat the quit or you can quit", preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
            self.startOver()
        })
        alert.addAction(restartAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    func updateUI() {
         progressLabel.text = ("\(questionNumber+1)/13")
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
        scoreLabel.text = "score:\(score)"
    }
    

    func nextQuestion() {
        questionLabel.text = ("Q\(questionNumber+1) \(allQuestion.list[questionNumber].questionText)")
        
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestion.list[questionNumber].answer
        if correctAnswer==pickedAnswer{
            print("you got it")
            score += 1
        }
        else{
            print("wrong Answer")
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        questionLabel.text = ("Q\(questionNumber+1) \(allQuestion.list[questionNumber].questionText)")
        scoreLabel.text = "score:\(score)"
       progressBar.frame.size.width = (view.frame.size.width/13)
        progressLabel.text = "\(questionNumber+1)/13"
    }
    

    
}
