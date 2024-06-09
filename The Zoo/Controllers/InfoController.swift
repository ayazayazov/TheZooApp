//
//  InfoController.swift
//  The Zoo
//
//  Created by Ayaz Ayazov on 07.06.24.
//

import UIKit

class InfoController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var isGridView = false
    let items = ["abc","qwe","rty","uio","plk","jhg","fds","azx","cvb"]
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var gridButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.searchBar.searchTextField.backgroundColor = .white
        self.searchBar.searchTextField.textColor = .black
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
