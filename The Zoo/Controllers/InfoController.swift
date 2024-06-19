//
//  InfoController.swift
//  The Zoo
//
//  Created by Ayaz Ayazov on 07.06.24.
//

import UIKit

class InfoController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var gridButton: UIButton!
    
    var isGridView = false
    var zooList = [ZooListModel]()
    
//    let blurEffect = UIBlurEffect(style: .light)
//    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.parseCountryFile()
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.isHidden = true
        searchBarView.layer.cornerRadius = 12
    }
    
    func parseCountryFile() {
        if let file = Bundle.main.url(forResource: "ZooListData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: file)
                zooList = try JSONDecoder().decode([ZooListModel].self, from: data)
                collection.reloadData()
            } catch {
                showError(message: error.localizedDescription)
            }
        }
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return zooList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZooNameCell", for: indexPath) as! ZooNameCell
        cell.zooNameLabel?.text = zooList[indexPath.item].name
        cell.contentView.layer.cornerRadius = 40
        cell.contentView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if isGridView {
            return .init(width: collectionView.frame.width/2-10, height: 80)
        } else {
            return .init(width: collectionView.frame.width, height: 80)
        }
        
        
    }
    
    @IBAction func gridButtonTapped(_ sender: UIButton) {
        
    
        
        if isGridView {
           
            gridButton.setImage(UIImage(systemName: "square.grid.2x2.fill"), for: .normal)
        } else {
            gridButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        }
        isGridView = !isGridView
    }
    
    
}
