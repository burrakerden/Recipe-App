//
//  HomeVC.swift
//  Recipe App
//
//  Created by Burak Erden on 9.03.2023.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var countLabel: UILabel!
    
    var navTitle = "My Recipes"
    
    var testArray = ["burak", "ali", "veli", "ahmet", "ali", "veli", "ahmet", "ali", "veli", "ahmet"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        print(navTitle)
    }

    func setupUI() {
        navigationItem.title = navTitle
        countLabel.text = "\(testArray.count) Recipes"
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        navigationController?.navigationBar.tintColor = .systemGray

    }
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        testArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: HomeCollectionViewCell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else {return UICollectionViewCell()}
        cell.homeName.text = testArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
