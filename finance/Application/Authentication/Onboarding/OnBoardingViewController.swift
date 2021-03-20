//
//  OnBoardingViewController.swift
//  finance
//
//  Created by Ivan Mosquera on 20/3/21.
//

import UIKit

struct OnBoardingItem {
    let title: String
    let description: String
    let imageName: String
}

class OnBoardingViewController: UIPageViewController {
    
    // MARK: - Properties
    var pageControl: UIPageControl?
    
    fileprivate(set) lazy var item: [OnBoardingItem] = {
        return [
            OnBoardingItem(
                title: "Save money and reduce debt",
                description: "Press start button.",
                imageName: ""),
            OnBoardingItem(
                title: "You've finished your onboarding",
                description: "Press start button.",
                imageName: "")
        ]
    }()

    fileprivate(set) lazy var contentViewController: [UIViewController] = {
        
        var items = [UIViewController]()
        
        for i in 0..<item.count{
            items.append(self.instanteViewController(i))
        }
        
        return items
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        
        pageControl?.numberOfPages = item.count
        updateContainerView(stepNumber: 0)
    }
    
    
    // MARK: - Private methods
    private func updateContainerView(stepNumber index: Int){
        setViewControllers([contentViewController[index]], direction: .forward, animated: true, completion: nil)
    }
    
    private func instanteViewController(_ index: Int) -> UIViewController {
        
        guard let viewController = UIStoryboard(name: "OnBoarding", bundle: Bundle.main).instantiateViewController(identifier: "OnBoardingSteps") as? OnBoardingStepsViewController else {
            
            return UIViewController()
        }
        
        viewController.item = item[index]
        
        return viewController
    }

}

// MARK: - Extension delegate
extension OnBoardingViewController: UIPageViewControllerDelegate{
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let index = contentViewController.firstIndex(of: (viewControllers?.first!)!) else{
            return
        }
        
        pageControl?.currentPage = index
    }
}

// MARK: - Extension datasource
extension OnBoardingViewController: UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index = contentViewController.firstIndex(of: viewController)
        
        if index == 0{
            return nil
        }
        
        return contentViewController[index! + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let index = contentViewController.firstIndex(of: viewController)
        
        if index == contentViewController.count - 1 {
            return nil
        }
        
        return contentViewController[index! + 1]
    }
    
    
}
