//
//  Card.swift
//  mobile-banking-training
//
//  Created by Sao Sophea on 20/12/22.
//

import UIKit

class Mycard: UIViewController {
    override func viewDidLoad() {
        setupViews()
        setupLayouts()
    }
    
    func setupViews() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(bgheader)
    }
    
    func setupLayouts() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            bgheader.topAnchor.constraint(equalTo: view.topAnchor),
            bgheader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bgheader.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bgheader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let bgheader : UIView = {
        let bgheader = UIView()
        bgheader.backgroundColor = UIColor.red
        bgheader.layer.masksToBounds = true
        
        return bgheader
    }()
}

 
#if DEBUG
import SwiftUI

private struct VCRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }

    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        Mycard()
    }
}

@available(iOS 15.0, *)
struct RunningPaceCalculatorViewController_Preview: PreviewProvider {
    @available(iOS 15.0, *)
    static var previews: some View {
        VCRepresentable()
            .previewInterfaceOrientation(.portrait)
            .ignoresSafeArea(.all)
    }
}
#endif
