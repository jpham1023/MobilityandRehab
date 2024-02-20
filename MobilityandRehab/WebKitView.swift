//
//  WebKitView.swift
//  MobilityandRehab
//
//  Created by Marcus Lustria on 2/20/24.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable{
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
}




