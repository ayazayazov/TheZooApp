//
//  ZooInfoController.swift
//  The Zoo
//
//  Created by Ayaz Ayazov on 21.06.24.
//

import UIKit

class ZooInfoController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var zooInfoTableView: UITableView!
    
    var zooList = [ZooListModel]()
    var zooIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.parseCountryFile()
        
        zooInfoTableView.layer.cornerRadius = (zooInfoTableView.frame.width - 20) / 2
        zooInfoTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width-8))
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 58))
        
        let zooImageView = UIImageView(frame: CGRectMake(20, 20, view.frame.size.width-40, view.frame.size.width-40))
        zooImageView.layer.cornerRadius = (zooInfoTableView.frame.width - 20) / 2 - 20
        zooImageView.layer.masksToBounds = true
        let zooImage = UIImage(named: "\(zooList[zooIndex ?? 0].image ?? "background")")
        zooImageView.image = zooImage
        header.addSubview(zooImageView)
        
        let seeAllAnimalsButton = UIButton()
        seeAllAnimalsButton.frame = CGRect(x: 0, y: 0, width: 250, height: 48)
        seeAllAnimalsButton.setTitle("See all animals", for: .normal)
        seeAllAnimalsButton.setTitleColor(.white, for: .normal)
        seeAllAnimalsButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .regular)
        seeAllAnimalsButton.backgroundColor = UIColor(red: 67/255, green: 112/255, blue: 41/255, alpha: 0.3)
        seeAllAnimalsButton.layer.cornerRadius = 8
        seeAllAnimalsButton.addTarget(self, action: #selector(seeAllAnimalsButtonTapped), for: .touchUpInside)
        footer.addSubview(seeAllAnimalsButton)
        seeAllAnimalsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            seeAllAnimalsButton.centerXAnchor.constraint(equalTo: footer.centerXAnchor),
            seeAllAnimalsButton.topAnchor.constraint(equalTo: footer.topAnchor, constant: 10),
            seeAllAnimalsButton.widthAnchor.constraint(equalToConstant: 250),
            seeAllAnimalsButton.heightAnchor.constraint(equalToConstant: 48)
        ])

        zooInfoTableView.tableHeaderView = header
        zooInfoTableView.tableFooterView = footer
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ZooInfoCell", for: indexPath) as! ZooInfoCell
        cell.zooNameLabel.text = zooList[zooIndex ?? 0].name
        cell.zooCountryLabel.text = zooList[zooIndex ?? 0].country
        cell.zooInfoTextView.text = zooList[zooIndex ?? 0].info
        return cell
    }
    
    @objc private func seeAllAnimalsButtonTapped() {
        let controller = storyboard?.instantiateViewController(identifier: "ZooAnimalsController") as! ZooAnimalsController
        
        controller.zooIndex = zooIndex
        
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true)
//        navigationController?.show(controller, sender: nil)
    }

}
