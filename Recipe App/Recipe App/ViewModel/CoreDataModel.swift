//
//  CoreDataModel.swift
//  Recipe App
//
//  Created by Burak Erden on 4.04.2023.
//

import Foundation
import CoreData
import UIKit

class CoreDataModel {
    
    var items : [Items]?
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Items")
    
    func fetchData(tableView: UITableView?) {
        do {
            items = try context.fetch(Items.fetchRequest())
        } catch {
            print("error - fetchData")
        }
        tableView?.reloadData()
    }
    
    func addData(name: String, ingredients: String, cuisineType: String, mealType: String, directions: String, macros: String, image: String, yields: String, calories: String) {
        let newObject = Items(context: context)
        newObject.name = name
        newObject.ingredients = ingredients
        newObject.cuisineType = cuisineType
        newObject.mealType = mealType
        newObject.directions = directions
        newObject.macros = macros
        newObject.image = image
        newObject.yields = yields
        newObject.calories = calories
        newObject.uuid = UUID()
        do {
            try context.save()
            print("succuss - save")
        } catch {
            print("error - addData")
        }
    }
    
    func deleteData(indexPath: Int) {
        if let dataToRemove = self.items?[indexPath] {
            self.context.delete(dataToRemove)
            do {
                try self.context.save()
                print("deleting-success")
            } catch {
                print("error-deleting data")
            }
        }
    }
}

