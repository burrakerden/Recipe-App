# Recipe-App

The objective of this application is to allow users to search and view recipes from the API within the search section, save their favorite recipes and conveniently access them on the home screen. Additionally, the app provides the ability to manually add new recipes.
This app utilizes the api.edamam.com's API, and incorporates Firebase authentication, database, and Firestore features to enhance the user experience.

## Views
The recipe app consists of five main pages: HomeVC, SearchVC, NewVC, MyRecipesVC, and SettingsVC.

* HomeVC displays a table view of favorite recipes. When we add recipes from the SearchVC to our favorites, their information is saved to CoreData and displayed on HomeVC.

* In the SearchVC, we use the "https://api.edamam.com" API to display recipe search results in a custom collectionViewCell. Clicking on a recipe leads to its detailed view.

* NewVC allows users to add their own recipes by filling out fields for name, category, description, ingredients, directions, and adding an image. The recipe is saved to the user's account using Firebase's Firestore and Storage.

* MyRecipesVC displays the user's saved recipes in a tableView. Clicking on a recipe leads to its detailed view.

* SettingsVC displays the user's account information and allows them to log out or delete their account.

* Upon first login, users encounter LoginVC, which prompts them to register or log in with their email, Google, or Apple account.

Overall, the app provides a user-friendly interface for browsing, creating, and saving recipes, all while utilizing modern technologies like APIs, CoreData, and Firebase.

## Features

* Firebase Authentication 
* Firebase Storage
* Firebase Cloud Firestore
* Core Data
* Alamofire
* Kingfisher
* MVVM Design Pattern
* XIB
* UICollectionView
* Custom CollectionView Cell
* UITableView
* Custom TableView Cell
* Protocols
* Extensions
* Pagination
* UIAlertController
* UITabBarController
* UIGestureRecognizer
* Multiline TextView




## ↓↓ Screenshots and Short Gifs ↓↓
<img width="824" alt="Ekran Resmi 2023-04-06 15 19 35" src="https://user-images.githubusercontent.com/116464498/230376932-2fb3e810-62b0-4f7d-9de7-ca622f19f8de.png">
<img width="825" alt="Ekran Resmi 2023-04-06 15 16 06" src="https://user-images.githubusercontent.com/116464498/230376219-3b23f815-710d-4fda-864a-69634f787e6d.png">
<img width="283" alt="Ekran Resmi 2023-04-06 15 21 49" src="https://user-images.githubusercontent.com/116464498/230377352-1f2d77f2-cd3d-40a8-827e-1b9b30199deb.png">
<img width="1090" alt="Ekran Resmi 2023-04-06 15 18 17" src="https://user-images.githubusercontent.com/116464498/230376717-e27f8d54-2ea9-42b2-af6a-1fff40ee6d1d.png">

![recipeAppsite](https://user-images.githubusercontent.com/116464498/230375314-4b184420-e31d-4867-81e1-414c3f02cd43.gif)
![recipeAppFav](https://user-images.githubusercontent.com/116464498/230375483-b2ca3ee3-7cb1-47d2-9847-85204620e1b2.gif)

