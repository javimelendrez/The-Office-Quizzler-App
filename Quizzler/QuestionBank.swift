//
//  QuestionBank.swift
//  Quizzler
//
//  Created by javier melendrez on 10/23/18.


import Foundation
//we are going to store all te questions here
class QuestionBank{
    //creating an array of question of class
    //this is an array of questions w an answer
    var list = [Question]()
    
    init() {
        // Creating a quiz item and appending it to the list
        let item = Question(text: "In the very first episode it was Pam's first day.", correctAnswer: false)
        
        // Add the Question to the list of questions
        //append method adds it to the end of the list array
        list.append(item)
        
        // skipping one step and just creating the quiz item inside the append function
        list.append(Question(text: "Phyllis wins the Bushiest Beaver Dundie.", correctAnswer: true))
        
        list.append(Question(text: "Jim was Three Hole Punch Jim for Halloween.", correctAnswer: true))
        
        list.append(Question(text: "Jim host a BBQ that Michael is not invited to.", correctAnswer: true))
        
        list.append(Question(text: "Dwight ends up with the video iPod at the end of the Christmas Party.", correctAnswer: true))
        
        list.append(Question(text: "Pam and Roy break up on the Booze Cruise.", correctAnswer: false))
        
        list.append(Question(text: "Michael burned his foot on a George Foreman Grill.", correctAnswer: true))
        
        list.append(Question(text: "Dwight has two dates on Casino Night.", correctAnswer: false))
        
        list.append(Question(text: "Michael shows Varsity Blues for Movie Monday.", correctAnswer: true))
        
        list.append(Question(text: "Jan and Michael spent their vacation together in Sandals.", correctAnswer: true))
        
        list.append(Question(text: "Dwight calls Michael an irgnorant slut.", correctAnswer: false))
        
        list.append(Question(text: "Pam gets flashed in the parking lot.", correctAnswer: false))
        
        list.append(Question(text: "The name of Angela's cat that died was Sprinkles.", correctAnswer: true))
    }
}
