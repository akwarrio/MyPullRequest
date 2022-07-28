//
//  ViewModel.swift
//  MyProduct
//
//  Created by Aftab Khan on 28/07/22.
//

import Foundation
import UIKit

protocol ViewDelegate: AnyObject {
    func reloadData()
}


class ViewModel{
    
    private var pullRequests: [PR]?
    private weak var delegate: ViewDelegate?
    init(delegate: ViewDelegate) {
        self.delegate = delegate
    }
    
    func fetchList(){
        Service.fetchProduct { result in
            self.pullRequests = result
            self.delegate?.reloadData()
        }
    }
    
    func numberOfRows() -> Int {
        return pullRequests?.count ?? 0
    }
    func cellDataAtRow(index: Int) -> CellData? {
        if let data = pullRequests?[index] {
            let cellData = CellData(product: data)
            return cellData
        }
        return nil
    }
    
}
