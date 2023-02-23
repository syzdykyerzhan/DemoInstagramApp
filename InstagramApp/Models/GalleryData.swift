//
//  DataModel.swift
//  GalleryApp
//
//  Created by Yerzhan Syzdyk on 16.02.2023.
//

import Foundation

struct GalleryData: Decodable{
    let hits : [Hits]
}

struct Hits : Decodable{
    let previewURL : String
}
