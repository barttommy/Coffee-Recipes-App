//
//  PreferencesViewController.swift
//  Bart, Thomas - Final Project
//
//  Created by Thomas Bart on 3/16/19.
//  Copyright © 2019 Thomas Bart. All rights reserved.
//

import UIKit

class PreferencesViewController: UIViewController {

    @IBOutlet weak var tempPreference: UISegmentedControl!
    @IBOutlet weak var weightPreference: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        if Preferences["degree"] == "celsius" {
            tempPreference.selectedSegmentIndex = 1
        }
        if Preferences["scale"] == "standard" {
            weightPreference.selectedSegmentIndex = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func savePreferences(_ sender: UIButton) {
        if tempPreference.selectedSegmentIndex == 0 {
            Preferences["degree"] = "fahrenheit"
        }
        else {
            Preferences["degree"] = "celsius"
        }
        
        if weightPreference.selectedSegmentIndex == 0 {
            Preferences["scale"] = "metric"
        }
        else {
            Preferences["scale"] = "standard"
        }
        alert(title: "Saved", message: "Changes to preferences have been recorded")
    }
    
    @IBAction func discardChanges(_ sender: UIButton) {
        let menu = UIAlertController(title: nil, message: "Lose unsaved changes?", preferredStyle: .actionSheet)
        let discardAction = UIAlertAction(title: "Discard changes", style: .destructive) {
            (action) in
            self.alert(title: "Changes discarded", message: "Preferences unchanged")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        menu.addAction(discardAction)
        menu.addAction(cancelAction)
        present(menu, animated: true, completion: nil)
    }
    
    func alert(title : String, message : String) {
        let alertController = UIAlertController(title:title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
