//
//  ToDoListViewController.swift
//  ToDoListWithCoreData
//
//  Created by Mohammed S A Kwaik on 10/9/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let notes:[String] = ["Note 1", "Note 2", "Note 3", "Note 4", "Note 5",
                          "Note 6", "Note 7", "Note 8", "Note 9", "Note 10"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var addToDoListBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func addToDoListBtnHandler(_ sender: Any) {
        let addListAlert = UIAlertController(title: "New Note", message: "Please enter the title and the description of the note", preferredStyle: .alert)
        addListAlert.addTextField { (textField) in
            textField.placeholder = "Note title"
            textField.keyboardType = .default
            textField.keyboardAppearance = .dark
            textField.autocorrectionType = .default
            textField.clearButtonMode = .whileEditing
        }
        
        addListAlert.addTextField { (textField) in
            textField.placeholder = "Note description"
            textField.keyboardType = .default
            textField.keyboardAppearance = .dark
            textField.autocorrectionType = .default
            textField.clearButtonMode = .whileEditing
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { (alertAction) in
            print("saveAction ")
            guard let _ = addListAlert.textFields?[0].text else {
                return
            }
            
            guard let _ = addListAlert.textFields?[1].text else {
                return
            }
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) {_ in}
        addListAlert.addAction(saveAction)
        addListAlert.addAction(cancelAction)
        present(addListAlert, animated: true) {}
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

