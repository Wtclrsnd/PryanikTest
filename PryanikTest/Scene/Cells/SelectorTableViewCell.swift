//
//  SelectorTableViewCell.swift
//  PryanikTest
//
//  Created by Emil Shpeklord on 30.05.2022.
//

import UIKit

final class SelectorTableViewCell: UITableViewCell {

    let identifier: String = "selector"

    private var checkList: DataClass?

    private lazy var tableView: UITableView = {
        var tableView = UITableView()
//        tableView.separatorStyle = .none
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
        cell.setUpCell(text: variant?.text ?? "nil", isSelected: false)
        return cell
    }
}
