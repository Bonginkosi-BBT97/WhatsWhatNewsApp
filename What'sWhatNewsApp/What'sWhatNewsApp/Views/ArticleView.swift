//
//  ArticleView.swift
//  What'sWhatNewsApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/21.
//

import SwiftUI
import Kingfisher

struct ArticleView: View {
    var article: NewsResponse.Article
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text(article.title)
                        .font(.title2)
                        .bold()
                    KFImage(URL(string: article.urlToImage ?? ""))
                        .resizable()
                        .scaledToFill()
                    
                    Text(article.content ?? "")
                        .padding(.horizontal)
                        .font(.body)
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ArticleView(article: NewsResponse.Article(title: "", url: ""))
}
