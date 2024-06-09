//
//  HomeController.swift
//  The Zoo
//
//  Created by Ayaz Ayazov on 01.06.24.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var exploreButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func exploreButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "TabBarController") as! TabBarController
        navigationController?.show(controller, sender: nil)
    }
    

}
