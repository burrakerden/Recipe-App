//
//  ViewModel.swift
//  Recipe App
//
//  Created by Burak Erden on 13.03.2023.
//

import Foundation

class ViewModel {
    
    var hits: (([Hit]) -> Void)?
    var nextPage: ((String) -> Void)?
    
    func getRecipeData(searchText: String) {
        Service().getMovie(searchText: searchText){ result in
            guard let data = result?.hits else {return}
            self.hits?(data)
            guard let nextData = result?.links?.next?.href else {return}
            self.nextPage?(nextData)
        } onError: { error in
            print("ERROR: ", error.localizedDescription)
        }
        
    }
    
    func getNextData(pagination: String) {
        PagiaitonService().getNextData(pagination: pagination){ result in
            guard let data = result?.hits else {return}
            self.hits?(data)
            guard let nextData = result?.links?.next?.href else {return}
            self.nextPage?(nextData)
        } onError: { error in
            print("ERROR: ", error.localizedDescription)
        }
        
    }
    
}
