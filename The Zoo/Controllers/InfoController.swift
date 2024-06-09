//
//  InfoController.swift
//  The Zoo
//
//  Created by Ayaz Ayazov on 07.06.24.
//

import UIKit

class InfoController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let items = ["abc","qwe","rty","uio","plk","jhg","fds","azx","cvb"]
    
    @IBOutlet weak var searchBar: UISearchBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.searchBar.searchTextField.backgroundColor = .white
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZooNameCell", for: indexPath) as! ZooNameCell
        cell.zooNameLabel.text = items[indexPath.item]
        cell.contentView.layer.cornerRadius = 40
        cell.contentView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 80)
        
    }
    

}
