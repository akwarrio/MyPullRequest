//
//  TableViewCell.swift
//  MyProduct
//
//  Created by Aftab Khan on 28/07/22.
//

import UIKit

struct CellData {
    var title: String?
    var created: String?
    var closedOn: String?
    var userName: String?
    var userAvatar: String?
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
        
        if let data = cellData{
            TitleLbl.text = "# " + (data.title ?? "")
            createdOnLbl.text = "Created On: " + (data.created ?? "")
            closedOnLbl.text = "Closed On: " + (data.closedOn ?? "")
            usernameLbl.text = data.userName
            guard let avatarStr = data.userAvatar else {
                return
            }
            userImage.setCustomImage(avatarStr)
        }
        
    }


}
