//
//  QuestionView.swift
//  Dictionary
//
//  Created by Anujin Baatartsogt on 7/30/18.
//  Copyright © 2018 Anujin Baatartsogt. All rights reserved.
//

import UIKit

class QuestionView: UIView {
    
    
    var questionLabel = UILabel()
    var answer1button = UIButton()
    var answer2button = UIButton()
    var answer3button = UIButton()
    var answer4button = UIButton()
    
    var score = 0
    var quiz : Quiz!
    var selectIndex = -1

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setQuiz(q : Quiz, target : Any, sel : Selector ){
        self.quiz = q
        
        print("answers : \(quiz.answers)")
        let screenWidth = frame.width
                
        questionLabel.frame = CGRect(x: 30.0, y: 131.0, width: screenWidth-60.0, height: 58.0)
        questionLabel.textColor = UIColor(white: 0.29, alpha: 1)
        questionLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        questionLabel.text = NSString(format: "What is word: %@?", quiz.question) as String
        self.addSubview(questionLabel)
        questionLabel.numberOfLines = 0
        questionLabel.sizeToFit()
        
        print("label height: \(questionLabel.frame.size.height)")
        let margin : CGFloat = screenWidth == 320.0 ? 15.0 : 20.0
        let buttonHeight : CGFloat = screenWidth == 320 ? 40.0 : 45.0
        
        var topY : CGFloat = 142.0 + margin + questionLabel.frame.size.height
        answer1button.frame = CGRect(x: 30.0, y: topY, width: screenWidth-60.0, height: buttonHeight)
        answer1button.setTitle(NSString(format: "    A %@", quiz.answers[0]) as String, for: .normal)
        answer1button.setTitleColor(UIColor(white: 0.29, alpha: 1), for: .normal)
        answer1button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        answer1button.clipsToBounds = true
        answer1button.layer.cornerRadius = 6.0
        answer1button.layer.borderColor = UIColor(white: 0.91, alpha: 1).cgColor
        answer1button.layer.borderWidth = 2.0
        answer1button.contentHorizontalAlignment = .left
        answer1button.addTarget(target, action: sel, for: .touchUpInside)
        answer1button.tag = 0
        self.addSubview(answer1button)
        
        topY += buttonHeight + margin
        answer2button.frame = CGRect(x: 30.0, y: topY, width: screenWidth-60.0, height: buttonHeight)
        answer2button.setTitle(NSString(format: "    B %@", quiz.answers[1]) as String, for: .normal)
        answer2button.setTitleColor(UIColor(white: 0.29, alpha: 1), for: .normal)
        answer2button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        answer2button.clipsToBounds = true
        answer2button.layer.cornerRadius = 6.0
        answer2button.layer.borderColor = UIColor(white: 0.91, alpha: 1).cgColor
        answer2button.layer.borderWidth = 2.0
        answer2button.contentHorizontalAlignment = .left
        answer2button.addTarget(target, action: sel, for: .touchUpInside)
        answer2button.tag = 1
        self.addSubview(answer2button)
        
        topY += buttonHeight + margin
        answer3button.frame = CGRect(x: 30.0, y: topY, width: screenWidth-60.0, height: buttonHeight)
        answer3button.setTitle(NSString(format: "    C %@", quiz.answers[2]) as String, for: .normal)
        answer3button.setTitleColor(UIColor(white: 0.29, alpha: 1), for: .normal)
        answer3button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        answer3button.clipsToBounds = true
        answer3button.layer.cornerRadius = 6.0
        answer3button.layer.borderColor = UIColor(white: 0.91, alpha: 1).cgColor
        answer3button.layer.borderWidth = 2.0
        answer3button.contentHorizontalAlignment = .left
        answer3button.addTarget(target, action: sel, for: .touchUpInside)
        answer3button.tag = 2
        self.addSubview(answer3button)
        
        topY += buttonHeight + margin
        answer4button.frame = CGRect(x: 30.0, y: topY, width: screenWidth-60.0, height: buttonHeight)
        answer4button.setTitle(NSString(format: "    D %@", quiz.answers[3]) as String, for: .normal)
        answer4button.setTitleColor(UIColor(white: 0.29, alpha: 1), for: .normal)
        answer4button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        answer4button.clipsToBounds = true
        answer4button.layer.cornerRadius = 6.0
        answer4button.layer.borderColor = UIColor(white: 0.91, alpha: 1).cgColor
        answer4button.layer.borderWidth = 2.0
        answer4button.contentHorizontalAlignment = .left
        answer4button.addTarget(target, action: sel, for: .touchUpInside)
        answer4button.tag = 3
        self.addSubview(answer4button)
    }
    convenience init(){
        self.init(frame: CGRect.zero)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func answerbuttonclicked(button : UIButton) {
        let color = UIColor(displayP3Red: 0.105, green: 0.65, blue: 0.63, alpha: 1)
        answer1button.layer.borderColor = UIColor(white: 0.87, alpha: 1).cgColor
        answer2button.layer.borderColor = UIColor(white: 0.87, alpha: 1).cgColor
        answer3button.layer.borderColor = UIColor(white: 0.87, alpha: 1).cgColor
        answer4button.layer.borderColor = UIColor(white: 0.87, alpha: 1).cgColor
        button.layer.borderColor = color.cgColor
        
        let answerIndex = button.tag
        score = answerIndex == quiz.answers.index(of: quiz.correctAnswer) ? 1 : 0
        selectIndex =  button.tag
    }
    
    func checkAnswer() {
        let wrongColor = UIColor(displayP3Red: 1.0, green: 0.35, blue: 0.35, alpha: 1)
        let correctColor = UIColor(displayP3Red: 0.72, green: 0.91, blue: 0.525, alpha: 1)
        var correctIndex = quiz.answers.index(of: quiz.correctAnswer)
        self.changebordercolor(color: correctIndex == selectIndex ? correctColor : wrongColor, index: selectIndex )
        self.changebordercolor(color: correctColor, index: correctIndex!)
    }
    
    func changebordercolor(color : UIColor, index : Int) {

        switch index {
        case 0:
            answer1button.layer.borderColor = color.cgColor
            break
        case 1:
            answer2button.layer.borderColor = color.cgColor
            break
        case 2:
            answer3button.layer.borderColor = color.cgColor
            break
        case 3:
            answer4button.layer.borderColor = color.cgColor
            break
        default:
            break
        }
    }
}
