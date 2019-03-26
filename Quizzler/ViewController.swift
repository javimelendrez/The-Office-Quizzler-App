//
//  ViewController.swift
//  Quizzler
//

import UIKit
class ViewController: UIViewController {
    
    //Place your instance variables here
    //this initialize a new questionbank object
    //its like = new object()
    let allQuestions = QuestionBank()
    
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0 //going to keep track of the state of the app , which question are they on
    var score : Int = 0 // will hold the points that the user get for each right answer
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //accessing the array property of the questionBank
        //when this loads the first question will be up

        let firstQuestion = allQuestions.list[0]
        //firstquestion holds text and answer values
        //change the label to firstquestion
        questionLabel.text = firstQuestion.questionText
        
    }

//this button is linked to true and false
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        //check if tag == 1 that is true
        if sender.tag == 1
        {
            //the value should be assign to true
            pickedAnswer = true
        }
        else if sender.tag == 2
        {
            //if its not true they clicked the false button
            pickedAnswer = false
        }
        checkAnswer()
        
        //increase the quetion number
        // you cant questionNumber++
        questionNumber = questionNumber + 1
        nextQuestion()
        
        
  
    }
    
    
    func updateUI() {
      //update the score label
        scoreLabel.text = "\(score)" //has to be a string because text label is a string
        //update the progress label
        progressLabel.text = "\(questionNumber + 1)/13"
        //can not multiply the int so it has to be converted to cgfloat
        //divide the size of the frame by 13 * what question you are on
        //has to be + 1 because the question number starts at 0
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
        
    }
    

    func nextQuestion() {
        //change the text to the next question
        if questionNumber <= 12
        {
        questionLabel.text = allQuestions.list[questionNumber].questionText
            //when the next question appears call function to also update score
            updateUI()
        }else
        {
//            print("end of quiz")
//            questionNumber = 0 // reset the counter once the game is over
//            let alert = UIAlertController(title: "Awesome!", message: "You finished all the questions, do you want to start all over?", preferredStyle: .alert)
            let alert = UIAlertController(title: "Awesome", message: "You finished all the questions, do you want to start all over?", preferredStyle: .alert)
            let restart = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                     self.startOver()
            }
            alert.addAction(restart)
            present(alert, animated: true, completion: nil)
            }
        //            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
//                //
//                startOver()
//            }


//            alert.addAction(restartAction)
//            present(alert, animated: true, completion: nil)
            saveState()
        }
    
    
    func checkAnswer() {
        //we need to compare the correct answer w the picked answer
        //you can take the two lines and put them into one
        let firstQuestion = allQuestions.list[questionNumber].answer
        if pickedAnswer == firstQuestion
        {
            //implement the open source library to show success
            ProgressHUD.showSuccess("Correct")
            print("your right")
            score += 1 // increase score by one when the user is right
        }
        else{
            print("your wrong")
            ProgressHUD.showError("Wrong!")
        }
        
        }
    
    
    func startOver()
    {
        //set counter back to 0
        questionNumber = 0
        //this will change the label
        nextQuestion()
        //set score to 0
        score = 0
        updateUI()
    }
    func saveState()
    {
        let userDefaults = UserDefaults.standard
        userDefaults.set(allQuestions.list[questionNumber].questionText, forKey: "theQuestion")
        userDefaults.set(questionNumber, forKey: "theQuestionNumber")
    }
    

    
}

