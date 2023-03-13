//
//  CategoriesVC.swift
//  Recipe App
//
//  Created by Burak Erden on 9.03.2023.
//

import UIKit

class CategoriesVC: UIViewController {
    
    var categories = ["Breakfasts", "Soups", "Salads", "Appetizers", "Mains", "Sides", "Desserts", "Snacks", "Drinks"]
    
    @IBOutlet weak var categoriesTableView: UITableView!

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        navigationItem.title = "Categories"
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        categoriesTableView.register(UINib(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoriesTableViewCell")
    }
}

extension CategoriesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CategoriesTableViewCell = categoriesTableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath) as? CategoriesTableViewCell else {return UITableViewCell()}
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = HomeVC()
        vc.navTitle = categories[indexPath.row]
        vc.testArray = categories
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
