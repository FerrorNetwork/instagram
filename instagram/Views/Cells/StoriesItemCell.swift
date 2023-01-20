//
//  StoriesItemCell.swift
//  instagram
//
//  Created by Данил on 19.01.2023.
//

import SnapKit
import UIKit

class StoriesItemCell: UICollectionViewCell {
    func configure(with info: FeedStoriesItemCellInfo) {
        imageView.image = info.image
        usernameLabel.text = info.userName
        plusButton.isHidden = !info.isAddButtonVisible
        circleImageView.isHidden = !info.isNewStory
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 60 / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "AddStoryButton"), for: .normal)
        return button
    }()
    
    private let circleImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "storyRing")
        return view
    }()
}

private extension StoriesItemCell {
    func configure() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(60)
            make.leading.top.right.equalToSuperview().inset(6)
        }
        contentView.addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(6)
            make.top.equalTo(imageView.snp.bottom).offset(6)
        }
        contentView.addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(imageView)
            make.size.equalTo(20)
        }
        contentView.addSubview(circleImageView)
        circleImageView.snp.makeConstraints { make in
            make.center.equalTo(imageView)
            make.size.equalTo(72)
        }
    }
}
