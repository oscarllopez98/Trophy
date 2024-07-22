//
//  UIApplication.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/19/24.
//

import UIKit

import UIKit

extension UIApplication {
    func endEditing() {
        windows.forEach { window in
            window.endEditing(true)
        }
    }
}
