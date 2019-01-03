//
//  QuizViewController.swift
//  Dictionary
//
//  Created by Anujin Baatartsogt on 7/28/18.
//  Copyright © 2018 Anujin Baatartsogt. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, UIScrollViewDelegate {
    
    let questionTime = 60
    
    var questions : [Quiz]!
    var scrollView: UIScrollView!
    let screenHeight = UIScreen.main.bounds.size.height
    let screenWidth = UIScreen.main.bounds.size.width
    
    //Score view
    let scoreLabel = UILabel()
    let scoreView = UIView()

    // Timer
    var countdownTimer: Timer!
    let timerLabel = UILabel()
    var totalTime = 60
    
    //Progress Bar
    var progressView = UIView()
    
    // Question and answer label
    var nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startTimer()
        
        let contentHeight = self.view.frame.size.height
        
        scrollView = UIScrollView(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: contentHeight))
        scrollView.contentSize = CGSize(width: screenWidth * CGFloat(questions.count), height: contentHeight)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.isScrollEnabled = false
        scrollView.contentInsetAdjustmentBehavior = .never
        self.view.addSubview(scrollView)
        for index in 0...questions.count-1 {
            let quizView = QuestionView(frame: CGRect(x: screenWidth * CGFloat(index), y: 0.0, width: screenWidth, height: contentHeight))
            quizView.setQuiz(q: questions[index], target: self, sel: #selector(nextbuttonclicked(btn:)))
            quizView.tag = 100 + index
            scrollView.addSubview(quizView)
        }
        
        
        let margin : CGFloat = screenWidth == 320.0 ? 15.0 : 20.0
        let buttonHeight : CGFloat = screenWidth == 320 ? 40.0 : 45.0
        
        let color = UIColor(displayP3Red: 0.105, green: 0.65, blue: 0.63, alpha: 1)
        let progressBgView = UIView(frame: CGRect(x: 0.0, y: 64.0, width: screenWidth, height: 6.0))
        progressBgView.backgroundColor = UIColor(white: 0.92, alpha: 1)
        self.view.addSubview(progressBgView)
        self.view.backgroundColor = UIColor.white
        progressView.frame = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 6.0)
        progressView.backgroundColor = color
        progressBgView.addSubview(progressView)
        
        let timeIcon = UIImageView(frame: CGRect(x: screenWidth/2 - 112.0, y: 92.0, width: 20.0, height: 20.0))
        timeIcon.image = #imageLiteral(resourceName: "time_icon")
        self.view.addSubview(timeIcon)
        
       
        timerLabel.frame = CGRect(x: (screenWidth/2) - 76.0, y: 90.0, width: 224.0, height: 24.0)
        timerLabel.textColor = UIColor(white: 0.29, alpha: 1)
        timerLabel.font = UIFont.systemFont(ofSize: 20.0)
        self.view.addSubview(timerLabel)
        

        
        nextButton.frame = CGRect(x: screenWidth - 150.0, y: screenHeight - buttonHeight - margin - 49.0, width: 120.0, height: buttonHeight)
        nextButton.backgroundColor = color
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.setTitle("Next", for: .normal)
        nextButton.clipsToBounds = true
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        nextButton.layer.cornerRadius = 6.0
        nextButton.setTitleColor(UIColor(white: 0.8, alpha: 1), for: .disabled)
        nextButton.isEnabled = false
        nextButton.addTarget(self, action: #selector(showPreview), for: .touchUpInside)
        self.view.addSubview(nextButton)
        
        initializeScoreView()
    }
    
    //Score view
    
    func initializeScoreView() {
        scoreView.frame = CGRect(x: screenWidth, y: 64.0, width: screenWidth, height: screenHeight - 113.0)
        scoreView.backgroundColor = UIColor.white
        self.view.addSubview(scoreView)
        
        let captionLabel = UILabel(frame: CGRect(x: 20.0, y: 42.0, width: screenWidth - 40.0, height: 29.0))
        captionLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        captionLabel.textColor = UIColor(displayP3Red: 0.105, green: 0.65, blue: 0.63, alpha: 1)
        captionLabel.text = "Your score"
        captionLabel.textAlignment = .center
        scoreView.addSubview(captionLabel)
        
        scoreLabel.frame = CGRect(x: 20.0, y: 143.0, width: screenWidth - 40.0, height: 143.0)
        scoreLabel.font = UIFont.systemFont(ofSize: 120.0)
        scoreLabel.adjustsFontSizeToFitWidth = true
        scoreLabel.textColor = UIColor(white: 0.29, alpha: 1)
        scoreLabel.text = ""
        scoreLabel.textAlignment = .center
        scoreView.addSubview(scoreLabel)
        
        let backbutton = UIButton(frame: CGRect(x: screenWidth / 2.0 - 60.0, y: screenHeight - 185.0, width: 120.0 , height: 45.0))
        backbutton.setTitle("Go back", for: .normal)
        backbutton.backgroundColor = UIColor(displayP3Red: 0.105, green: 0.65, blue: 0.63, alpha: 1)
        backbutton.setTitleColor(UIColor.white, for: .normal)
        backbutton.layer.cornerRadius = 6.0
        backbutton.clipsToBounds = true
        scoreView.addSubview(backbutton)
        backbutton.addTarget(self, action: #selector(gobackclicked), for: .touchUpInside)
    }
    
        @objc func gobackclicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func finishbuttonclicked() {
        var frame = scoreView.frame
        frame.origin.x = 0.0
        getTotalscore()
        UIView.animate(withDuration: 0.3) {
            self.scoreView.frame = frame
        }
    }
    
    
    //Timer functions
    func startTimer(){
        totalTime = questionTime
        nextButton.isEnabled = false
        if (countdownTimer != nil){
            countdownTimer.invalidate()
        }
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        timerLabel.text = "Time remaining: \(timeFormatted(totalTime))"
        if totalTime != 0{
            totalTime -= 1
        } else {
            endTimer()
        }
    }
    
    @objc func nextbuttonclicked(btn : UIButton) {
        nextButton.isEnabled = true
        currentQuestionView().answerbuttonclicked(button: btn)
    }
    
    func endTimer() {
        countdownTimer.invalidate()
        showPreview()
    }
    
    @objc func showNextQuestion(){
        let currentPage = Int(scrollView.contentOffset.x/screenWidth)
        print("current page is :\(currentPage)")
        if currentPage == questions.count - 2 {
            nextButton.setTitle("Finish", for: .normal)
        }
        if currentPage  < questions.count - 1 {
            scrollView.setContentOffset(CGPoint(x: CGFloat(currentPage + 1) * screenWidth, y: 0.0), animated: true)
            startTimer()
        }else{
            finishbuttonclicked()
        }
        reloadProgressView(page: currentPage)
    }
    
    @objc func showPreview(){
        nextButton.isEnabled = false
        currentQuestionView().checkAnswer()
        self.perform(#selector(showNextQuestion), with: nil, afterDelay: 3.0)
    }
    func reloadProgressView(page : Int){
        let width = screenWidth/CGFloat(questions.count)*(CGFloat)(page + 1)
        
        UIView.animate(withDuration: 0.3) {
            self.progressView.frame = CGRect(x: 0.0, y: 0.0, width: width, height: 6.0)
        }
        
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60 ) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func currentQuestionView()-> QuestionView{
        let currentPage = Int(scrollView.contentOffset.x/screenWidth)
        let view = scrollView.viewWithTag(100 + currentPage) as! QuestionView
        return view
    }
    
    func getTotalscore() {
        var totalScore = 0
        let  questionViews = scrollView.subviews
        for view in questionViews {
            if view.tag >= 100 {
                let questionView = view as! QuestionView
                totalScore += questionView.score
            }
        }
        scoreLabel.text = NSString(format: "%ld/%ld", totalScore, questions.count) as String
        print("total score: \(totalScore) from \(questions.count)")
    }
}
