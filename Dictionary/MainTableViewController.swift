//
//  MainTableViewController.swift
//  Dictionary
//
//  Created by Anujin Baatartsogt on 7/25/18.
//  Copyright © 2018 Anujin Baatartsogt. All rights reserved.
//

import UIKit
class MainTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var categories : [Category] = []
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    //Search bar
    let searchController = UISearchController(searchResultsController: nil)
    var filteredCategories : [Category] = []
    var detailViewController: DetailViewController? = nil

//    var startY : CGFloat = 0.0
    
    // Search bar: - Private instance method
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        
        filteredCategories.removeAll()
        
        for c in categories{
    
            let filteredResult = c.words.filter({(w: Word) -> Bool in
                return w.search_key.lowercased().contains(searchText.lowercased())
            })
            
            if filteredResult.count > 0 {
                let newCat = Category()//instance dahin uusgeh
                newCat.categoryJap  = c.categoryJap
                newCat.categoryMon  = c.categoryMon
                newCat.words        = filteredResult
                filteredCategories.append(newCat)
            }
        }
        tableView.reloadData()
    }

    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        self.generateData()
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search words"
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.hidesSearchBarWhenScrolling = true
        definesPresentationContext = true
    }
    
    func generateData() {
        
        categories.removeAll()
        
        //File path
        let filePath = URL(fileURLWithPath: Bundle.main.path(forResource: "categories", ofType: "json")!)
        let rawData = try! Data(contentsOf: filePath, options: Data.ReadingOptions(rawValue: 0))
        //method to create a NSdictionary from the Json data
        let result = try! JSONSerialization.jsonObject(with: rawData, options: .allowFragments)
        print("result: \(result)")
        let rawCategory = result as! [NSDictionary]
        
        for rawCat in rawCategory {
            let mon = rawCat["mon"] as! String
            let datas  = rawCat["data"] as! [NSDictionary]
            let c = Category()
            c.categoryJap = rawCat["jpn"] as! String
            c.categoryMon = mon
            c.words       = self.convertWords(rawWords: datas)
            categories.append(c)
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
                if (k == "English"){//
                    w.eng = word[k] as! String
                }else if (k == "Монгол хэл"){
                    w.mon = word[k] as! String
                }else if (k == "Image"){
                    w.image_name = word[k] as! String
                }
                else{
                    w.jap = k
                    w.fur = word[k] as! String
                }
            }
            w.search_key = "\(w.eng.lowercased()) + \(w.jap.lowercased()) + \(w.mon.lowercased()) + \(w.fur.lowercased())"
            serializedWords.append(w)//serializedWords gdg array-d convert hiisen Word class iin instance iig nemj ugj bna
        }
        return serializedWords
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
       return searchBarIsEmpty() ? categories.count : filteredCategories.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let category = searchBarIsEmpty() ? categories[section] : filteredCategories[section]
        return category.words.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! WordCell
        let category = searchBarIsEmpty() ? categories[indexPath.section] : filteredCategories[indexPath.section]
        let word = category.words[indexPath.row]
        
        
        let img = UIImage(named: word.image_name)
        if img == nil {
            NSLog("indexpath: \(category.categoryMon), index: \(indexPath.row), imagename: \(word.image_name)")
        }
        
         cell.jpnLabel.text = word.jap
         cell.monLabel.text = word.mon
         return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let category = searchBarIsEmpty() ? categories[section] : filteredCategories[section]

        let headerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 54.0))
        headerView.backgroundColor = UIColor.white
        
        let leftview = UIView(frame: CGRect(x: 20.0, y: 18.0, width: 5.0, height: 27.0))
        leftview.backgroundColor = UIColor(displayP3Red: 0.105, green: 0.65, blue: 0.63, alpha: 1)
//        (displayP3Red: 0.96, green: 0.65, blue: 0.13, alpha: 1)
        headerView.addSubview(leftview)
        
        let jpnLabel = UILabel(frame: CGRect(x: 30.0, y: 16.0, width: screenWidth-50.0, height: 31.0))
        jpnLabel.text = category.categoryJap
        jpnLabel.textColor = UIColor.darkText
        jpnLabel.font = UIFont.boldSystemFont(ofSize: 23.0)
        jpnLabel.numberOfLines = 0
        headerView.addSubview(jpnLabel)
        
        let cloakofinvisibilityButton = UIButton(frame: headerView.bounds)
        cloakofinvisibilityButton.addTarget(self, action: #selector(wannaSearch), for: .touchUpInside)
        headerView.addSubview(cloakofinvisibilityButton)
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 54.0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 67.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected: \([indexPath.row]) \(indexPath.section)")
        let category = searchBarIsEmpty() ? categories[indexPath.section] : filteredCategories[indexPath.section]
        let word = category.words[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.word = word
        detailVC.title = word.jap + "  " + word.mon
        self.show(detailVC, sender: nil)
    }
    
    @IBAction func WannaSeeAction(_ sender: Any) {
        wannaSearch()
    }
    
    @objc func wannaSearch(){
        print("check point")
        searchController.searchBar.becomeFirstResponder()
    }
}
