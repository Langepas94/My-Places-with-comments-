//
//  ViewController.swift
//  My Places (with comments)
//
//  Created by Артём Тюрморезов on 01.10.2022.
//a

import UIKit

class ViewController: UIViewController {
    let restorantName = ["Шпинат", "SoSo coffee", "Rustaveli", "Персонажи", "Чито Гврито", "Colba Coffee"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleOfNavigationController()

    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restorantName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableCell
        var cellConfig = cell.defaultContentConfiguration()
       cellConfig.text = restorantName[indexPath.row]
        cellConfig.textProperties.font = UIFont(name: "AlNile", size: 18)!
        cellConfig.image = UIImage(named: restorantName[indexPath.row])
        cellConfig.imageProperties.cornerRadius = cell.frame.size.height
        cell.contentConfiguration = cellConfig
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let size = CGFloat(80)
        return size
    }
    
}

// MARK: - Navigation title
extension ViewController {
    func setupTitleOfNavigationController() {
        let titleLabel = UILabel()

                let titleText = NSAttributedString(string: "Мои рестораны", attributes: [
                    NSAttributedString.Key.font : UIFont(name: "Avenir-Heavy", size: 25) as Any])

                titleLabel.attributedText = titleText
                titleLabel.sizeToFit()
                navigationItem.titleView = titleLabel
    }
}
