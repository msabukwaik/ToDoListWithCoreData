//
//  ToDoListViewController.swift
//  ToDoListWithCoreData
//
//  Created by Mohammed S A Kwaik on 10/9/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit
import CoreData

class ToDoListViewController: UIViewController {
    
    @IBOutlet weak var notesTableView: UITableView!
    var notes:[NoteMO] = []
    
    @IBOutlet weak var addToDoListBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Fetch request
        let fetchRequest:NSFetchRequest<NoteMO> = NoteMO.fetchRequest()
        //let results = PresistentStore.
        
        do {
            let notes = try PresistentStore.context.fetch(fetchRequest)
            self.notes = notes
            self.notesTableView.reloadData()
        } catch  {
            
        }

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
            guard let title = addListAlert.textFields?[0].text else {
                return
            }
            
            guard let description = addListAlert.textFields?[1].text else {
                return
            }
            
            let noteMO = NoteMO(context:PresistentStore.context)
            noteMO.note_title = title
            noteMO.note_description = description
            PresistentStore.saveContext()
            self.notes.append(noteMO)
            self.notesTableView.reloadData()
            
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

extension ToDoListViewController:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].note_title
        cell.detailTextLabel?.text = notes[indexPath.row].note_description
        return cell
    }
}

extension ToDoListViewController: UITableViewDelegate{
    
}
