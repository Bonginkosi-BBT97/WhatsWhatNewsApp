//
//  NewsAPIModel.swift
//  What'sWhatNewsApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/21.
//

import Foundation

struct NewsResponse: Decodable {
    var status: String
    var totalResults: Int
    var articles: [Article]
    
}


struct Article: Decodable, Identifiable {
    var title: String
    var descirption: String?
    var url: String
    var urlToImage: String?
    var content: String?
}
