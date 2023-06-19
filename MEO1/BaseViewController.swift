//
//  BaseViewController.swift
//  MEO1
//
//  Created by Thành Mai on 19/06/2023.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension UIViewController {
    func hidenNavigationBar(animated: Bool = false) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func showNavigationBar(animated: Bool = false) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
   
    
}

