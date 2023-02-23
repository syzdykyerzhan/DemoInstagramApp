//
//  GalleryCollectionViewCell.swift
//  GalleryApp
//
//  Created by Yerzhan Syzdyk on 15.02.2023.
//

import UIKit
import Kingfisher

final class GalleryCollectionViewCell: UICollectionViewCell {
    
    private lazy var myImageView : UIImageView = {
        let myImageView = UIImageView()
        myImageView.image = UIImage(named: "car")
        return myImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(url_string: String){
        guard let url_string = URL(string: url_string) else{fatalError("Error")}
        DispatchQueue.main.async {
            self.myImageView.kf.setImage(with: url_string)
        }
    }
}


//MARK: setup views and constraints

extension GalleryCollectionViewCell{
    func setupViews(){
        contentView.addSubview(myImageView)
    }
    func setupConstraints(){
        myImageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.95)
        }
    }
}
