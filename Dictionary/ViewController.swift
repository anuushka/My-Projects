//
//  ViewController.swift
//  Dictionary
//
//  Created by Anujin Baatartsogt on 7/19/18.
//  Copyright © 2018 Anujin Baatartsogt. All rights reserved.
//

import UIKit
class ViewController: UIViewController , UIScrollViewDelegate {
    
    @IBOutlet weak var labelTitle: UIButton!
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    let sb = UIStoryboard(name: "Main", bundle: nil)
    let pagecontroller = UIPageControl()
    
    var containerView : UIScrollView!
    var imageView : UIImageView!
    var labelView : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.drawUI()
        self.submitButtonClicked()
    }
    
    func drawUI(){
        
        containerView = UIScrollView(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: screenHeight))
        containerView.contentSize = CGSize(width: screenWidth*3.0, height: screenHeight)
        containerView.delegate = self
        containerView.isPagingEnabled = true
        self.view.addSubview(containerView)
        
        
        // View 1
        let view1 = UIView(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: screenHeight))
            containerView.addSubview(view1)
        
         let image1 = UIImageView(frame: CGRect(x: (screenWidth-200.0)/2, y: 60.0, width: 200.0, height: 200.0))
        image1.image = UIImage(named: "tour_image_1")
        image1.contentMode = .scaleAspectFit
        view1.addSubview(image1)
        
        let title1 = UILabel(frame: CGRect(x: (screenWidth-260.0)/2, y: 290.0, width: 260.0, height: 83.0))
        title1.font = UIFont.systemFont(ofSize: 22.0, weight: .medium)
        title1.text = "The first Japanese-Mongolian dictionary for chemistry"
        title1.textAlignment = .center
        title1.textColor = UIColor(white: 0.17, alpha: 1)
        title1.numberOfLines = 0
        view1.addSubview(title1)
        
        let desc1 = UILabel(frame: CGRect(x: (screenWidth-260)/2, y: 373.0, width: 260.0, height: 60))
        desc1.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        desc1.text = "This dictionary defines words in 3 languages: Mongolian, Japanese, and English."
        desc1.textAlignment = .center
        desc1.textColor = UIColor(white: 0.3, alpha: 1)
        desc1.numberOfLines = 0
        view1.addSubview(desc1)
        
        // View 2
        let view2 = UIView(frame: CGRect(x: screenWidth, y: 0.0, width: screenWidth, height: screenHeight))
        containerView.addSubview(view2)

        let image2 = UIImageView(frame: CGRect(x: (screenWidth-200.0)/2, y: 60.0, width: 200.0, height: 200.0))
        image2.image = UIImage(named: "tour_image_2")
        image2.contentMode = .scaleAspectFit
        view2.addSubview(image2)
        
        let title2 = UILabel(frame: CGRect(x: (screenWidth-260.0)/2, y: 290.0, width: 260.0, height: 55.0))
        title2.font = UIFont.systemFont(ofSize: 22.0, weight: .medium)
        title2.text = "Chemistry is easy if you understand the concept!"
        title2.textAlignment = .center
        title2.textColor = UIColor(white: 0.17, alpha: 1.0)
        title2.numberOfLines = 0
        view2.addSubview(title2)
        
        let desc2 = UILabel(frame: CGRect(x: (screenWidth-260)/2, y: 345.0, width: 260.0, height: 60))
        desc2.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        desc2.text = "This dictionary will also offer picture detailed explanations for you."
        desc2.textAlignment = .center
        desc2.textColor = UIColor(white: 0.3, alpha: 1.0)
        desc2.numberOfLines = 0
        view2.addSubview(desc2)
        
        
        // View 3
        let view3 = UIView(frame: CGRect(x: screenWidth * 2.0, y: 0.0, width: screenWidth, height: screenHeight))
            containerView.addSubview(view3)
        
        let image3 = UIImageView(frame: CGRect(x: (screenWidth-200.0)/2, y: 60.0, width: 200.0, height: 200.0))
        image3.image = UIImage(named: "moztw")
        image3.contentMode = .scaleAspectFit
        view3.addSubview(image3)
        
        let title3 = UILabel(frame: CGRect(x: (screenWidth-260.0)/2, y: 290.0, width: 260.0, height: 26.0))
        title3.text = "All topics in categories."
        title3.font = UIFont.systemFont(ofSize: 22.0, weight: .medium)
        title3.textAlignment = .center
        title3.textColor = UIColor(white: 0.17, alpha: 1.0)
        title3.numberOfLines = 0
        view3.addSubview(title3)
        
        let desc3 = UILabel(frame: CGRect(x: (screenWidth-260)/2, y: 324.0, width: 260.0, height: 34.0))
        desc3.text = "Each topic of the subject is divided into categories for you."
        desc3.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        desc3.textColor = UIColor(white: 0.3, alpha: 1.0)
        desc3.textAlignment = .center
        desc3.numberOfLines = 0
        view3.addSubview(desc3)
        
        // Page controller button
        pagecontroller.currentPageIndicatorTintColor = UIColor(displayP3Red: 0.105, green: 0.65, blue: 0.63, alpha: 1)

        pagecontroller.pageIndicatorTintColor = UIColor(white: 0.84, alpha: 1)
        
        let point = CGPoint(x: screenWidth/2, y: screenHeight-118)
        pagecontroller.center = point
        pagecontroller.numberOfPages = 3
        self.view.addSubview(pagecontroller)
        
        //Submit button at the right-bottom corner
        let submitButton = UIButton(frame: CGRect(x: screenWidth-130.0, y: screenHeight - 74.0, width: 100.0, height: 45))
        submitButton.backgroundColor = UIColor(displayP3Red: 0.105, green: 0.65, blue: 0.63, alpha: 1)
//        (displayP3Red: 0.96, green: 0.65, blue: 0.13, alpha: 1)

        submitButton.setTitle("Let's rock!", for: .normal)
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        self.view.addSubview(submitButton)
        submitButton.layer.cornerRadius = 6.0
        submitButton.clipsToBounds = true
        submitButton.addTarget(self, action: #selector(ViewController.submitButtonClicked), for: .touchUpInside)
        print("screen height: \(screenHeight) screen width: \(screenWidth)")
    }
    
    @objc func submitButtonClicked(){
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = sb.instantiateViewController(withIdentifier: "mainScreen")
        self.present(mainVC, animated: true, completion: nil)
        
    }
        
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = (NSInteger)(scrollView.contentOffset.x/screenWidth)
        pagecontroller.currentPage = pageNumber
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}






