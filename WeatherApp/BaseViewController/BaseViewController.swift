//
//  BaseViewController.swift
//  WeatherApp
//
//  Created by Raza on 23/04/22.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func presentMessage(_ message:String?){

        let alertMessageController = UIAlertController(title: "",
                                                       message: message,
                                                       preferredStyle: UIAlertController.Style.alert)

        let okAction = UIAlertAction(title: "ok",
                                     style: .default,
                                     handler: nil)

        alertMessageController.addAction(okAction)
        self.present(alertMessageController, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
