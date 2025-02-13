

//import SwiftUI
//
//struct MainTabbarView: View {
//    @State private var selectedTab: Int = 0
//    @State private var isTabBarHidden = false  // Track tab bar visibility
//    
//    let tabs = [
//        (title: "Inbox", icon: "bubble.fill"),
//        (title: "Updates", icon: "dial.low"),
//        (title: "Community", icon: "person.3.fill"),
//        (title: "Calls", icon: "phone.fill"),
//        (title: "Settings", icon: "gear")
//    ]
//    
//    var body: some View {
//        VStack(spacing: -40){
//            TabView(selection: $selectedTab) {
//                InboxView().tag(0)
//                Text("Updates").tag(1)
//                Text("Community").tag(2)
//                Text("Calls").tag(3)
//                Text("Settings").tag(4)
//            }
//            CustomTabBar(selectedTab: $selectedTab, tabs: tabs)
//        }
//        .edgesIgnoringSafeArea(.bottom)
//    }
//}

import SwiftUI

struct MainTabbarView: View {
    @State private var selectedTab: Int = 0
    @State private var isTabBarHidden = false  // Track tab bar visibility
    
    let tabs = [
        (title: "Inbox", icon: "bubble.fill"),
        (title: "Updates", icon: "dial.low"),
        (title: "Community", icon: "person.3.fill"),
        (title: "Calls", icon: "phone.fill"),
        (title: "Settings", icon: "gear")
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {  // Align tab bar at the bottom
            NavigationStack {
                TabView(selection: $selectedTab) {
                    InboxView(isTabBarHidden: $isTabBarHidden).tag(0)
                    Text("Updates").tag(1)
                    Text("Community").tag(2)
                    Text("Calls").tag(3)
                    Text("Settings").tag(4)
                }
            }
            
            // Conditionally show the custom tab bar
            if !isTabBarHidden {
                CustomTabBar(selectedTab: $selectedTab, tabs: tabs)
                    .transition(.move(edge: .bottom))  // Smooth animation
                    .animation(.easeInOut(duration: 0.3), value: isTabBarHidden)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}



struct CustomTabBar: View {
    @Binding var selectedTab: Int
    let tabs: [(title: String, icon: String)]
    
    var body: some View {
        HStack {
            ForEach(0..<tabs.count, id: \.self) { index in
                Spacer()
                Button(action: {
                    withAnimation(.spring()) {
                        selectedTab = index
                    }
                }) {
                    VStack(spacing: 6) {
                        Image(systemName: tabs[index].icon)
                            .font(.system(size: selectedTab == index ? 24 : 20, weight: .bold))
                            .foregroundColor(selectedTab == index ? .black : .gray)
                        
                        Text(tabs[index].title)
                            .font(.caption)
                            .foregroundColor(selectedTab == index ? .black : .gray)
                    }
                }
                Spacer()
            }
        }
        .frame(height: 70)
        .background(.ultraThinMaterial)
        .cornerRadius(30)
        .padding(.horizontal, 16)
        .padding(.bottom,30)
        .shadow(radius: 5)
    }
}

#Preview {
    MainTabbarView()
}
