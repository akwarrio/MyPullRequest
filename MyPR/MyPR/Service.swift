
//
//  Created by Aftab Khan on 28/07/22.
//

import Foundation

class Service{
    
    
    class func fetchProduct(completionHandler: @escaping (_ result: [PR]?) -> Void) {
        
        guard let url = URL(string: "https://api.github.com/repos/akwarrio/MyPullRequest/pulls") else {
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, resp, error in
            let decoder = JSONDecoder()
            guard let data = data else {
                return
            }
            if let result = try? decoder.decode(PRList.self, from: data) {
                completionHandler(result.prS)
            }
        }
        task.resume()
        
    }
    
    
}

