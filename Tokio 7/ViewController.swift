//
//  ViewController.swift
//  Tokio 7
//
//  Created by Osasu sanchez on 11/2/26.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    var ver : Int = 0
    
    @IBOutlet weak var miWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if ver == 0 {
            let request = URLRequest(url: URL(string: "https://www.apple.com")!)
            miWebView.load(request)
        }else {
            if let ruta = Bundle.main.path(forResource: "emailPantalla", ofType: "html"),
               let contenido = try? String(contentsOfFile: ruta, encoding: .utf8) {
                miWebView.loadHTMLString(contenido, baseURL: nil)
            }
            
                //        miWebView.load(URLRequest(url: URL(string: "https://www.apple.com/es/")!))
        }
    }
}

