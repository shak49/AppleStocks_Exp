//
//  ArticlesView.swift
//  AppleStocks_Exp
//
//  Created by Shak Feizi on 8/8/22.
//

import SwiftUI

struct ArticlesView: View {
    let articles: [ArticleViewModel]
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        return VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Top News")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(2)
                Text("From News")
                    .foregroundColor(.gray)
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(2)
                ScrollView {
                    VStack {
                        ForEach(self.articles, id: \.title) { article in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(article.publication)
                                        .foregroundColor(.white)
                                        .font(.custom("Arial", size: 22))
                                        .fontWeight(.bold)
                                    Text(article.title)
                                        .foregroundColor(.white)
                                        .font(.custom("Arial", size: 22))
                                }
                            }
                        }
                    }
                }
                .frame(minWidth: .infinity)
            }
        }
        .frame(width: screenSize.width, height: screenSize.height)
        .background(Color(red: 27/255, green: 28/255, blue: 30/255))
        .cornerRadius(20)
    }
}

struct ArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        let article = Article(title: "", imageURL: "", publication: "")
        return ArticlesView(articles: [ArticleViewModel(article: article)])
    }
}
