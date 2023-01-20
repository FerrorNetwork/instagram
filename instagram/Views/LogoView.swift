//
//  LogoView.swift
//  instagram
//
//  Created by Данил on 18.01.2023.
//

import SnapKit
import UIKit

class LogoView: UIView {
    init(){
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "iglogo")
        return view
    }()
}

extension LogoView {
    private func configure() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(104)
            make.height.equalTo(30)
        }
    }
}
