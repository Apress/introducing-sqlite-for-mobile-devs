//
//  DetailViewController.swift
//  Scores
//
//  Created by Jesse Feiler on 11/23/15.
//  Copyright © 2015 Jesse Feiler. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UITableViewController,
  NSFetchedResultsControllerDelegate {

  var managedObjectContext: NSManagedObjectContext? {
    didSet {
    }
  }

  var detailUser: User? {
    didSet {
        // Update the view.
        //self.configureView()
    }
  }

  /*func configureView() {
    // Update the user interface for the detail item.
    if let detail = self.detailItem {
        
    }
  }*/

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    print ("\(self.managedObjectContext)")

    let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewScore:")
    self.navigationItem.rightBarButtonItem = addButton
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func insertNewScore(sender: AnyObject) {
    print ("\(managedObjectContext)")
    
    let newScore = NSEntityDescription.insertNewObjectForEntityForName("Score", inManagedObjectContext: managedObjectContext!) as! Score
    
    // If appropriate, configure the new managed object.
    // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
    newScore.score = NSDate().timeIntervalSince1970 as Double
    print ("Setting newScore to \(newScore.score)")
    //let doubleDate = Double(date)
    if let user = detailUser {
      newScore.user = user
    }
    
    // Save the context.
    do {
      try managedObjectContext!.save()
    } catch {
    // Replace this implementation with code to handle the error appropriately.
    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //print("Unresolved error \(error), \(error.userInfo)")
    abort()
    }
  }

    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if self.detailUser!.scores != nil {
        print ("\(self.detailUser?.scores!.count)")
      }
      if let myScores = (self.detailUser?.scores?.count) {
        return myScores
      }
      return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath)
        self.configureCell(cell, atIndexPath: indexPath)
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
      if let scores = detailUser?.scores {
        var nsarr = scores.allObjects as NSArray
        //let theScore = scores.anyObject()!.score as! Double
        let test = nsarr [indexPath.row] as! Score
        let test2 = test.score
        cell.textLabel!.text = "Score: " + test2.description

        //let arr2 = scores.anyObject()!.score as! Double
        //let arr3 = arr2.score as! Double
          //print (arr3)
      
        
        
        //print ("indexPath.row: \(indexPath.row)")
        //print ("indexPath.row score: \(user)")
        //let x = scores.allObjects[indexPath.row]
        //let scores = detailUser!.scores

        //var arr = scores.allObjects //Swift Array
        //var nsarr = arr.allObjects as NSArray  //NSArray
        
        //let x = arr[indexPath.row]
        //print ("\(x)")
        //scores.anyObject()!.stringValue
        //let y = x.doubleValue
        //print ("\(y)")
        //String(Double(scores.allObjects[indexPath.row] as! NSNumber))
      }
  }
}

