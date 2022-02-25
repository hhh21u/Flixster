//
//  WebViewController.swift
//  Tipster
//
//  Created by Chen Hanrui on 2022/2/24.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate{
    var id: String = ""
    //var url: String = ""
    
    @IBOutlet weak var movieWeb: WKWebView!
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBAction func backAct(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    var webView: WKWebView!
    
    var movies = [[String:Any]]()

    override func loadView() {
            let webConfiguration = WKWebViewConfiguration()
            webView = WKWebView(frame: .zero, configuration: webConfiguration)
            webView.uiDelegate = self
            view = webView
        }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let data = id
            let webURL = "https://api.themoviedb.org/3/movie/"
            
            print("********")
            print(data)
            let myURL = URL(string: webURL + data + "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")
            let request = URLRequest(url: myURL!)
            //webView.load(myRequest)
            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            let task = session.dataTask(with: request) { (data, response, error) in
                 // This will run when the network request returns
                 if let error = error {
                        //print(error.localizedDescription)
                 } else if let data = data {
                        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    let movie = dataDictionary["results"] as! [[String: Any]]
                    
                    
                    self.webView.reloadInputViews()
                    //self.reloadInputViews()
            
                    print(movie[0])
                    print("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\")
                    
                    let key = movie[0]["key"] as! String
                    let youtube = "https://www.youtube.com/watch?v="
                    let finalURL = URL(string: youtube + key)
                    let reque = URLRequest(url: finalURL!)
                    self.webView.load(reque)
                    print(reque)
                 }
            }
//            let finalURL = URL(string: "https://www.youtube.com/watch?v=19pkBDAWPE8")
//            let reque = URLRequest(url: finalURL!)
//            webView.load(reque)
            
            task.resume()
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
