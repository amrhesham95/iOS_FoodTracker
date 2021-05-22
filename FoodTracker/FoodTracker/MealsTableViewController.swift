//
//  MealsTableViewController.swift
//  FoodTracker
//
//  Created by Amr Hesham on 06/03/2021.
//

import UIKit

class MealsTableViewController: UITableViewController {
  
  // MARK: - Properties
  
  var meals = [Meal]()
  var cellIdentifier = "MealTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()

//        loadSampleMeals()
        loadMeals()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MealTableViewCell
      cell.nameLabel.text = meals[indexPath.row].name
      cell.imageView?.image = meals[indexPath.row].photo
      cell.ratingControl.rating = meals[indexPath.row].rating
      return cell
    }
  

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          deleteMealAt(indexPath)
            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Segue
//
extension MealsTableViewController {
  @IBAction func unwindToMealsVC(_ sender: UIStoryboardSegue) {
    if let mealVC = sender.source as? MealViewController {
      guard let meal = mealVC.meal else { return }
      meals.append(meal)
      saveMeals()
      loadMeals()
    }
  }
}

// MARK: - Private Methods
//
private extension MealsTableViewController {
  func loadSampleMeals() {
    
    // creating images
    let photo1 = UIImage(named: "meal1")
    let photo2 = UIImage(named: "meal2")
    let photo3 = UIImage(named: "meal3")
    
    // creating meals
    let meal1 = Meal(name: "Salad", photo: photo1, rating: 4)
    let meal2 = Meal(name: "Chicken and Potatoes", photo: photo2, rating: 5)
    let meal3 = Meal(name: "Pasta", photo: photo3, rating: 3)
    
    // appending the meals
    meals += [meal1, meal2, meal3]
  }
}

extension MealsTableViewController {
  func saveMeals() {
    let data = try! NSKeyedArchiver.archivedData(withRootObject: meals, requiringSecureCoding: false)
    
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("meals")
    
    try! data.write(to: path)
  }
  
  func loadMeals() {
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("meals")
    
    do {
      let data = try Data(contentsOf: path)
      
      do {
        if let loadedMeals = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Meal] {
          meals.removeAll()
          meals.append(contentsOf: loadedMeals)
          tableView.reloadData()
        }
      }
      
    } catch {
      print(error.localizedDescription)
    }
  }
  
  func deleteMealAt(_ indexPath: IndexPath) {
    // delete meal from meals array
    meals.remove(at: indexPath.row)
    
    // save meals array
    saveMeals()
    
    // load meals array
    loadMeals()
  }
}
