//
//  ImageTableViewCell.swift
//  PryanikTest
//
//  Created by Emil Shpeklord on 30.05.2022.
//

import UIKit
import SnapKit
import Kingfisher

class ImageTableViewCell: UITableViewCell {

    let identifier: String = "img"

    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()

        return imageView
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
        contentView.addSubview(photoImageView)

        photoImageView.snp.makeConstraints({ make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(UIScreen.main.bounds.height * 0.5)
        })
    }

    func setUpImage(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        photoImageView.kf.setImage(with: url)
    }
}
