//
//  ViewController.swift
//  NavigationTest
//
//  Created by Guillermo Ignacio Enriquez Gutierrez on 2022/07/14.
//

import UIKit

extension UINavigationItem {
    func setupOpaqueColor(_ color: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = color
        appearance.shadowColor = nil
        appearance.shadowImage = UIImage()

        standardAppearance = appearance
        scrollEdgeAppearance = appearance
        compactAppearance = appearance
    }
}

class ViewController: UIViewController {

    @IBAction func showNavigation12() {
        let vc = Router12.rootViewController()
        present(vc, animated: true, completion: nil)
    }

    @IBAction func showNavigation34() {
        let vc = Router34.rootViewController()
        present(vc, animated: true, completion: nil)
    }
}

