//
//  SWRevelController.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 02/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation
import SWRevealViewController

class SWRevelController: SWRevealViewController {

    func setMenuController(_ controller: UIViewController) {
        self.setRear(controller, animated: false)
    }
    
    func setMainController(_ controller: UIViewController) {
        self.setFront(getNavigationController(controller), animated: true)
    }
    
    private func getNavigationController(_ controller: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        let barButton = UIBarButtonItem(customView: generateBarIcon(image:#imageLiteral(resourceName: "menu-icon")))
        controller.navigationItem.setLeftBarButton(barButton, animated: false)
        return navigationController
    }
    
    private func generateBarIcon(image: UIImage) -> UIView {
        // Set a custom hamburger bar button with an offset
        let button = UIButton(type: .system)
        let image = image.withRenderingMode(.alwaysTemplate)
        button.setBackgroundImage(image, for: .normal)
        button.tintColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        button.addTarget(self, action: #selector(self.toggleReveal), for: UIControl.Event.touchUpInside)
        button.frame = CGRect(x: -3, y: 4, width: 30, height: 30)
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 38))
        customView.addSubview(button)
        return customView
    }
    
    @objc func toggleReveal(){
        self.revealToggle(animated: true)
    }
}
