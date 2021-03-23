//
//  TransactionsViewController.swift
//  finance
//
//  Created by Ivan Mosquera on 21/3/21.
//

import UIKit

class TransactionsViewController: UIViewController {
    
    // MARK: - Properties
    fileprivate(set) lazy var emptyStateView: UIView = {
        
        guard let view = Bundle.main.loadNibNamed("EmptyState", owner: nil, options: [:])?.first as? UIView else{
            
            return UIView()
        }
        
        return view
    }()
    
    // MARK: - Outlets
    @IBOutlet weak var transactionsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        transactionsTableView.delegate = self
        transactionsTableView.dataSource = self
    }
    

}

// MARK: - TableViewDelegate
extension TransactionsViewController: UITableViewDelegate{
    
}

// MARK: - TableViewDataSource
extension TransactionsViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = 0
           
        tableView.backgroundView = count == 0 ? emptyStateView : nil
        tableView.separatorStyle = count == 0 ? .none : .singleLine
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath)
        
        
    }
    
    
}
