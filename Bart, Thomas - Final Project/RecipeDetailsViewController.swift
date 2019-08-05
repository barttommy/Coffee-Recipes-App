//
//  RecipeDetailsViewController.swift
//  Bart, Thomas - Final Project
//
//  Created by Thomas Bart on 3/15/19.
//  Copyright © 2019 Thomas Bart. All rights reserved.
//

import UIKit

class RecipeDetailsViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveRecipeDetails(_ sender: UIButton) {
        let title   = "Saved"
        let message = "Recipe details saved"
        let alertController = UIAlertController(title:title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        
        recipe = textView.text
        restoreDefaults()
    }
    
    @IBAction func discardChanges(_ sender: UIButton) {
        let menu = UIAlertController(title: nil, message: "Lose unsaved changes?", preferredStyle: .actionSheet)
        let discardAction = UIAlertAction(title: "Discard Recipe Details", style: .destructive) {
            (action) in self.restoreDefaults() }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        menu.addAction(discardAction)
        menu.addAction(cancelAction)
        present(menu, animated: true, completion: nil)
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        textView.resignFirstResponder()
    }
    
    func restoreDefaults () {
        textView.text = "1."
    }
}
