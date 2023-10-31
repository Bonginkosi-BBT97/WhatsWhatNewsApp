//
//  NewsCardComponent.swift
//  What'sWhatNewsApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/21.
//

import SwiftUI
import Kingfisher

struct NewsCardComponent: View {
    var article: NewsResponse.Article
    var type: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            KFImage(URL(string: article.urlToImage ?? ""))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 230)
            
            LinearGradient(colors: [Color.clear, Color.black.opacity(0.7)], startPoint: .top, endPoint: .bottom)
            
            VStack {
                HStack {
                    if type == "Positive" {
                        Circle()
                            .fill(.green)
                            .frame(width: 8, height: 8)
                            .padding(.leading, 8)
                        
                        Spacer()
                    } else if type == "Negative" {
                        Spacer()
                        Circle()
                            .fill(.red)
                            .frame(width: 8, height: 8)
                            .padding(.trailing, 8)
                    } else {
                        Spacer()
                        Circle()
                            .fill(.gray)
                            .frame(width: 8, height: 8)
                        Spacer()
                    }
                }
                
                Spacer()
                VStack(alignment: .leading, spacing: 4 ){
                    Text(article.title)
                        .font(.title3)
                        .foregroundColor(.white)
                        .bold()
                        .lineLimit(2)
                        .padding(.horizontal, 16)
                    
                    Text(article.descirption ?? "")
                        .font(.caption2)
                        .foregroundColor(.white)
                        .bold()
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 4)
                    
                }
            }
        }
        .padding(4)
        .frame(maxWidth: .infinity, maxHeight: 230, alignment: .leading)
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

#Preview {
    NewsCardComponent(article: NewsResponse.Article(title: "", url: ""), type: "Positive")
}

