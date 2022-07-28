//
//  TableViewCell.swift
//  MyProduct
//
//  Created by Aftab Khan on 28/07/22.
//

import UIKit

struct CellData {
    var pr: PR
}

class TableViewCell: UITableViewCell {
    
    var cellData: CellData?
    @IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var createdOnLbl: UILabel!
    @IBOutlet weak var closedOnLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(){
        
        if let data = cellData?.pr {
            
        }
        
    }


}
