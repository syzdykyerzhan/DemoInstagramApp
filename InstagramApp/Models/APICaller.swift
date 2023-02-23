//
//  APICaller.swift
//  Project_1
//
//  Created by Yerzhan Syzdyk on 30.01.2023.
//

import Foundation

protocol APICallerDelegate{
    func didUpdateGalleryList(with galleryList: [GalleryModel])
    func didFailWithError(_ error : Error)
}

struct APICaller{
    static var shared = APICaller()
    var delegate: APICallerDelegate?
    
    func fetchRequest(with request: String = ""){
        let url_string = "\(Constants.Links.link)\(Constants.Api.key)&q=\(request)&image_type=photo"
            guard let url = URL(string: url_string) else { fatalError("Incorrect link!")}
            let task = URLSession.shared.dataTask(with: url){ data, _ , error in
                if let data, error == nil {
                    if let galleryList = parseJSON(data){
                        delegate?.didUpdateGalleryList(with: galleryList)
                    }else{delegate?.didFailWithError(error!)}
                }else{
                    delegate?.didFailWithError(error!)
                }
            }
            task.resume()
    }
    func parseJSON(_ data : Data) -> [GalleryModel]?{
        var galleryList: [GalleryModel] = []
        do{
            let decodeData = try JSONDecoder().decode(GalleryData.self, from: data)
            for model in decodeData.hits{
                galleryList.append(GalleryModel(previewURL: model.previewURL))
            }
            
        }catch{
            print(error)
            return nil
        }
        
        return galleryList
    }
}
