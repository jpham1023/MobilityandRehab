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
    
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let youtubeURL = "https://www.youtube.com/embed/\(videoID)?playsinline=1"
        if let url = URL(string: youtubeURL){
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}




