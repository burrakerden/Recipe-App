//
//  HomeVC.swift
//  Recipe App
//
//  Created by Burak Erden on 9.03.2023.
//

import UIKit
import Kingfisher

class SearchVC: UIViewController {
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var searchIndicator: UIActivityIndicatorView!
    
    
    var timer: Timer?
    
    var model = ViewModel()
    var recipeData = [Hit]()
    var nextPageURL = ""
    var navTitle = "Search"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        searchIndicator.isHidden = true
//        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    //MARK: - Config
    
    func setupUI() {
        navigationItem.title = navTitle
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        tabBarController?.delegate = self
        searchBar.delegate = self
        searchCollectionView.register(UINib(nibName: "SearchCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchCollectionViewCell")
        navigationController?.navigationBar.tintColor = .systemGray
    }
    
    //MARK: - GET DATA
    
    func bind(searchText: String) {
        model.getRecipeData(searchText: searchText)
        model.hits = {[weak self] value in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.recipeData = value
                self.searchCollectionView.reloadData()
            }
        }
        model.nextPage = {[weak self] value in
            guard let self = self else {return}
            self.nextPageURL = value
        }
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        searchBar.endEditing(true)
//    }
}

extension SearchVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        recipeData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: SearchCollectionViewCell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else {return UICollectionViewCell()}
        let mainData = recipeData[indexPath.row].recipe
        cell.homeName.text = mainData?.label
        cell.homeDishType.text = mainData?.dishType?[0].capitalized
        cell.homeSource.text = mainData?.source
        if let cal = mainData?.calories {
            if cal != 0 {
                cell.homeKcal.text = " kcals: \(Int(cal)) "
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
        vc.recipeData = recipeData[indexPath.row]
        vc.indexPath = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == recipeData.count - 1 {
            searchIndicator.isHidden = false
            searchIndicator.startAnimating()
            model.getNextData(pagination: nextPageURL)
            model.hits = {[weak self] value in
                guard let self = self else {return}
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                    self.searchIndicator.isHidden = true
                    self.searchIndicator.stopAnimating()
                    self.recipeData.append(contentsOf: value)
                    self.searchCollectionView.reloadData()
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
extension SearchVC: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        searchCollectionView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: true)
    }
}


// MARK: - Search Bar

extension SearchVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: 0.45, repeats: false, block: { _ in
            if searchText.count > 3 {
                DispatchQueue.main.async {
                    self.bind(searchText: searchText.replacingOccurrences(of: " ", with: "+"))
                    self.searchCollectionView.reloadData()
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
