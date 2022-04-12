//
//  SideMenu.swift
//  ArtTest
//
//  Created by Ansar on 09/04/22.
//

import SwiftUI

struct MenuContent: View {
    let dashboardPressed: () -> Void
    let albumPressed: () -> Void
    let logoutPressed: () -> Void

    var body: some View {
        List {
            NavigationLink(destination: AlbumListView()) {
                Text("Albums")
            }
            
            Text("Logout").onTapGesture {
                logoutPressed()            }
        }
    }
}

struct SideMenu: View {
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    let dashboardPressed: () -> Void
    let albumPressed: () -> Void
    let logoutPressed: () -> Void
    
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.menuClose()
            }
            
            HStack {
                MenuContent(dashboardPressed: dashboardPressed, albumPressed: albumPressed, logoutPressed: logoutPressed)
                    .frame(width: self.width)
                    .background(Color.white)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)
                
                Spacer()
            }
        }
    }
}



//struct SideMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        SideMenu(width: 250, isOpen: true, menuClose: {})
//    }
//}
