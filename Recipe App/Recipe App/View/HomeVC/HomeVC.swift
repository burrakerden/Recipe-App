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
    
//    var items : [Items]?
//    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Items")

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        fetchData()
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
    
    func fetchData() {
        model.fetchData()
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
            cell.tableKcal.text = "000"
            cell.tableDishType.text = items.mealType
            cell.tableImage.kf.setImage(with: URL(string: items.image!))
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailVC()
        vc.indexPath = indexPath.row
        vc.isFavorite = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let backgroundView = UIView()
//        backgroundView.backgroundColor = .white
//        backgroundView.layer.cornerRadius = 10
//        backgroundView.layer.masksToBounds = true
//        backgroundView.frame = CGRect(x: 10, y: 5, width: cell.frame.width - 20, height: cell.frame.height + 40)
//        cell.contentView.addSubview(backgroundView)
//        cell.contentView.sendSubviewToBack(backgroundView)
        
    }

}
