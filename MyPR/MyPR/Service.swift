
//
//  Created by Aftab Khan on 28/07/22.
//

import Foundation

class Service{
    
    
    class func fetchProduct(completionHandler: @escaping (_ result: PullRequests?) -> Void) {
        
        guard let url = URL(string: "https://api.github.com/repos/akwarrio/MyPullRequest/pulls?state=closed") else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("token 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", forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/vnd.github+json", forHTTPHeaderField: "Accept")
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { data, resp, error in
            let decoder = JSONDecoder()
            guard let data = data else {
                return
            }
            if let result = try? decoder.decode(PullRequests.self, from: data) {
                completionHandler(result)
            }
        }
        task.resume()
        
    }
    
    
}

