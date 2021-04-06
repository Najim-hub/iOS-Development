//
//  WebsiteViewController.swift
//  UserAccount
//
//  Created by Najim Mohammed on 2021-02-08.
//

import UIKit
import WebKit

class WebsiteViewController: UIViewController, WKNavigationDelegate {

    
    @IBOutlet var webView : WKWebView!
    @IBOutlet var loading : UIActivityIndicatorView!
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        
        loading.isHidden = false
        loading.startAnimating()
        
        
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loading.isHidden = true
        loading.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlAddress = URL(string: "https://www.apple.com/ca/");
        
        let url = URLRequest(url: urlAddress!)
        
        webView.load(url)
        
        webView.navigationDelegate = self
        
        

        // Do any additional setup after loading the view.
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
