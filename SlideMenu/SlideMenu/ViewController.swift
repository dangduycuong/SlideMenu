//
//  ViewController.swift
//  SlideMenu
//
//  Created by Dang Duy Cuong on 9/18/20.
//  Copyright © 2020 Dang Duy Cuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var sideMenuView: MenuView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMenuView()
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(addTapped))
        
        let bar = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-menu"), style: .plain, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem = bar
        
//        navigationItem.leftBarButtonItem?.image = #imageLiteral(resourceName: "icons8-menu")
    }

    @objc func addTapped() {
        sideMenuView.toggle()
    }
    
    
    func setMenuView() {
        view.addSubview(sideMenuView)
        sideMenuView.fill(left: 0, top: 0, right: 0, bottom: -100)
        sideMenuView.alpha = 0
        sideMenuView.closureMenu = { [weak self] (data) in
            if let isOpen = data.isOpen {
                self?.navigationController?.navigationBar.isHidden = isOpen
            }
            if let action = data.action {
                self?.selectActionMenu(action)
            }
        }
        sideMenuView.reloadInputViews()
    }
    
    func selectActionMenu(_ action: ActionMainMenuView) {
    
    }

}

