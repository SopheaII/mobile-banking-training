//
//  AppRouter.swift
//  mobile-banking-training
//
//  Created by Sao Sophea on 19/12/22.
//

import UIKit

class AppRouter: UITabBarController {
    
    let image = UIImage.gradientImageWithBounds(
        bounds: CGRect( x: 0, y: 0, width: UIScreen.main.scale, height: 13),
        colors: [
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(0.08).cgColor
        ]
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func navBar(title: String, icon: String, iconFill: String, tag: Int, screen: UIViewController) ->UIViewController {
        let viewController = screen
        
        let tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: icon), tag: tag)
        
        tabBarItem.selectedImage = UIImage(systemName: iconFill)
        
        
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }
    
    func setupTabBar() {
        let tabBarItems = [
            navBar(title: "Home", icon: "house", iconFill: "house.fill", tag: 1, screen: Myhome() ),
            navBar(title: "Card", icon: "creditcard", iconFill: "creditcard.fill", tag: 2, screen: Myhome()),
            navBar(title: "Transaction", icon: "list.bullet.rectangle.portrait", iconFill: "list.bullet.rectangle.portrait.fill", tag: 3, screen: Myhome()),
            navBar(title: "Profile", icon: "person", iconFill: "person.fill", tag: 4, screen: Myhome())]
        
        let appearance = UITabBarAppearance()
        appearance.backgroundImage = UIImage()
        appearance.shadowImage = image
        UITabBar.appearance().tintColor = UIColor(named: "appColor")
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().backgroundColor = UIColor.white
        viewControllers = tabBarItems
    }
}

#if DEBUG
import SwiftUI

private struct VCRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }

    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        AppRouter()
    }
}

@available(iOS 15.0, *)
struct AppRouter_Preview: PreviewProvider {
    @available(iOS 15.0, *)
    static var previews: some View {
        VCRepresentable()
            .previewInterfaceOrientation(.portrait)
            .ignoresSafeArea(.all)
    }
}
#endif

