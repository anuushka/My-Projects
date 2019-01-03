//
//  DetailViewController.swift
//  Dictionary
//
//  Created by Anujin Baatartsogt on 7/25/18.
//  Copyright © 2018 Anujin Baatartsogt. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    var contentView : UIScrollView!
    var zoomableView : UIScrollView!
    var imageView : UIImageView!
    let infoLabel = UILabel()
    var word : Word!
    
    let screenWidth = UIScreen.main.bounds.size.width
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        contentView = UIScrollView(frame: self.view.bounds)
        self.view.addSubview(contentView)
        let image = UIImage(named: word.image_name)
        let imageSize = image?.size
        let imageHeight = (screenWidth*(imageSize?.height)!)/(imageSize?.width)!
        let height =  imageHeight > screenWidth ? screenWidth : imageHeight
        
        let aspect = height/(imageSize?.height)!
        
        infoLabel.text  = "You can zoom!"
        infoLabel.textColor = UIColor.white
        infoLabel.frame = CGRect(x: screenWidth/2.0 - 100.0, y: (height - 50.0)/2.0 + 64.0, width: 200.0, height: 50.0)
        infoLabel.backgroundColor = UIColor(white: 0.0, alpha: 0.6)
        self.view.addSubview(infoLabel)
        infoLabel.textAlignment = .center
        infoLabel.clipsToBounds = true
        infoLabel.layer.cornerRadius = 25.0
        
        //Pinching the image
        zoomableView = UIScrollView(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: height))
        zoomableView.delegate = self
        zoomableView.minimumZoomScale = aspect
        zoomableView.maximumZoomScale = 1.0
        contentView.addSubview(zoomableView)
        
        let imageWidth = screenWidth/aspect > (imageSize?.width)! ? screenWidth/aspect : (imageSize?.width)!
        imageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: imageWidth, height: (imageSize?.height)!))
        imageView.image = image
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFit
        zoomableView.contentSize = imageSize!
        zoomableView.addSubview(imageView)
        zoomableView.setZoomScale(aspect, animated: true)
        
        var topY = height
        createValues(originY: topY, caption: "漢字", value: word.jap)
        topY += 56.0
        
        createValues(originY: topY, caption: "Furigana", value: word.fur)
        topY += 56.0
        
        createValues(originY: topY, caption: "Монгол хэл", value: word.mon)
        topY += 56.0
        
        createValues(originY: topY, caption: "English", value: word.eng)
        topY += 56.0
        
        contentView.contentSize = CGSize(width: screenWidth, height: topY)
        
        UIView.animate(withDuration: 0.35, delay: 3.0, options: .curveEaseInOut, animations: {
            self.infoLabel.alpha = 0.0
        }, completion: nil)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        if scrollView == zoomableView {
            return self.imageView
        }
        return nil
    }
    
    func createValues(originY: CGFloat, caption: String, value: String) {
        
        let captionLabel = UILabel(frame: CGRect(x: 20.0, y: originY + 20.0, width: 100.0, height: 18.0))
        captionLabel.font = UIFont.systemFont(ofSize: 18.0)
        captionLabel.textColor = UIColor.darkText
        captionLabel.minimumScaleFactor = 14.0/UIFont.labelFontSize
        captionLabel.adjustsFontSizeToFitWidth = true
        captionLabel.text = caption
        contentView.addSubview(captionLabel)
        
        let valueLabel = UILabel(frame: CGRect(x: 130.0, y: originY + 20.0, width: screenWidth-150.0, height: 16.0))

        valueLabel.font = UIFont.systemFont(ofSize: 18.0)
        valueLabel.textColor = UIColor(displayP3Red: 0.105, green: 0.65, blue: 0.63, alpha: 1)
        valueLabel.textAlignment = .right
        valueLabel.minimumScaleFactor = 14.0/UIFont.labelFontSize
        valueLabel.adjustsFontSizeToFitWidth = true
        valueLabel.text = value
        contentView.addSubview(valueLabel)
        
        let separatorView = UIImageView(frame: CGRect(x: 0.0, y: originY + 53.0, width: screenWidth, height: 3.0))
        separatorView.image = #imageLiteral(resourceName: "dots_separator")
        separatorView.contentMode = .bottomLeft
        contentView.addSubview(separatorView)
        
    }
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
}
