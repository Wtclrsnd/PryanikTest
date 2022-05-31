//
//  TextTableViewCell.swift
//  PryanikTest
//
//  Created by Emil Shpeklord on 30.05.2022.
//

import UIKit
import SnapKit

final class TextTableViewCell: UITableViewCell {

    let identifier: String = "text"

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Placeholder"
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUpUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpUI() {
        contentView.addSubview(titleLabel)

        titleLabel.snp.makeConstraints({ make in
            make.top.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalToSuperview().inset(16)
        })
    }

    func setUpText(text: String) {
        titleLabel.text = text
    }
}
