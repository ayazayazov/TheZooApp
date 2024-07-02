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
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
