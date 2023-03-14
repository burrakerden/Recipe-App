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
    var nextPageURL = ""
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
        countLabel.text = "\(recipeData.count) Recipes"
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        tabBarController?.delegate = self
        homeCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        navigationController?.navigationBar.tintColor = .systemGray
    }
    
    //MARK: - GET DATA
    
    func bind(searchText: String) {
        model.getRecipeData(searchText: searchText)
        model.hits = {[weak self] value in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.recipeData = value
                self.homeCollectionView.reloadData()
            }
        }
        model.nextPage = {[weak self] value in
            guard let self = self else {return}
            self.nextPageURL = value
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
        cell.homeDishType.text = mainData?.dishType?[0]
        if let time = mainData?.calories {
            if time != 0 {
                cell.homeKcal.text = " kcals: \(Int(time)) "
            } else {
                cell.homeKcal.text = ""
            }
            
        }
        if let url = mainData?.image {
            cell.homeImage.kf.setImage(with: URL(string: url))
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == recipeData.count - 1 {
            model.getNextData(pagination: nextPageURL)
            model.hits = {[weak self] value in
                guard let self = self else {return}
                DispatchQueue.main.async {
                    self.recipeData.append(contentsOf: value)
                    self.homeCollectionView.reloadData()
                }
            }
            model.nextPage = {[weak self] value in
                guard let self = self else {return}
                self.nextPageURL = value
            }
            countLabel.text = "\(recipeData.count) Recipes"
        }
    }
    
}

//MARK: - Tab Bar
extension HomeVC: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        homeCollectionView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: true)
    }
}
