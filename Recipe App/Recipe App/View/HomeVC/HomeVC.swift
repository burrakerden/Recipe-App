//
//  CategoriesVC.swift
//  Recipe App
//
//  Created by Burak Erden on 9.03.2023.
//

import UIKit
import Kingfisher
import CoreData

class HomeVC: UIViewController {
        
    @IBOutlet weak var categoriesTableView: UITableView!
    
    var model = CoreDataModel()

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        fetchData(tableView: categoriesTableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        navigationItem.title = "Favorite Recipes"
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        categoriesTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        categoriesTableView.separatorInset = UIEdgeInsets(top: 0, left: 260, bottom: 0, right: 8)
    }
    
    func fetchData(tableView: UITableView) {
        model.fetchData(tableView: tableView)
    }
}

//MARK: - Table View

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: HomeTableViewCell = categoriesTableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {return UITableViewCell()}
        if let items = model.items?[indexPath.row] {
            cell.tableName.text = items.name
            cell.tableSource.text = items.cuisineType
            cell.tableKcal.text = items.calories
            cell.tableDishType.text = items.mealType
            cell.tableImage.kf.setImage(with: URL(string: items.image!))
            cell.tableYields.text = items.yields
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailVC()
        vc.indexPath = indexPath.row
        vc.isFavorite = true
        vc.item = model.items?[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
