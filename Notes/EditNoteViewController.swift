//
//  EditNoteViewController.swift
//  Notes
//
//  Created by VIS on 16.03.2021.
//  Copyright © 2021 Vasily SALIY. All rights reserved.
//

import UIKit


protocol EditNoteDelegate {
    func updateNote(updatedTitle: String, updatedBody:String)
}


class EditNoteViewController: UIViewController, UITextViewDelegate {
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        self.bodyTextView.resignFirstResponder()
        self.doneButton.isEnabled = false
    }
    
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var bodyTextView: UITextView!
    var editNoteDelegate : EditNoteDelegate?
    var noteBody : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bodyTextView.delegate = self
        self.bodyTextView.text = noteBody
        self.bodyTextView.becomeFirstResponder()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.editNoteDelegate != nil {
            self.editNoteDelegate?.updateNote(updatedTitle: self.getNotesTitle(), updatedBody: self.bodyTextView.text)
        }
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.doneButton.isEnabled = true
    }
    
    
    func getNotesTitle() -> String {
        let components = self.bodyTextView.text.components(separatedBy: "\n")
        for component in components {
            if component.trimmingCharacters(in: CharacterSet.whitespaces).count > 0 {
                return component
            }
        }
        return self.navigationItem.title ?? ""
    }
}

    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    


