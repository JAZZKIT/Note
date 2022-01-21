//
//  NoteListVC.swift
//  Note
//
//  Created by Denny on 20.01.2022.
//

import UIKit
import CoreData

class NoteListVC: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let tableView = UITableView()
    var notes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configureViewContoller()
        configureTableView()
    }
    
    private func configureViewContoller() {
        title = "Notes"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createNewNote))
        navigationItem.rightBarButtonItem = addButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        loadData()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 60
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(NoteCell.self, forCellReuseIdentifier: NoteCell.reuseID)
    }
    
    @objc func createNewNote() {
        let newNoteVC = NewNoteVC()
        
        newNoteVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(newNoteVC, animated: true)
    }
    
    // MARK: - CoreData Manupulation Methods
    
    private func saveData() {
        do {
            try context.save()
        } catch {
            print(error)
        }
        tableView.reloadDataOnMainThread()
    }
    
    private func loadData(with request: NSFetchRequest<Note> = Note.fetchRequest()) {
        do {
            notes = try context.fetch(request)
        } catch {
            print(error)
        }
        tableView.reloadDataOnMainThread()
    }

}

// MARK: - Extensions

extension NoteListVC: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteCell.reuseID, for: indexPath) as! NoteCell
        let note = notes[indexPath.row]
        cell.set(title: note.headline ?? "", description: note.noteText ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        context.delete(notes[indexPath.row])
        notes.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        //saveData() viewWillDis
    }
}
