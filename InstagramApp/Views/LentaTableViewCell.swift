//
//  LentaTableViewCell.swift
//  InstagramApp
//
//  Created by Yerzhan Syzdyk on 22.02.2023.
//

import UIKit

final class LentaTableViewCell: UITableViewCell {
    
    private lazy var headerSectionView : UIView = {
        let myView = UIView()
        return myView
    }()
    
    private lazy var logoImageView : UIImageView = {
        let myView = UIImageView(image: UIImage(named: "car"))
        myView.layer.cornerRadius = 20
        myView.clipsToBounds = true
        return myView
    }()
    
    private lazy var nameLabel : UILabel = {
        let myLabel = UILabel()
        myLabel.text = "Lorem Ipsum"
        myLabel.tintColor = .label
        return myLabel
    }()
    
    private lazy var placeLabel : UILabel = {
        let myLabel = UILabel()
        myLabel.text = "Kazakhstan"
        myLabel.font = UIFont.systemFont(ofSize: 12)
        myLabel.tintColor = .label
        return myLabel
    }()
    
    private lazy var settingButton : UIButton = {
        let myButton = UIButton(type: .system)
        myButton.setTitle("...", for: .normal)
        myButton.tintColor = .label
        return myButton
    }()
    
    private lazy var centerSectionImageView : UIImageView = {
        let myView = UIImageView(image: UIImage(named: "inst_color"))
        return myView
    }()
    
    private lazy var viewForCenterImage: UIView = {
        let myView = UIView()
        myView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        return myView
    }()
    
    private lazy var learnMoreLabel : UILabel = {
        let myLabel = UILabel()
        myLabel.text = "Learn More"
        myLabel.textAlignment = .left
        myLabel.textColor = .white
        return myLabel
    }()
    
    private lazy var nextButton : UIButton = {
        let myButton = UIButton()
        myButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        myButton.tintColor = .white
        return myButton
    }()
    
    private lazy var bottomSectionView : UIView = {
        let myView = UIView()
        return myView
    }()
    
    private lazy var functionsOfButtomSectionView = UIView()
    
    private lazy var heartButton : UIButton = {
        let myButton = UIButton()
        myButton.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        myButton.tintColor = .label
        myButton.imageView?.contentMode = .scaleAspectFit
        myButton.backgroundColor = .systemBackground
        return myButton
    }()
    
    private lazy var commentButton : UIButton = {
        let myButton = UIButton()
        myButton.setImage(UIImage(systemName: "cloud"), for: .normal)
        myButton.tintColor = .label
        myButton.backgroundColor = .systemBackground
        return myButton
    }()
    
    private lazy var directButton : UIButton = {
        let myButton = UIButton()
        myButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        myButton.tintColor = .label
        myButton.backgroundColor = .systemBackground
        return myButton
    }()
    
    private lazy var saveButton : UIButton = {
        let myButton = UIButton()
        myButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        myButton.tintColor = .label
        myButton.backgroundColor = .systemBackground
        return myButton
    }()
    
    private lazy var viewsLabel : UILabel = {
        let myLabel = UILabel()
        myLabel.text = "345.532 Views"
        myLabel.font = UIFont.boldSystemFont(ofSize: 15)
        myLabel.tintColor = .label
        return myLabel
    }()
    
    private lazy var descriptionLabel : UILabel = {
        let myLabel = UILabel()
        myLabel.text = "Lorem Ipsum Curbitur maximus fells mauris ornare nullam vitae efficitur nibh, at feugiat eros. "
        myLabel.tintColor = .label
        myLabel.font = UIFont.systemFont(ofSize: 15)
        myLabel.numberOfLines = 2
        return myLabel
    }()
    
    private lazy var commenLabel : UILabel = {
        let myLabel = UILabel()
        myLabel.text = "View all 77 comments"
        myLabel.font = UIFont.systemFont(ofSize: 15)
        myLabel.textColor = .systemGray
        return myLabel
    }()
    
    static var Identifier = "lentaTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: setup views and constraints

extension LentaTableViewCell{
    func setupViews(){
        contentView.addSubview(headerSectionView)
        
        headerSectionView.addSubview(logoImageView)
        headerSectionView.addSubview(nameLabel)
        headerSectionView.addSubview(placeLabel)
        headerSectionView.addSubview(settingButton)
        
        contentView.addSubview(centerSectionImageView)
        centerSectionImageView.addSubview(viewForCenterImage)
        viewForCenterImage.addSubview(learnMoreLabel)
        viewForCenterImage.addSubview(nextButton)
        
        contentView.addSubview(bottomSectionView)
        
        bottomSectionView.addSubview(functionsOfButtomSectionView)
        
        functionsOfButtomSectionView.addSubview(heartButton)
        functionsOfButtomSectionView.addSubview(commentButton)
        functionsOfButtomSectionView.addSubview(directButton)
        functionsOfButtomSectionView.addSubview(saveButton)
        
        bottomSectionView.addSubview(viewsLabel)
        bottomSectionView.addSubview(descriptionLabel)
        bottomSectionView.addSubview(commenLabel)
        
        
    }
    func setupConstraints(){
        headerSectionView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        logoImageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(3)
        }
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(logoImageView.snp.trailing).inset(-5)
            make.top.equalToSuperview().inset(5)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        placeLabel.snp.makeConstraints { make in
            make.leading.equalTo(logoImageView.snp.trailing).inset(-5)
            make.top.equalTo(nameLabel.snp.bottom)
            make.bottom.equalToSuperview().inset(5)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        settingButton.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.trailing)
            make.top.trailing.bottom.equalToSuperview()
        }
        centerSectionImageView.snp.makeConstraints { make in
            make.top.equalTo(headerSectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.65)
        }
        viewForCenterImage.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.13)
        }
        learnMoreLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.bottom.top.equalToSuperview()
            make.trailing.equalTo(nextButton.snp.leading)
        }
        nextButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.13)
            make.bottom.top.trailing.equalToSuperview()
        }
        bottomSectionView.snp.makeConstraints { make in
            make.top.equalTo(centerSectionImageView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview()
        }
        functionsOfButtomSectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        heartButton.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(30)
        }
        commentButton.snp.makeConstraints { make in
            make.leading.equalTo(heartButton.snp.trailing)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(30)
        }
        directButton.snp.makeConstraints { make in
            make.leading.equalTo(commentButton.snp.trailing)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(30)
        }
        saveButton.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.width.equalTo(30)
        }
        viewsLabel.snp.makeConstraints { make in
            make.top.equalTo(functionsOfButtomSectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(viewsLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.37)
        }
        commenLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(5)
        }
    }
}
