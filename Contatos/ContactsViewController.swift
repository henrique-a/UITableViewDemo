//
//  ContactsViewController.swift
//  Contatos
//
//  Created by Ada 2018 on 26/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

import UIKit

typealias Contact = (name: String, phone: String, photo: UIImage)

class ContactsViewController: UIViewController, NewContactDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var contacts: Array<Contact> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contacts = [Contact(name:"Contato 0" , phone:"0000-0000" , photo: #imageLiteral(resourceName: "Contato0")), Contact(name:"Contato 1" , phone:"1111-1111" , photo:#imageLiteral(resourceName: "Contato1") ), Contact(name:"Contato 2" , phone:"2222-2222" , photo:#imageLiteral(resourceName: "Contato2")), Contact(name:"Contato 3" , phone:"3333-3333" , photo:#imageLiteral(resourceName: "Contato3") ), Contact(name:"Contato 4" , phone:"4444-4444" , photo:#imageLiteral(resourceName: "Contato4") ), Contact(name:"Contato 5" , phone:"5555-5555" , photo:#imageLiteral(resourceName: "Contato5")), Contact(name:"Contato 6" , phone:"6666-6666" , photo:#imageLiteral(resourceName: "Contato6") )]
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBOutlet weak var rightButton: UIBarButtonItem!
    @IBAction func showEditMode(_ sender: UIBarButtonItem) {
        if (tableView.isEditing) {
            tableView.isEditing = false
            rightButton.title = "Edit"
        } else {
            tableView.isEditing = true
            rightButton.title = "Done"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddContact" {
            let newContactController = segue.destination as? NewContactController
            newContactController?.delegate = self as NewContactDelegate
        }
    }
    
    func addContact(name: String, phone: String, photo: UIImage) {
        let contact = Contact(name: name, phone: phone, photo: photo)
        self.contacts.append(contact)
        tableView.reloadData()
    }
}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = contacts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") as! ContactCell
        cell.phone.text = contact.phone
        cell.name.text = contact.name
        cell.photo.image = contact.photo
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contacts.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = contacts[sourceIndexPath.row]
        contacts.remove(at: sourceIndexPath.row)
        contacts.insert(item, at: destinationIndexPath.row)
    }
    
    
}




