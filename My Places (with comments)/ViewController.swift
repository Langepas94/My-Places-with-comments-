//
//  ViewController.swift
//  My Places (with comments)
//
//  Created by Артём Тюрморезов on 01.10.2022.
//a

import UIKit

class ViewController: UIViewController {

    let places = Place.getPlace()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleOfNavigationController()

    }
    @IBAction func cancelAction(_ segue: UIStoryboardSegue) {
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableCell
     
        cell.nameLabel.text = places[indexPath.row].name
        cell.imageOfPlace.image = UIImage(named: places[indexPath.row].image)
        cell.TypeLabel.text = places[indexPath.row].type
        cell.LocationLabel.text = places[indexPath.row].place
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true

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
