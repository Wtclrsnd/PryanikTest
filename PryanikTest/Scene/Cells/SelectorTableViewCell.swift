//
//  SelectorTableViewCell.swift
//  PryanikTest
//
//  Created by Emil Shpeklord on 30.05.2022.
//

import UIKit
import SnapKit

final class SelectorTableViewCell: UITableViewCell {

    let identifier: String = "selector"

    private var checkList: DataClass?
    internal var selectedID: Int?

    private lazy var tableView: UITableView = {
        var tableView = UITableView()
//        tableView.allowsSelection = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CheckListTableViewCell.self, forCellReuseIdentifier: "check")
        return tableView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpUI() {
        contentView.addSubview(tableView)

        tableView.snp.makeConstraints({ make in
            make.top.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height * 0.2)
        })
    }

    func setUp(data: DataClass?) {
        self.checkList = data
        self.selectedID = checkList?.selectedID
        tableView.reloadData()
    }
}

extension SelectorTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkList?.variants?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "check",
            for: indexPath
        ) as? CheckListTableViewCell else { return UITableViewCell() }
        let variant = checkList?.variants?[indexPath.row]
        cell.selectionStyle = .none
        guard let selectedID = selectedID else { return UITableViewCell() }
        if indexPath.row == selectedID - 1 {
            cell.setUpCell(text: variant?.text ?? "nil", isSelected: true)
        } else {
            cell.setUpCell(text: variant?.text ?? "nil", isSelected: false)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "selector", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            print("User click Approve button")
        }))
        UIApplication.shared.topViewController()?.present(alert, animated: true, completion: nil)
    }
}

