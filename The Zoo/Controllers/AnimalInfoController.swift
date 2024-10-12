//
//  AnimalInfoController.swift
//  The Zoo
//
//  Created by Ayaz Ayazov on 02.07.24.
//

import UIKit

class AnimalInfoController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var animalBackgroundView: UIImageView!
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalImageHeight: NSLayoutConstraint!
    
    @IBOutlet weak var animalBackgroundViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var animalNameLabel: UILabel!
    
    @IBOutlet weak var animalnfoTextView: UITextView!
    
    
    var zooList = [ZooListModel]()
    var zooIndex: Int?
    var animalIndex: Int?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parseCountryFile()

        backgroundView.layer.cornerRadius = 393/2
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        animalBackgroundView.layer.cornerRadius = animalBackgroundView.frame.width/2
        animalBackgroundViewHeight.constant = animalBackgroundView.frame.width
        animalImageView.image = UIImage(named: "\(zooList[zooIndex ?? 0].animals?[animalIndex ?? 0].imageTransparent ?? "north-american-beaver")")
        animalImageView.layer.cornerRadius = animalImageView.frame.width/2
        animalImageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        animalImageHeight.constant = animalImageView.frame.width + 100
//        animalImageView.layer.masksToBounds = true
        animalNameLabel.text = zooList[zooIndex ?? 0].animals?[animalIndex ?? 0].name
        animalnfoTextView.text = zooList[zooIndex ?? 0].animals?[animalIndex ?? 0].info
    }
    
    func parseCountryFile() {
        if let file = Bundle.main.url(forResource: "ZooListData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: file)
                zooList = try JSONDecoder().decode([ZooListModel].self, from: data)
//                collection.reloadData()
            } catch {
//                showError(message: error.localizedDescription)
            }
        }
    }
    


}
