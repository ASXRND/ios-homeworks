//
//  PostViewController.swift
//  Navigation
//
//  Created by Александр on 02.02.2023.
//

import UIKit

final class PostViewController: UIViewController {
    
    //MARK: - Add BarBatton
    private func barBattonItem() {
        lazy var barBatton = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(barItemAction))
        navigationItem.rightBarButtonItem = barBatton
        barBatton.image = .init(systemName: "info.circle.fill")
    }
    
    //MARK: - BarBatton Action
    @objc private func barItemAction() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        barBattonItem()
    }
    
}

