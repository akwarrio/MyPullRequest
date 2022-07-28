//
//  ViewController.swift
//  MyProduct
//
//  Created by Aftab Khan on 28/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var vm: ViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        vm = ViewModel(delegate: self)
        vm?.fetchList()
        // Do any additional setup after loading the view.
    }


}
extension ViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm?.numberOfRows() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = vm?.cellDataAtRow(index: indexPath.row) else {
            return UITableViewCell()
        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            cell.cellData = data
            cell.setData()
        return cell
     }
        
        return UITableViewCell()
    }
    
    
}

extension ViewController: ViewDelegate{
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

