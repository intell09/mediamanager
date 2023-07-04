//
//  HomeTableViewController.swift
//  MediaManager
//
//  Created by russell gadsden on 3/22/23.
//

import UIKit

class HomeTableViewController: UITableViewController {

   override func viewDidLoad() {
      super.viewDidLoad()
   }

   // MARK: - Table view data source

   override func numberOfSections(in tableView: UITableView) -> Int {
      return 1
   }

   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 3
   }

   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath)

      if indexPath.row == 0 {
         cell.textLabel?.text = "Favorites"
      } else if indexPath.row == 1 {
         cell.textLabel?.text = "Movies"
      } else {
         cell.textLabel?.text = "TV Shows"
      }
      return cell
   }


}
