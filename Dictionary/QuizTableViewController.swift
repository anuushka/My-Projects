//
//  QuizTableViewController.swift
//  Dictionary
//
//  Created by Anujin Baatartsogt on 7/27/18.
//  Copyright © 2018 Anujin Baatartsogt. All rights reserved.
//

import UIKit

class QuizTableViewController: UITableViewController {
    
    let maximumAnswers  = 20
    
    var categories : [Category] = []
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height

    override func viewDidLoad() {
        super.viewDidLoad()
        self.generateData()
        self.tableView.separatorStyle = .none
    }
    
    func generateData() {
        categories.removeAll()
        
        //File path
        let fileSource = URL(fileURLWithPath: Bundle.main.path(forResource: "categories", ofType: "json")!)
        let data = try! Data(contentsOf: fileSource, options: Data.ReadingOptions(rawValue: 0))
        //method to create a NSdictionary from the Json data
        let categoryResult = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
        print("result: \(categoryResult)")
        let category = categoryResult as! [NSDictionary]
        for cat in category {
            let mon = cat["mon"] as! String
            let datas  = cat["data"] as! [NSDictionary]
            
            if datas.count > 3 {
                let ctg = Category()
                ctg.categoryJap = cat["jpn"] as! String
                ctg.categoryMon = mon
                ctg.words       = self.convertWords(rawWords: datas)
                categories.append(ctg)
            }
        }
        self.tableView.reloadData()
    }
    
    func convertWords(rawWords : [NSDictionary]) -> [Word] {
        //ene function n rawWords gdg array turliin utgiig huleen awaad
        //Word class iin turultei array butsaana.
        
        var serializedWords : [Word] = [] //hooson dynamic buyu urtasgah bolomjtoi array zarlaj bna
        for word in rawWords {//rawWords iig buten tsikeldej unshij bga
            let keys = word.allKeys as NSArray //dictionary utgiin buh key iig awaad array turuld convert hiij bna
            let w = Word() //hooson Word class iin instance uusgej bna
            
            for key in keys{//tuhain dictionaryd bga buh key
                let k = key as! String //key gdg variable iig string bolgoj k variable-d set hiij ugj bna
                if (k == "English"){
                    w.eng = word[k] as! String
                }else if (k == "Монгол хэл"){
                    w.mon = word[k] as! String
                } else if (k == "Image"){
                    w.image_name = word[k] as! String
                }
                else{
                    w.jap = k
                    w.fur = word[k] as! String
                }
            }
            serializedWords.append(w)//serializedWords gdg array-d convert hiisen Word class iin instance iig nemj ugj bna
        }
        return serializedWords
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        let category = categories[indexPath.row]
    
        cell.textLabel?.text = NSString(format: "%@ (%ld words)",category.categoryJap,category.words.count) as String
        
        
        let leftview = UIView(frame: CGRect(x: 5.0, y: 18.0, width: 5.0, height: 27.0))
        leftview.backgroundColor = UIColor(displayP3Red: 0.105, green: 0.65, blue: 0.63, alpha: 1)
        cell.addSubview(leftview)
        let dotsseparator = UIImageView(frame: CGRect(x: 0.0, y: 64.0, width: screenWidth, height: 3.0))
        dotsseparator.image = #imageLiteral(resourceName: "dots_separator")
        dotsseparator.contentMode = .bottomLeft
        cell.addSubview(dotsseparator)
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 67.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("selected: ]([indexPath.row]) \(indexPath.section)")
    
        let category = categories[indexPath.row] // QUIZ-n category bolgond haryalagdah ugsig holboson
        let quizVC = QuizViewController()
        quizVC.title = "Quiz"
        quizVC.questions = self.buildQuiz(words: category.words)
        self.show(quizVC, sender: nil)
    }
    
    func getRandomWord(words: [Word]) -> Int {
    return Int(arc4random_uniform(UInt32(words.count)))
    }
    
    func buildQuiz(words : [Word]) -> [Quiz] {
        var possibleWords:[Word] = []
            for word in words {
            possibleWords.append(word)
        }
        
        var quizWords:[Quiz] = []
        let quizNumbers = possibleWords.count >= maximumAnswers ? maximumAnswers : possibleWords.count
        for index in 0...quizNumbers - 1 {
            let randomWordIndex = Int(arc4random_uniform(UInt32(possibleWords.count)))
            let selectedWord = possibleWords[randomWordIndex]
            var answers:[String] = []
            let quiz = Quiz()
            answers.append(selectedWord.mon)
            
            while answers.count < 4 {
                let randomIndex = getRandomWord(words: words)
                let candidate = words[randomIndex]
                if !answers.contains(candidate.mon){
                    print("check point")
                    answers.append(candidate.mon)
                }else{
                    print("\(candidate.mon) contains in \(answers)")
                }
            }
            print("answer count: \(answers.count)")
            
        quiz.question = selectedWord.jap
        quiz.correctAnswer = selectedWord.mon
        quiz.answers = self.shuffleAnswers(answers: answers)
        possibleWords.remove(at: randomWordIndex)
        quizWords.append(quiz)
    }
        return quizWords
    }
    
    func shuffleAnswers(answers : [String])->[String]{
        
        var items = [String]()
        for answer in answers {
            items.append(answer)
        }
        
        var shuffled : [String] = []
        for i in 0..<answers.count {
            let rand = Int(arc4random_uniform(UInt32(items.count)))
            shuffled.append(items[rand])
            items.remove(at: rand)
        }
        return shuffled
    }
}
