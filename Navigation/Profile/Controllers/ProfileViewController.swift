//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Александр on 02.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {

    private var modelStar: [[Any]] = [["Photos"], Modelstar.starArray()]

    //MARK: - Add Table View
    private lazy var myTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.sectionHeaderTopPadding = .zero
        tableView.sectionHeaderHeight = .zero
        tableView.sectionFooterHeight = .zero
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayoutConstraints()
    }

    //MARK: - Setup Layout Constraints
    private func setupLayoutConstraints() {
        view.addSubview(myTableView)

        NSLayoutConstraint.activate([

            myTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: - Extension UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return modelStar.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modelStar[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: PhotosTableViewCell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.galleryButton.addTarget(self, action: #selector(galleryButtonAction), for: .touchUpInside)
            cell.layer.shadowColor = #colorLiteral(red: 0.2196078449, green: 0.5868554688, blue: 0.8549019694, alpha: 1).cgColor
            cell.layer.shadowOpacity = 0.7
            cell.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
            return cell

        default:
            if let model: Modelstar = modelStar[indexPath.section][indexPath.row] as? Modelstar {
                let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
                cell.setupCell(model: model)
                return cell
            } else { return UITableViewCell() }
        }
    }

    //MARK: - Gallery Button Action
    @objc private func galleryButtonAction() {
        let photosVC = PhotosViewController()
        navigationController?.pushViewController(photosVC, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return section == 0 ? ProfileHeaderView() : nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK: - Extension UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {



    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 1
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && editingStyle == .delete {
            modelStar[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}











