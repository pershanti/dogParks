//
//  ViewController.swift
//  DogParks
//
//  Created by Shantini Persaud on 12/7/18.
//  Copyright © 2018 Shantini Persaud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func testAPI(_ sender: UIButton) {
        let endpoint = "https://i3feex1h38.execute-api.us-west-2.amazonaws.com/default/sayHi"
        guard let url = URL(string: endpoint) else { return }
        let context: [AnyHashable : Any] = ["reply" : "Shantini"]
        let jsonContext = try? JSONSerialization.data(withJSONObject: context)
        var request = URLRequest(url: url)
        request.httpBody = jsonContext

        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data, let answer = String(data: data, encoding: String.Encoding.utf8) {
                print("answer: ", answer)
            }
            else if let error = error {
                print("API ERROR \(error)")
            }
        }
        task.resume()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

