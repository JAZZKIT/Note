//
//  NoteCell.swift
//  Note
//
//  Created by Denny on 20.01.2022.
//

import UIKit

class NoteCell: UITableViewCell {

    static let reuseID = "NoteCell"
    let titleLabel = NTitleLabel(frame: .zero)
    let noteDescription = NSecondaryLabel(frame: .zero)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure() 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(title: String, description: String) {
        titleLabel.text = title
        noteDescription.text = description
    }
    
    private func configure() {
        addSubview(titleLabel)
        addSubview(noteDescription)
        accessoryType = .disclosureIndicator
        let topAndBottomPadding: CGFloat = 12
        let leadAndTrilPadding: CGFloat = 24
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: topAndBottomPadding),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadAndTrilPadding),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -leadAndTrilPadding),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            //noteDescription.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            noteDescription.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            noteDescription.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            noteDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -topAndBottomPadding),
            noteDescription.heightAnchor.constraint(equalToConstant: 18)
        ])
    }

}
//titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
//titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
//titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 24),
//titleLabel.heightAnchor.constraint(equalToConstant: 28),
////titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
//
//noteDescription.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
//noteDescription.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
////noteDescription.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
//noteDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
//noteDescription.heightAnchor.constraint(equalToConstant: 10)
