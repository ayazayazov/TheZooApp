//
//  ZooInfoController.swift
//  The Zoo
//
//  Created by Ayaz Ayazov on 21.06.24.
//

import UIKit

class ZooInfoController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var zooInfoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zooInfoTableView.layer.cornerRadius = (zooInfoTableView.frame.width - 20) / 2
        zooInfoTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        
//        header.backgroundColor = .orange
        footer.backgroundColor = .yellow
        
        let zooImageView = UIImageView(frame: CGRectMake(20, 20, view.frame.size.width-40, view.frame.size.width-40))
        zooImageView.layer.cornerRadius = (zooInfoTableView.frame.width - 40) / 2
        zooImageView.layer.masksToBounds = true
        let zooImage = UIImage(named: "background")
        zooImageView.image = zooImage
        header.addSubview(zooImageView)
        
        
        
        zooInfoTableView.tableHeaderView = header
        zooInfoTableView.tableFooterView = footer
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ZooInfoCell", for: indexPath) as! ZooInfoCell
        
        //        cell.zooInfoCellBackgroundImage.frame.size = .init(width: collectionView.frame.width - 40, height: collectionView.frame.width - 40)
        //        cell.zooInfoCellBackgroundImage.layer.cornerRadius = (collectionView.frame.width - 40) / 2
        
        
        return cell
    }
    

}
