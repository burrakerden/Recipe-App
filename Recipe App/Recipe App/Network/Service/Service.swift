//
//  Service.swift
//  Recipe App
//
//  Created by Burak Erden on 13.03.2023.
//

import Alamofire

 
protocol ServiceProtocol {
    func getMovie(searchText: String, onSuccess: @escaping (RecipeApi?) -> Void, onError: @escaping (AFError) -> Void)
}

final class Service: ServiceProtocol {
    func getMovie(searchText: String, onSuccess: @escaping (RecipeApi?) -> Void, onError: @escaping (Alamofire.AFError) -> Void) {
        ServiceManager.shared.fetch(path: "https://api.edamam.com/api/recipes/v2?type=public&app_id=146504b0&app_key=639a16e41940e19ad3684f7ce829f1bb&q=\(searchText)") { (response: RecipeApi) in
            onSuccess(response)
        } onError: { (error) in
            onError(error)
        }
    }
}
 
