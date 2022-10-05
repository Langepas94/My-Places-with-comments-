//
//  MainTableViewController.swift
//  My Places (with comments)
//
//  Created by Артём Тюрморезов on 04.10.2022.
//

import UIKit
import RealmSwift


class MainTableViewController: UITableViewController {

    var places: Results<Place>!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleOfNavigationController()

        places = realm.objects(Place.self)
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.isEmpty ? 0 : places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableCell
     
        let place = places[indexPath.row]
        
        cell.nameLabel.text = place.name
       
        cell.TypeLabel.text = place.type
        cell.LocationLabel.text = place.location
        cell.imageOfPlace.image = UIImage(data: place.imageData!)

        
//        cell.imageOfPlace.image = UIImage(named: places[indexPath.row].restorantImage!)
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true

        return cell
    }
    
  
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let place = places[indexPath.row]
            StorageManager.deleteObject(place)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    
  
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let size = CGFloat(80)
        return size
    }
    func setupTitleOfNavigationController() {
        let titleLabel = UILabel()

                let titleText = NSAttributedString(string: "Мои рестораны", attributes: [
                    NSAttributedString.Key.font : UIFont(name: "Avenir-Heavy", size: 25) as Any])

                titleLabel.attributedText = titleText
                titleLabel.sizeToFit()
                navigationItem.titleView = titleLabel
    }
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let newPlaceVc = segue.source as? NewPlaceTableViewController else { return }
        newPlaceVc.savePlace()
//        places.append(newPlaceVc.newPlace!)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let place = places[indexPath.row]
            let newPlaceVc = segue.destination as! NewPlaceTableViewController
            newPlaceVc.currentPlace = place
        }
    }
}

