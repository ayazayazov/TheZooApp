//
//  HomeController.swift
//  The Zoo
//
//  Created by Ayaz Ayazov on 01.06.24.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var exploreButton: UIButton!
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func exploreButtonTapped(_ sender: Any) {
        userDefaults.setValue(true, forKey: "isExploreButtonTapped")
        let controller = storyboard?.instantiateViewController(identifier: "InfoController") as! InfoController
        navigationController?.show(controller, sender: nil)
    }
}
