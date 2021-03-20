//
//  OnBoardingStepsViewController.swift
//  finance
//
//  Created by Ivan Mosquera on 20/3/21.
//

import UIKit

class OnBoardingStepsViewController: UIViewController {
    
    // MARK: - Properties
    var item: OnBoardingItem?
    
    // MARK: - Outlets
    @IBOutlet weak var stepImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = item?.title ?? "Title default"
        subtitleLabel.text = item?.description ?? "Description default"
        stepImageView.image = UIImage(systemName: "face.smiling ")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
