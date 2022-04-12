//
//  PostDetailsView.swift
//  ArtTest
//
//  Created by Ansar on 10/04/22.
//

import SwiftUI

import SwiftUI

struct PostDetails : View {
    @ObservedObject var viewModel : PostDetailsViewModel

    init(post:Parameter) {
        viewModel = PostDetailsViewModel(post:post)
//        UITableView.appearance().backgroundColor = UIColor.clear

    }
        
    var body: some View {
      
            VStack {
                
                    VStack(alignment: HorizontalAlignment.leading, spacing: 5) {
                        Text(viewModel.heading).styledText(semanticFont: .subHeading).padding(EdgeInsets.init(top: 5, leading: 0, bottom: 0, trailing: 10))
                        HStack {  Text(viewModel.details).styledText(semanticFont: .description).padding(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 10))
                        }
                    }
                
                VStack(alignment: .center) {
                    Text("COMMENTS").styledText(semanticFont: .subHeading).padding(EdgeInsets.init(top: 5, leading: 0, bottom: 0, trailing: 10))
                    if viewModel.isLoading {
                        ActivityIndicator(color: Color.blue, size: 50).accessibilityLabel("activityIndicator")
                    } else {
                        
                        
                        if (viewModel.comments.count > 0) {
                            List(viewModel.comments) { comment in
                                let id = comment.id?.description
                                PostItemView(heading: comment.name ?? "N/A", description: comment.body ?? "N/A" ).accessibilityLabel(id ?? "")
                                
                            }
                        } else {
                            VStack(alignment: .center) {
                                Text("No Comments")
                            }
                        }
                    }
                }
                
            }
        .onAppear(perform: {
            viewModel.getComments()
        }).navigationBarTitle(Text(viewModel.heading), displayMode: .inline)
            .padding()
    }
}
