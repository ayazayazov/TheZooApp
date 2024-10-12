//
//  ZooAnimalsController.swift
//  The Zoo
//
//  Created by Ayaz Ayazov on 01.07.24.
//

import UIKit

class ZooAnimalsController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var zooNameTitle: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var searchAnimalsInZoo: UITextField!
    
    
    var zooList = [ZooListModel]()
    var zooIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        parseCountryFile()
        
//        title = "\(zooList[zooIndex ?? 0].name ?? "Zoo Name")"
        
        zooNameTitle.text = "\(zooList[zooIndex ?? 0].name ?? "Zoo Name") Animals"
        
        searchBarView.layer.cornerRadius = 12
        searchAnimalsInZoo.placeholder = "Search animals in \(zooList[zooIndex ?? 0].name ?? "Zoo")"
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        zooList[zooIndex ?? 0].animals?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZooAnimalCell", for: indexPath) as! ZooAnimalCell
        cell.layer.cornerRadius = 60
        cell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        cell.animalImageView.layer.cornerRadius = 50
        cell.animalImageView.layer.borderWidth = 2
        cell.animalImageView.layer.borderColor = CGColor(red: 167/255, green: 190/255, blue: 121/255, alpha: 1)
        cell.animalImageView.image = UIImage(named: "\(zooList[zooIndex ?? 0].animals?[indexPath.item].image ?? "background")")
        cell.animalNameLabel.text = zooList[zooIndex ?? 0].animals?[indexPath.item].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "AnimalInfoController") as! AnimalInfoController
        controller.zooIndex = zooIndex
        controller.animalIndex = indexPath.item
        present(controller, animated: true)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
