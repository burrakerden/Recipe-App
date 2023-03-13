//
//  ViewModel.swift
//  Recipe App
//
//  Created by Burak Erden on 13.03.2023.
//

import Foundation

class ViewModel {
    
    var hits: (([Hit]) -> Void)?
    
    func getRecipeData(searchText: String) {
        Service().getMovie(searchText: searchText){ result in
            guard let data = result?.hits else {return}
            self.hits?(data)
        } onError: { error in
            print("ERROR: ", error.localizedDescription)
        }
        
    }
    
}
