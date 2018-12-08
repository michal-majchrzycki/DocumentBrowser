//
//  Spinner.swift
//  DocumentBrowser
//
//  Created by Michal on 08/12/2018.
//  Copyright © 2018 MichalMajchrzycki. All rights reserved.
//

import UIKit

open class Spinner {
    
    internal static var spinner: UIActivityIndicatorView?
    public static var style: UIActivityIndicatorView.Style = .whiteLarge
    public static var baseBackColor = UIColor.black.withAlphaComponent(0.5)
    public static var baseColor = UIColor.blue
    
    public static func spin(style: UIActivityIndicatorView.Style = style, backColor: UIColor = baseBackColor) {
        if spinner == nil, let window = UIApplication.shared.keyWindow {
            let frame = UIScreen.main.bounds
            spinner = UIActivityIndicatorView(frame: frame)
            spinner!.backgroundColor = baseBackColor
            spinner!.style = style
            spinner?.color = baseColor
            window.addSubview(spinner!)
            spinner!.startAnimating()
        }
    }
    
    public static func stop() {
        if let spin = spinner {
            spin.stopAnimating()
            spin.removeFromSuperview()
            spinner = nil
        }
    }
}
