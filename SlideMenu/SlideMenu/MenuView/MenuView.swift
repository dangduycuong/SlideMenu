//
//  MenuView.swift
//  SlideMenu
//
//  Created by Dang Duy Cuong on 9/18/20.
//  Copyright © 2020 Dang Duy Cuong. All rights reserved.
//

import UIKit

struct DataMenuView {
    var isOpen: Bool?
    var action: ActionMainMenuView?
}

enum ActionMainMenuView {
    case revenue    //hoa hong
    case sellPoint  //diem ban
    case history
    case sms
    case notice
    case logout
    case null
}

class MenuView: UIView, UIPreviewActionItem, ToggleViewProtocol {
    var title: String = ""
    
    var isOpen: Bool = false
    
    @IBOutlet weak var menu: UIView!
    
    var closureMenu: ((DataMenuView)->(Void))?
    
    
    var closeDistance: CGFloat = 0.0
    
    var showDistance: CGFloat = 0
    
    var view: UIView!
    
    var coverAlpha: CGFloat = 0.4
    
    @IBOutlet weak var controlConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var imageUpandDownOfSelect: UIImageView!
    
    @IBOutlet weak var selectionWorkingTypeButton: UIButton!
    
    @IBOutlet weak var effectView: UIVisualEffectView!
    
    @IBOutlet weak var corverButton: UIButton!
    
    @IBOutlet weak var revenueButton: UIButton!    //hoa hong
    @IBOutlet weak var sellPointButton: UIButton!  //diem ban
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var smsButton: UIButton!
    @IBOutlet weak var noticeButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    var action = ActionMainMenuView.null
    var dataMenu = DataMenuView()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view = self
        setupToggleView(distance: menu.frame.height + 100)
        //         self.imageUpandDownOfSelect.transform = CGAffineTransform(rotationAngle: self.isOpen ? 0 : (45.0 * .pi) / 1.0)
        fillData()
        setDisplay()
    }
    
    func setDisplay() {
        setShadowView(view: menu)
        effectView.isHidden = true
    }
    
    func setShadowView(view: UIView) {
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
    }
    
    func fillData() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    @IBAction func onClickSelected(_ sender: UIButton) {

    }
    
    @IBAction func toggle(_ sender: UIButton! = nil) {
        isOpen = !isOpen
        dataMenu.isOpen = isOpen
        closureMenu?(dataMenu)
        performToggle(isOpen: isOpen)
        UIView.animate(withDuration: 0.35) {
            //            self.imageUpandDownOfSelect.transform = CGAffineTransform(rotationAngle: self.isOpen ? 0 : (45.0 * .pi) / 1.0)
            self.alpha = self.isOpen ? 1 : 0
            self.layoutIfNeeded()
        }
    }
    
    @IBAction func tapCoverButton(_ sender: UIButton!) {
        showHideMenu()
    }
    
    func showHideMenu() {
        isOpen = !isOpen
        dataMenu.isOpen = isOpen
        dataMenu.action = .null
        closureMenu?(dataMenu)
        performToggle(isOpen: isOpen)
        UIView.animate(withDuration: 0.35) {
            self.alpha = self.isOpen ? 1 : 0
            self.layoutIfNeeded()
        }
    }
    
    @IBAction func selectItemMenu(_ sender: UIButton!) {
        switch sender {
        case revenueButton:
            dataMenu.action = .revenue
        case sellPointButton:
            dataMenu.action = .sellPoint
        case historyButton:
            dataMenu.action = .history
        case smsButton:
            dataMenu.action = .sms
        case noticeButton:
            dataMenu.action = .notice
        case logoutButton:
            dataMenu.action = .logout
        default:
            dataMenu.action = .null
        }
        closureMenu?(dataMenu)
    }
    
    
}

