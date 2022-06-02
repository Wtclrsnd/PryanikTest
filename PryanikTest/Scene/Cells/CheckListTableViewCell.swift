//
//  CheckListTableViewCell.swift
//  PryanikTest
//
//  Created by Emil Shpeklord on 31.05.2022.
//

import UIKit

final class CheckListTableViewCell: UITableViewCell {

    let identifier: String = "check"

    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 15
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Placeholder"
        return label
    }()

    private lazy var checkPoint: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "circle")
        imageView.tintColor = .orange
        return imageView
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
        contentView.addSubview(stack)
        stack.addArrangedSubview(checkPoint)
        stack.addArrangedSubview(titleLabel)

        stack.snp.makeConstraints({ make in
            make.top.bottom.trailing.leading.equalToSuperview().inset(16)
        })
        checkPoint.snp.makeConstraints({ make in
            make.width.height.equalTo(contentView.frame.height - 32)
        })
    }

    func setUpCell(text: String, isSelected: Bool) {
        titleLabel.text = text
        if isSelected {
            checkPoint.image = UIImage(systemName: "circle.fill")
        }
    }

}
