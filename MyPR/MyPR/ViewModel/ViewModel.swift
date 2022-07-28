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
    
    private var pullRequests: PullRequests?
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
            let cellData = formatData(data: data)
            return cellData
        }
        return nil
    }
    
    private func formatData(data: PR) -> CellData {
        var cellData = CellData()
        cellData.title = data.title
        if let created = data.created_at {
            cellData.created = DateFormatters.stringToFormatString(str: created)
        }
        if let closed = data.closed_at {
            cellData.closedOn = DateFormatters.stringToFormatString(str: closed)
        }
        cellData.userName = data.user?.login
        cellData.userAvatar = data.user?.avatar_url
        return cellData
    }
    
}
