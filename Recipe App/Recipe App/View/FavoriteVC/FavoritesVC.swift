//
//  FavoritesVC.swift
//  Recipe App
//
//  Created by Burak Erden on 9.03.2023.
//

import UIKit
import Firebase
import Kingfisher

class FavoritesVC: UIViewController {
    
    var name = [String]()
    var image = [String]()
    var category = [String]()
    var descriptionn = [String]()
    var ingredients = [String]()
    var directions = [String]()
    var date = [String]()

    @IBOutlet weak var favoritesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromFirestore()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getDataFromFirestore() {
        let db = Firestore.firestore()
        
        db.collection("single").addSnapshotListener { snapshot, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                guard let documents = snapshot?.documents else {return}
                for document in documents {
                    if let name = document.get("name") as? String {
                        self.name.append(name)
                        print(self.name)
                    }
                    if let image = document.get("image") as? String {
                        self.image.append(image)
                    }
                    if let category = document.get("category") as? String {
                        self.category.append(category)
                    }
                    if let descriptionn = document.get("descriptionn") as? String {
                        self.descriptionn.append(descriptionn)
                    }
                    if let ingredients = document.get("ingredients") as? String {
                        self.ingredients.append(ingredients)
                    }
                    if let directions = document.get("directions") as? String {
                        self.directions.append(directions)
                    }
                    if let date = document.get("date") as? String {
                        self.date.append(date)
                    }
                }
                self.favoritesTableView.reloadData()
            }
        }
    }

    func setupUI() {
        navigationItem.title = "My Recipes"
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        favoritesTableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoritesTableViewCell")
    }
}

extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: FavoritesTableViewCell = favoritesTableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as? FavoritesTableViewCell else {return UITableViewCell()}
        cell.myName.text = name[indexPath.row]
        
        let url = self.image[indexPath.row]
            cell.myImage.kf.setImage(with: URL(string: url))
        
                return cell
    }
    
    
}
