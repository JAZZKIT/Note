//
//  NTitleLabel.swift
//  Note
//
//  Created by Denny on 20.01.2022.
//

import UIKit

class NTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }
}
