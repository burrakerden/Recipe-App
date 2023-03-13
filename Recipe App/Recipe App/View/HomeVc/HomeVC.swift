//
//  HomeVC.swift
//  Recipe App
//
//  Created by Burak Erden on 9.03.2023.
//

import UIKit
import Kingfisher

class HomeVC: UIViewController {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var countLabel: UILabel!
    
    var model = ViewModel()
    var recipeData = [Hit]()
    
    var navTitle = "My Recipes"
    
    var testArray = ["burak", "ali", "veli", "ahmet", "ali", "veli", "ahmet", "ali", "veli", "ahmet"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind(searchText: "chicken")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //MARK: - Config
    
    func setupUI() {
        navigationItem.title = navTitle
        countLabel.text = "\(testArray.count) Recipes"
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        navigationController?.navigationBar.tintColor = .systemGray
        
    }
    
    //MARK: - GET DATA
    
    func bind(searchText: String) {
        model.getRecipeData(searchText: searchText)
        model.hits = {[weak self] value in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.homeCollectionView.reloadData()
                self.recipeData = value
            }
        }
    }
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        recipeData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: HomeCollectionViewCell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else {return UICollectionViewCell()}
        let mainData = recipeData[indexPath.row].recipe
        cell.homeName.text = mainData?.label
        if let url = mainData?.image {
            cell.homeImage.kf.setImage(with: URL(string: url))
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
