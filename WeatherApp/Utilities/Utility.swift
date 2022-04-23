//
//  Utility.swift
//  WeatherApp
//
//  Created by Raza on 23/04/22.
//

import UIKit

class Utility: NSObject {
    
    static var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    static var overlayView = UIView()
    static var mainView = UIView()
    
    override init(){

    }
        
    
    static func showLoading(color: UIColor = UIColor.white) {
        
        DispatchQueue.main.async {
            if(!activityIndicator.isAnimating)
            {
                self.mainView = UIView()
                self.mainView.frame = UIScreen.main.bounds
                self.mainView.backgroundColor = UIColor.lightGray
                self.overlayView = UIView()
                self.activityIndicator = UIActivityIndicatorView()
                
                overlayView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
                overlayView.backgroundColor = UIColor(white: 0, alpha: 0.7)
                overlayView.clipsToBounds = true
                overlayView.layer.cornerRadius = 10
                overlayView.layer.zPosition = 1
                
                activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
                activityIndicator.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
                activityIndicator.style = .large
                overlayView.addSubview(activityIndicator)
                self.mainView.addSubview(overlayView)
                
                overlayView.center = (UIApplication.shared.keyWindow?.center)!
                mainView.tag = 701
                UIApplication.shared.keyWindow?.addSubview(mainView)
                activityIndicator.startAnimating()
            }
        }
        
    }
    
    static func hideLoading(){
        DispatchQueue.main.async {
            activityIndicator.stopAnimating();
            UIApplication.shared.keyWindow?.viewWithTag(701)?.removeFromSuperview()
        }
    }
}
