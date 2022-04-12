//
//  ArticleItemView.swift
//  NYTimesMostPopularArticles
//
//  Created by ANSAR on 29/11/21.
//

import SwiftUI

struct PostItemView: View {
    let heading : String
    let description: String
    
    init(heading:String, description: String) {
        self.heading = heading
        self.description = description
    }
    
    
    var body: some View {
        
        HStack(alignment: VerticalAlignment.top, spacing: 0) {
            VStack(alignment: HorizontalAlignment.leading, spacing: 5) {
                Text(heading).styledText(semanticFont: .subHeading).padding(EdgeInsets.init(top: 5, leading: 10, bottom: 0, trailing: 10))
                Text(description).styledText(semanticFont: .description).padding(EdgeInsets.init(top: 0, leading: 10, bottom: 0, trailing: 10))
            }
        }
    }
}
