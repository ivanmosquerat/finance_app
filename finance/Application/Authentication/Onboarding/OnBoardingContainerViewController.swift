//
//  OnBoardingContainerViewController.swift
//  finance
//
//  Created by Ivan Mosquera on 20/3/21.
//

import UIKit

class OnBoardingContainerViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Outles
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "openOnBoarding", let destination = segue.destination as? OnBoardingViewController else {
            return
        }
        
        destination.pageControl = pageControl
    }

}
