//
//  FavoritesVC.swift
//  Recipe App
//
//  Created by Burak Erden on 9.03.2023.
//

import UIKit
import Firebase
import Kingfisher

class MyRecipesVC: UIViewController {
    
    
    var name = [String]()
    var image = [String]()
    var category = [String]()
    var descriptionn = [String]()
    var ingredients = [String]()
    var directions = [String]()
    var documentID = [String]()
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var MyRecipesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromFirestore()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //MARK: - Config
    
    func setupUI() {
        navigationItem.title = "My Recipes"
        MyRecipesTableView.delegate = self
        MyRecipesTableView.dataSource = self
        MyRecipesTableView.register(UINib(nibName: "MyRecipesTableViewCell", bundle: nil), forCellReuseIdentifier: "MyRecipesTableViewCell")
        navigationController?.navigationBar.tintColor = .systemGray
    }
    
    //MARK: - Get Data From Firestore
    
    func getDataFromFirestore() {
        
        db.collection("single").order(by: "date", descending: true).addSnapshotListener { snapshot, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                guard let documents = snapshot?.documents else {return}
                for document in documents {
                    self.documentID.append(document.documentID)
                    if let name = document.get("name") as? String {
                        self.name.append(name)
                    }
                    if let image = document.get("image") as? String {
                        self.image.append(image)
                    }
                    if let category = document.get("category") as? String {
                        self.category.append(category)
                    }
                    if let descriptionn = document.get("description") as? String {
                        self.descriptionn.append(descriptionn)
                    }
                    if let ingredients = document.get("ingredients") as? String {
                        self.ingredients.append(ingredients)
                    }
                    if let directions = document.get("directions") as? String {
                        self.directions.append(directions)
                    }
                }
                self.MyRecipesTableView.reloadData()

            }
        }
    }
}

//MARK: - TableView Extension

extension MyRecipesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MyRecipesTableViewCell = MyRecipesTableView.dequeueReusableCell(withIdentifier: "MyRecipesTableViewCell", for: indexPath) as? MyRecipesTableViewCell else {return UITableViewCell()}
        let url = self.image[indexPath.row]
        cell.myName.text = name[indexPath.row]
        cell.myImage.kf.setImage(with: URL(string: url))
        cell.myCategory.text = category[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MyRecipeDetailVC()
        vc.name = name[indexPath.row]
        vc.image = image[indexPath.row]
        vc.descriptionn = self.descriptionn[indexPath.row]
        vc.ingredients = ingredients[indexPath.row]
        vc.category = category[indexPath.row]
        vc.directions = directions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { _, _, _ in
            self.db.collection("single").document(self.documentID[indexPath.row]).delete() { err in
                if let err = err {
                    print("Error removing document: \(err.localizedDescription)")
                } else {
                    print("Document successfully removed!")
                }
            }
            tableView.reloadData()
        }
        deleteAction.backgroundColor = .systemRed
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        return config
    }
    
    
}
