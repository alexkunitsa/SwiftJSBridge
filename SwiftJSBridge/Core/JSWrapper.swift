//
//  JSWrapper.swift
//  SwiftJSBridge
//
//  Created by Alex Kunitsa on 8/5/15.
//  Copyright (c) 2015 Alex Kunitsa. All rights reserved.
//

import Foundation
import WebKit

class JSWrapper: NSObject {
    
    var wkWebView = WKWebView()
    
    override init() {
        super.init()

        let configuration = WKWebViewConfiguration()
        let controller = WKUserContentController()
        
        controller.addScriptMessageHandler(self, name: "observe")
        configuration.userContentController = controller

        let path = NSBundle.mainBundle().pathForResource("jsToiOS", ofType: "html")
        let urlRequest = NSURLRequest(URL: NSURL(fileURLWithPath: path!)!)
        
        wkWebView = WKWebView(frame: CGRect.zeroRect, configuration: configuration)
        wkWebView.loadRequest(urlRequest)
        wkWebView.navigationDelegate = self
    }
}


extension JSWrapper: WKScriptMessageHandler {
    
    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
        // Check is we receive correct message
        if (message.name == "observe") {
            println(message.body)
        }
    }
}


extension JSWrapper: WKNavigationDelegate {
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        // When webView is loaded we can execute JS function
        let template = "doSmthWithJS('Hello from Swift')"
        
        wkWebView.evaluateJavaScript(template, completionHandler: { (object, error) -> Void in
            if (error != nil) {
                println(error)
            }
        })
    }
}