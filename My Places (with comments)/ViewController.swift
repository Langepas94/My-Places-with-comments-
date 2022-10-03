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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        var cellConfig = cell?.defaultContentConfiguration()
        cellConfig?.text = restorantName[indexPath.row]
        cellConfig?.textProperties.font = UIFont(name: "AlNile", size: 15)!
        cellConfig?.image = UIImage(named: restorantName[indexPath.row])
        cell?.contentConfiguration = cellConfig
        return cell!
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
                    NSAttributedString.Key.font : UIFont(name: "SnellRoundhand-Black", size: 20) as Any])

                titleLabel.attributedText = titleText
                titleLabel.sizeToFit()
                navigationItem.titleView = titleLabel
    }
}
