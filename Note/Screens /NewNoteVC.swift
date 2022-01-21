//
//  NewNoteVC.swift
//  Note
//
//  Created by Denny on 21.01.2022.
//

import UIKit

class NewNoteVC: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let noteField = NTextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewContoller()
        configureUI()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
    
    private func configureViewContoller() {
        view.backgroundColor = .systemBackground
        title = "New Note"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSave))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func didTapSave() {
        let newNote = Note(context: context)
        var lines = noteField.text.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .newlines)
        
        newNote.headline = lines.first //titleField.text
        lines.removeFirst()
        newNote.noteText = lines.joined(separator: " ")
        
        saveData()
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func saveData() {
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    private func configureUI() {
        view.addSubview(noteField)
        
        NSLayoutConstraint.activate([
            noteField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            noteField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            noteField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            noteField.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
