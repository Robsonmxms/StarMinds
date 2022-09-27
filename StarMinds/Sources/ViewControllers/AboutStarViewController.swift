//
//  AboutStarViewController.swift
//  StarMinds
//
//  Created by Robson Lima Lopes on 09/09/22.
//

import UIKit

class AboutStarViewController: UITableViewController {
    private var closeIcon = UIImage()
    private var closeButton = UIBarButtonItem()
    private var star: Star
    private var voxelView = StarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        applyViewCode()
    }

    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        var insets = tableView.safeAreaInsets
        insets.bottom = 0
        tableView.contentInset = insets
//        tableView.contentInsetAdjustmentBehavior = .never
    }

    init(with star: Star) {
        self.star = star
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension AboutStarViewController: ViewCodeConfiguration {
    func buildHierarchy() {}

    func setupConstraints() {}

    func configureViews() {
        closeIcon = (UIImage(systemName: "xmark.circle.fill")?
            .withTintColor(
                UIColor(named: "AccentColor")!,
                renderingMode: .alwaysOriginal)
        )!

        closeButton = UIBarButtonItem(
            image: closeIcon,
            style: .done,
            target: self,
            action: #selector(close)
        )
        navigationItem.rightBarButtonItem = closeButton
        navigationItem.title = star.info.name.rawValue
        navigationController?.interactivePopGestureRecognizer?.delegate = self

        tableView.backgroundColor = UIColor(named: "CardBackground")
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(VoxelTableViewCell.self, forCellReuseIdentifier: "VoxelCell")
        tableView.register(VoxDescriptionTableViewCell.self, forCellReuseIdentifier: "VoxDescriptionCell")

    }

    @objc func close() {
        self.dismiss(animated: true)
    }

}

extension AboutStarViewController: UIGestureRecognizerDelegate {

}

extension AboutStarViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return CellType.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentItem = CellType.allCases[indexPath.section]
        switch currentItem {

        case .voxel:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "VoxelCell")
                    as? VoxelTableViewCell else {
                fatalError("DequeueReusableCell failed while casting")
            }
            cell.configure(with: self.star)
            return cell
        case .voxDescription:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "VoxDescriptionCell")
                    as? VoxDescriptionTableViewCell else {
                fatalError("DequeueReusableCell failed while casting")
            }
            cell.configure(with: self.star)
            return cell
        }
    }
}
