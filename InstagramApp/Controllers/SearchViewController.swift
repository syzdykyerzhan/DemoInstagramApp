//
//  ViewController.swift
//  GalleryApp
//
//  Created by Yerzhan Syzdyk on 15.02.2023.
//

import UIKit
import SnapKit

final class SearchViewController: UIViewController {

    private var allGallery : [GalleryModel] = []
    
    private lazy var contentView = UIView()
    
    private lazy var searchBar : UISearchBar = {
        let mySearchBar = UISearchBar()
        return mySearchBar
    }()
    
    private lazy var galleryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        myCollectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.galleryCollectionViewCell)
        return myCollectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APICaller.shared.delegate = self
        APICaller.shared.fetchRequest()
        
        setupViews()
        setupConstraints()
        
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        searchBar.delegate = self
        
        view.backgroundColor = .systemBackground
        
        giveNameOfNavController()
    }
}

//MARK: APICAller Delegate
extension SearchViewController: APICallerDelegate{
    func didUpdateGalleryList(with galleryList: [GalleryModel]) {
        self.allGallery = galleryList
        DispatchQueue.main.async {
            self.galleryCollectionView.reloadData()
        }
    }
    
    func didFailWithError(_ error: Error) {
        print("Error with \(error)")
    }
}

//MARK: Collection view Delegate and Data Source
extension SearchViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allGallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.galleryCollectionViewCell, for: indexPath) as! GalleryCollectionViewCell
        cell.backgroundColor = .systemFill
        cell.configure(url_string: allGallery[indexPath.row].previewURL)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width/3.2
        return CGSize(width: width, height: width * 1.12)
    }
}

//MARK: private functions
private extension SearchViewController{
    private func giveNameOfNavController(){
        navigationItem.title = "Images and Videos"
        
    }
}

//MARK: Search Bar Delegate
extension SearchViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchBar.text?.replacingOccurrences(of: " ", with: "+")
        APICaller.shared.fetchRequest(with: text ?? "")
    }
}

//MARK: setup views and constraints

extension SearchViewController{
    func setupViews(){
        view.addSubview(contentView)
        contentView.addSubview(searchBar)
        contentView.addSubview(galleryCollectionView)
    }
    func setupConstraints(){
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        searchBar.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
        galleryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}
