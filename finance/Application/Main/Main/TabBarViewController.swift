//
//  TabBarViewController.swift
//  finance
//
//  Created by Ivan Mosquera on 25/3/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        customAddButton()
    }
    
    // MARK: - Functions
    func customAddButton(){
        
        let addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        var addButtonFrame = addButton.frame
        
        addButtonFrame.origin.y = tabBar.frame.origin.y - 28
        addButtonFrame.origin.x = view.bounds.width / 2 - addButtonFrame.size.width / 2
        
        addButton.frame = addButtonFrame
        
        addButton.setImage(UIImage(systemName: "plus.rectangle.fill"), for: .normal)
        addButton.backgroundColor = UIColor.blue
        addButton.tintColor = UIColor.white
        addButton.layer.cornerRadius = 8
        
        view.addSubview(addButton)
        
        addButton.addTarget(self, action: #selector(addButtonAction(sender:)), for: .touchUpInside)
        
    }
    
    @objc private func addButtonAction(sender: UIButton){
        selectedIndex = 2
    }

}
