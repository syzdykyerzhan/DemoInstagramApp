//
//  StorisCollectionViewCell.swift
//  InstagramApp
//
//  Created by Yerzhan Syzdyk on 22.02.2023.
//

import UIKit

final class StorisCollectionViewCell: UICollectionViewCell {
    static let Identifier = "storisCollectionViewCell"
    
    private lazy var logoImageView: UIImageView = {
        let myImageView = UIImageView(image: UIImage(named: "car"))
        myImageView.layer.cornerRadius = 40
        myImageView.contentMode = .scaleAspectFill
        myImageView.clipsToBounds = true
        return myImageView
    }()
    
    private lazy var nameLabel : UILabel = {
        let myLabel = UILabel()
        myLabel.text = "Lorem Ipsum"
        myLabel.font = UIFont.systemFont(ofSize: 12)
        myLabel.textAlignment = .center
        return myLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: setup views and constraints

extension StorisCollectionViewCell{
    func setupViews(){
        contentView.addSubview(logoImageView)
        contentView.addSubview(nameLabel)
    }
    func setupConstraints(){
        logoImageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}
