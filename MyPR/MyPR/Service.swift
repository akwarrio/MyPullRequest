
//
//  Created by Aftab Khan on 28/07/22.
//

import Foundation

/*
 Please use your token
 -owner
 -repo
 */
var mytoken = "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"
var owner = "akwarrio"
var repo = "MyPullRequest"
class Service{
    
    class func fetchProduct(completionHandler: @escaping (_ result: PullRequests?) -> Void) {
        
        guard let url = URL(string: "https://api.github.com/repos/\(owner)/\(repo)/pulls?state=closed") else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("token \(mytoken)", forHTTPHeaderField: "Authorization")
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

