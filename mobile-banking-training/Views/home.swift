//
//  ViewController.swift
//  mobile-banking-training
//
//  Created by Sao Sophea on 19/12/22.
//

import UIKit

struct MenuIcon {
    let id: Int
    let title: String
    let icon: String
}

struct CardInfo {
    let iconName: String
    let title: String
    let cardNum: String
    let amount: String
    let expire: String
    let bgColor: String
}

class Myhome: UIViewController {
    
    var buttonTags:[Int:String]?
    
    override func viewDidLoad() {
        setupViews()
        setupLayouts()
    }
    
    func setupViews() {
        view.addSubview(scrollView)
        vStack.addArrangedSubview(header)
        vStack.addArrangedSubview(balanceVStack)

        body.addSubview(bodyMenu)
        body.addSubview(myCard)
        body.addSubview(recentTransaction)
        vStack.addArrangedSubview(body)
        scrollView.addSubview(vStack)
    }
 
    override func viewDidAppear(_ animated: Bool) {
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 1)
    }

    func setupLayouts() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])

        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50),
            vStack.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 53),
            vStack.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])

        NSLayoutConstraint.activate([
            header.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 26.0),
            header.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -26.0)
        ])

        NSLayoutConstraint.activate([
            body.heightAnchor.constraint(equalToConstant: 800),
            body.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            body.topAnchor.constraint(equalTo: balanceVStack.bottomAnchor, constant: 23),
            body.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            bodyMenu.topAnchor.constraint(equalTo: body.topAnchor, constant: 57.67),
            bodyMenu.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 26.0),
            bodyMenu.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 53),
            bodyMenu.heightAnchor.constraint(equalToConstant: 112),
        ])


        NSLayoutConstraint.activate([
            myCard.topAnchor.constraint(equalTo: bodyMenu.bottomAnchor, constant: 39),
            myCard.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 26.0),
            myCard.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 53),
            myCard.heightAnchor.constraint(equalToConstant: 224)
        ])

        NSLayoutConstraint.activate([
            recentTransaction.topAnchor.constraint(equalTo: myCard.bottomAnchor, constant: 39),
            recentTransaction.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 26.0),
            recentTransaction.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 53),
            recentTransaction.heightAnchor.constraint(equalToConstant: 224)
        ])
    }

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor(named: "appColor")

        return scrollView
    }()
    private let header : UIStackView = {
        let wellcome = UILabel()
        wellcome.font = wellcome.font.withSize(18)
        wellcome.textColor = UIColor(named: "textGray")
        wellcome.text = "Good Morning! ssdf"
        wellcome.textAlignment = .left

        let name = UILabel()
        name.font = name.font.withSize(22)
        name.textColor = UIColor.white
        name.text = "Jonh Smith"
        name.textAlignment = .left  /// testsfsdfdfgg
        let image = UIImage(named: "userProfile")
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 60.0),
            imageView.widthAnchor.constraint(equalToConstant: 60.0),
        ])

        let headerText = UIStackView.customStackView(.vertical, distribution: .fillEqually, subviews: [wellcome, name])
        let header = UIStackView(arrangedSubviews: [headerText, imageView])

        return header
    }()
    private let vStack: UIStackView = {
        let headerStackView = UIStackView()
        headerStackView.axis = .vertical
        headerStackView.spacing = 15
        headerStackView.translatesAutoresizingMaskIntoConstraints = false

        return headerStackView
    }()
    private let balanceVStack: UIStackView = {
        let amount = UILabel()
        amount.font = amount.font.withSize(26)
        amount.textColor = UIColor.white
        amount.text = "$ 8,640.00"
        amount.textAlignment = .center

        let balanceStatus = UILabel()
        balanceStatus.font = balanceStatus.font.withSize(14)
        balanceStatus.textColor = UIColor(named: "textGray")
        balanceStatus.text = "Available Balance"
        balanceStatus.textAlignment = .center

        let stack =  UIStackView(arrangedSubviews: [amount, balanceStatus])
        stack.axis = .vertical
        stack.spacing = 10

        return stack
    }()
    private let body: UIView = {
        let body = UIView()
        body.backgroundColor = UIColor.white
        body.layer.masksToBounds = true
        body.layer.cornerRadius = 50
        body.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return body
    }()
    private let bodyMenu: UIStackView = {

        let menuNameTest = [
            MenuIcon(id: 1, title: "Transfer", icon: "transfer"),
            MenuIcon(id: 2, title: "Bills", icon: "payment"),
            MenuIcon(id: 3, title: "Recharge", icon: "mobile"),
            MenuIcon(id: 4, title: "More", icon: "more")
        ]

        lazy var imageViewsTest = menuNameTest.map({(icon: MenuIcon) -> UIStackView in
            let iconContainer = UIButton(frame: CGRect(x:0 , y:0, width:76, height: 76))
            let imageView = UIImageView(image: UIImage(named: icon.icon)?.resize(120))
            imageView.tintColor = UIColor(named: "appColor")
            imageView.center = iconContainer.center
//
            NSLayoutConstraint.activate([
                iconContainer.widthAnchor.constraint(equalToConstant: 76),
                iconContainer.heightAnchor.constraint(equalToConstant: 76)
            ])
//
// 
            iconContainer.backgroundColor = UIColor(named: "softBlue")
            iconContainer.layer.cornerRadius = 38
            iconContainer.addSubview(imageView)
            var config = UIButton.Configuration.gray()
            config.cornerStyle = .capsule
            iconContainer.configuration = config
//            iconContainer.addTarget(superclass, action: #selector(buttonAction(_:)), for: .touchDown)
            iconContainer.tag = icon.id
 
   
            let title = UILabel()
            title.font = title.font.withSize(16)
            title.textColor = UIColor(named: "softBlueFont")
            title.text = icon.title
            title.textAlignment = .center

            let stack = UIStackView(arrangedSubviews: [iconContainer, title])
            stack.axis = .vertical
            stack.spacing = 19

            return stack

        })

        let bodyMenuImg = UIStackView(arrangedSubviews: imageViewsTest)
        bodyMenuImg.axis = .horizontal
        bodyMenuImg.distribution = .equalSpacing
        bodyMenuImg.translatesAutoresizingMaskIntoConstraints = false

        return bodyMenuImg

    }()
    
    @objc func buttonAction(_ sender: UIButton) {
        print("Button tapped: \(sender.tag)")
        //        present(Mycard(), animated: true, completion: nil)
        //        self.navigationController?.pushViewController(Mycard(), animated: true)
    }
    private lazy var myCard: UIStackView = {
        let cardTitle = UILabel.customLabel(fontSize: 16, textColor: UIColor.black, text: "My Cards", textAlign: .left)
        let viewAll     = UILabel.customLabel(fontSize: 16, textColor: UIColor.black, text: "View all", textAlign: .justified)
        viewAll.underline()

        let cardHeader = UIStackView(arrangedSubviews: [cardTitle, viewAll])
        cardHeader.axis = .horizontal
        cardHeader.distribution = .equalSpacing

        let divider = UIView.divider(thickness: 0.5, axis: .horizontal, color: UIColor.gray)

        let cardInfo = [
            CardInfo(iconName: "visa", title: "Visa Card", cardNum: "***2345", amount: "$2,200", expire: "01/24", bgColor: ""),
            CardInfo(iconName: "master", title: "Master Card", cardNum: "***65345", amount: "$5,200", expire: "01/29", bgColor: "")
        ]
        let cardCell = cardInfo.map({(icon: CardInfo) -> UIStackView in
            let cardName = UILabel.customLabel(fontSize: 16, textColor: UIColor.white, text: icon.title, textAlign: .justified)
            let cardNum = UILabel.customLabel(fontSize: 12, textColor: UIColor(named: "textGray"), text: icon.cardNum, textAlign: .left)
            let customIcon = UIView.customIcon(size: 52, iconSize: 100, iconName: icon.iconName, bgColor: "cardBg")
            let cardAmount = UILabel.customLabel(fontSize: 16, textColor: UIColor.white, text: icon.amount, textAlign: .right)
            let cardExpire = UILabel.customLabel(fontSize: 12, textColor: UIColor(named: "textGray"), text: "01/24", textAlign: .right)
            let amountStack = UIStackView.customStackView(.vertical, subviews: [cardAmount, cardExpire])
            let nameStack = UIStackView.customStackView(.vertical, subviews: [cardName, cardNum])
            let iconLeft = UIStackView.customStackView(.horizontal, spacing: 16, subviews: [customIcon, nameStack])
            let cardCell = UIStackView(arrangedSubviews: [iconLeft, amountStack])

            return cardCell
        })

        let bgCard = UIStackView.customStackView(.vertical, distribution: .equalSpacing, subviews: [cardCell[0], divider, cardCell[1]])

        let alignCard = UIView()
        alignCard.addSubview(bgCard)
        alignCard.layer.masksToBounds = true
        alignCard.layer.cornerRadius = 20
        alignCard.backgroundColor = UIColor(named: "appColor")


        NSLayoutConstraint.activate([
            bgCard.topAnchor.constraint(equalTo: alignCard.topAnchor, constant: 18.0),
            bgCard.leadingAnchor.constraint(equalTo: alignCard.leadingAnchor, constant: 20.0),
            bgCard.trailingAnchor.constraint(equalTo: alignCard.trailingAnchor, constant: -20.0),
            bgCard.bottomAnchor.constraint(equalTo: alignCard.bottomAnchor, constant: -18.0)
        ])

        let cardContainer = UIStackView(arrangedSubviews: [cardHeader, alignCard])
        cardContainer.axis = .vertical
        cardContainer.spacing = 29
        cardContainer.translatesAutoresizingMaskIntoConstraints = false

        return cardContainer

    }()
    private lazy var recentTransaction: UIStackView = {
        let cardTitle = UILabel.customLabel(fontSize: 16, textColor: UIColor.black, text: "Recent Transactions", textAlign: .left)
        let viewAll   = UILabel.customLabel(fontSize: 16, textColor: UIColor.black, text: "View all", textAlign: .justified)

        viewAll.underline()

        let cardHeader = UIStackView(arrangedSubviews: [cardTitle, viewAll])
        cardHeader.axis = .horizontal
        cardHeader.distribution = .equalSpacing

        let divider = UIView.divider(thickness: 0.5, axis: .horizontal, color: UIColor.gray)

        let cardInfo = [
            CardInfo(iconName: "shopping", title: "Grocery", cardNum: "", amount: "$2,200", expire: "", bgColor: "softRed"),
            CardInfo(iconName: "bill", title: "IESCO Bill", cardNum: "", amount: "$5,200", expire: "", bgColor: "softGray")
        ]
        let cardCell = cardInfo.map({(icon: CardInfo) -> UIStackView in
            let cardName = UILabel.customLabel(fontSize: 16, textColor: UIColor.white, text: icon.title, textAlign: .justified)
            let customIcon = UIView.customIcon(size: 52, iconSize: 90, iconName: icon.iconName, bgColor: icon.bgColor)
            let cardAmount = UILabel.customLabel(fontSize: 16, textColor: UIColor.white, text: icon.amount, textAlign: .right)
            let iconLeft = UIStackView.customStackView(.horizontal, spacing: 16, subviews: [customIcon, cardName])
            let cardCell = UIStackView(arrangedSubviews: [iconLeft, cardAmount])

            return cardCell
        })

        let bgCard = UIStackView.customStackView(.vertical, distribution: .equalSpacing, subviews: [cardCell[0], divider, cardCell[1]])

        let alignCard = UIView()
        alignCard.addSubview(bgCard)
        alignCard.layer.masksToBounds = true
        alignCard.layer.cornerRadius = 20
        alignCard.backgroundColor = UIColor(named: "appColor")


        NSLayoutConstraint.activate([
            bgCard.topAnchor.constraint(equalTo: alignCard.topAnchor, constant: 18.0),
            bgCard.leadingAnchor.constraint(equalTo: alignCard.leadingAnchor, constant: 20.0),
            bgCard.trailingAnchor.constraint(equalTo: alignCard.trailingAnchor, constant: -20.0),
            bgCard.bottomAnchor.constraint(equalTo: alignCard.bottomAnchor, constant: -18.0)
        ])

        let cardContainer = UIStackView(arrangedSubviews: [cardHeader, alignCard])
        cardContainer.axis = .vertical
        cardContainer.spacing = 29
        cardContainer.translatesAutoresizingMaskIntoConstraints = false

        return cardContainer

    }()
}

#if DEBUG
import SwiftUI

private struct VCRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }

    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        Myhome()
    }
}

@available(iOS 15.0, *)
struct Home_Preview: PreviewProvider {
    @available(iOS 15.0, *)
    static var previews: some View {
        VCRepresentable()
            .previewDevice("iPhone 11 Pro Max")
            .ignoresSafeArea(.all)
            .previewInterfaceOrientation(.portrait)
    }
}
#endif
