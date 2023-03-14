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
    @IBOutlet weak var homeSearchBar: UISearchBar!
    
    var timer: Timer?
    
    var model = ViewModel()
    var recipeData = [Hit]()
    var nextPageURL = ""
    var navTitle = "My Recipes"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    //MARK: - Config
    
    func setupUI() {
        navigationItem.title = navTitle
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        tabBarController?.delegate = self
        homeSearchBar.delegate = self
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        homeSearchBar.endEditing(true)
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
        cell.homeDishType.text = mainData?.dishType?[0].capitalized
        cell.homeSource.text = "Source: " + (mainData?.source ?? "")
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
        }
    }
    
}

//MARK: - Tab Bar
extension HomeVC: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        homeCollectionView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: true)
    }
}


// MARK: - Search Bar

extension HomeVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        homeSearchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false, block: { _ in
            if searchText.count > 3 {
                DispatchQueue.main.async {
                    self.bind(searchText: searchText.replacingOccurrences(of: " ", with: "+"))
                    self.homeCollectionView.reloadData()
                    print(searchText)
                }
                self.recipeData.removeAll()

            } else {
//                self.recipeData.removeAll()
//                self.homeCollectionView.reloadData()

            }
        })
    }
}
