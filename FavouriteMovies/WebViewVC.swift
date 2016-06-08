//
//  WebViewVC.swift
//  FavouriteMovies
//
//  Created by Adam Thuvesen on 2016-05-21.
//  Copyright © 2016 Adam Thuvesen. All rights reserved.
//

import UIKit
import WebKit

class WebViewVC: UIViewController {
    
    @IBOutlet weak var container: UIView!
    var webView: WKWebView!
    var link: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        webView = WKWebView()
        container.addSubview(webView)
    }
    
    override func viewDidAppear(animated: Bool) {
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webView.frame = frame
        
        print("loadRequest..")
        loadRequest("http://www.imdb.com/")
        print("Done loading!")
    }
    
    func loadRequest(urlStr: String) {
        let url = NSURL(string: urlStr)!
        let request = NSURLRequest(URL: url)
        
        webView.loadRequest(request)
    }

    @IBAction func cancelButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
