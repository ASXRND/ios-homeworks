//
//  CradientButton.swift
//  Navigation
//
//  Created by Александр on 03.02.2023.
//

import UIKit

//MARK: - Gradient Button Settings
final class CradientButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [#colorLiteral(red: 0.3098039216, green: 0.6274509804, blue: 0.9803921569, alpha: 1).cgColor, #colorLiteral(red: 0.2, green: 0.3725490196, blue: 0.8196078431, alpha: 1).cgColor]
        gradient.cornerRadius = 16
        layer.addSublayer(gradient)

    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
