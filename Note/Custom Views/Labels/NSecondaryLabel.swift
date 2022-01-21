//
//  NSecondaryLabel.swift
//  Note
//
//  Created by Denny on 20.01.2022.
//

import UIKit

class NSecondaryLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: 14, weight: .bold)
    }
}
