//
//  HomeViewController.swift
//  InstagramApp
//
//  Created by Yerzhan Syzdyk on 22.02.2023.
//

import UIKit

final class HomePageViewController: UIViewController {
    
    private lazy var headerView : UIView = {
        let myView = UIView()
        myView.backgroundColor = .systemBackground
        return myView
    }()
    
    private lazy var projectName : UILabel = {
        let myLabel = UILabel()
        myLabel.text = "Instagram"
        myLabel.font = UIFont(name: "Noteworthy-Bold", size: 30)
        myLabel.backgroundColor = .systemBackground
        return myLabel
    }()
    
    private lazy var topBlock : UIView = {
        let myBlock = UIView()
        myBlock.backgroundColor = .systemBackground
        return myBlock
    }()
    
    private lazy var rightBlock : UIView = {
        let myBlock = UIView()
        myBlock.backgroundColor = .systemBackground
        return myBlock
    }()
    
    private lazy var addButton : UIButton = {
        let myButton = UIButton()
        myButton.setImage(UIImage(systemName: "plus.app"), for: .normal)
        myButton.tintColor = .label
        myButton.backgroundColor = .systemBackground
        return myButton
    }()
    
    private lazy var heartButton : UIButton = {
        let myButton = UIButton()
        myButton.setImage(UIImage(systemName: "suit.heart"), for: .normal)
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
    
    private lazy var storisCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        myCollectionView.showsVerticalScrollIndicator = false
        myCollectionView.register(StorisCollectionViewCell.self, forCellWithReuseIdentifier: StorisCollectionViewCell.Identifier)
        myCollectionView.backgroundColor = .systemBackground
        myCollectionView.showsHorizontalScrollIndicator = false
        return myCollectionView
    }()
    
    private lazy var lentaTableView : UITableView = {
        let myTableView = UITableView()
        myTableView.register(LentaTableViewCell.self, forCellReuseIdentifier: LentaTableViewCell.Identifier)
        return myTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        storisCollectionView.dataSource = self
        storisCollectionView.delegate = self
        lentaTableView.dataSource = self
        lentaTableView.delegate = self
        
        setupViews()
        setupConstraints()
    }
}
//MARK: Table View DataSourse
extension HomePageViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LentaTableViewCell.Identifier, for: indexPath) as! LentaTableViewCell
        return cell
    }
}

//MARK: TableView Delegate
extension HomePageViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = tableView.frame.height / 1.2
        return CGFloat(height)
    }
}

//MARK: CollectionView DataSourse
extension HomePageViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StorisCollectionViewCell.Identifier, for: indexPath) as! StorisCollectionViewCell
        return cell
    }
}

//MARK: CollectionView Delegate

extension HomePageViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 4.5
        return CGSize(width: width, height: width + 20)
    }
}

//MARK: setup views and constraints

extension HomePageViewController{
    func setupViews(){
        view.addSubview(headerView)
        
        headerView.addSubview(topBlock)
        
        topBlock.addSubview(projectName)
        topBlock.addSubview(rightBlock)
        
        rightBlock.addSubview(addButton)
        rightBlock.addSubview(heartButton)
        rightBlock.addSubview(directButton)
        
        headerView.addSubview(storisCollectionView)
        
        view.addSubview(lentaTableView)
    }
    func setupConstraints(){
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        topBlock.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        rightBlock.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.5)
            make.trailing.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.4)
        }
        addButton.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.33)
        }
        heartButton.snp.makeConstraints { make in
            make.leading.equalTo(addButton.snp.trailing)
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.33)
        }
        directButton.snp.makeConstraints { make in
            make.leading.equalTo(heartButton.snp.trailing)
            make.top.trailing.bottom.equalToSuperview()
        }
        projectName.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.7)
            make.trailing.equalTo(rightBlock.snp.leading)
            make.leading.equalToSuperview().inset(5)
            make.bottom.equalToSuperview()
        }
        storisCollectionView.snp.makeConstraints { make in
            make.top.equalTo(topBlock.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }

        lentaTableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}
