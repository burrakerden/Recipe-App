//
//  Pagination.swift
//  Recipe App
//
//  Created by Burak Erden on 14.03.2023.
//

import Foundation

import Alamofire

 
protocol PaginationServiceProtocol {
    func getNextData(pagination: String, onSuccess: @escaping (RecipeApi?) -> Void, onError: @escaping (AFError) -> Void)
}

final class PagiaitonService: PaginationServiceProtocol {
    func getNextData(pagination: String, onSuccess: @escaping (RecipeApi?) -> Void, onError: @escaping (Alamofire.AFError) -> Void) {
        ServiceManager.shared.fetch(path: "\(pagination)") { (response: RecipeApi) in
            onSuccess(response)
        } onError: { (error) in
            onError(error)
        }
    }
}
