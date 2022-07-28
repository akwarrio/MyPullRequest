//
//  DateFormatter.swift
//  MyPR
//
//  Created by Aftab Khan on 29/07/22.
//

import UIKit


class DateFormatters{
    class func stringToFormatString(str: String) -> String {
        let dateFormatterS = DateFormatter()
        dateFormatterS.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatterS.date(from: str) else {
            return ""
        }
        let dateFormatterP = DateFormatter()
        dateFormatterP.dateFormat = "MMM d, yyyy"
        
        let formatStr = dateFormatterP.string(from: date)
        return formatStr
        
    }
}

extension UIImageView {

    func setCustomImage(_ imgURLString: String?) {
        guard let imageURLString = imgURLString else {
            self.image = UIImage(named: "default.png")
            return
        }
        DispatchQueue.global().async { [weak self] in
            let data = try? Data(contentsOf: URL(string: imageURLString)!)
            DispatchQueue.main.async {
                self?.image = data != nil ? UIImage(data: data!) : UIImage(named: "default.png")
            }
        }
    }
}
