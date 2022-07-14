//
//  Router2.swift
//  NavigationTest
//
//  Created by Guillermo Ignacio Enriquez Gutierrez on 2022/07/14.
//

import Foundation
import UIKit

class Router34 {

    class ThirdViewController: UIViewController {
        // 極普通のUIViewControllerを作成。
        // NavigationItem: largeTitleをalwaysに設定
        static func create() -> ThirdViewController {
            let vc = ThirdViewController()
            vc.view = UIView()
            vc.view.backgroundColor = UIColor.white
            vc.navigationItem.title = "3rd Controller"
            vc.navigationItem.setupOpaqueColor(.systemPink)
            vc.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: vc, action: #selector(ThirdViewController.pushForth))

            // 注意A
            vc.navigationItem.largeTitleDisplayMode = .always
            return vc
        }

        @objc func pushForth() {
            let other = ForthViewController.create()
            navigationController?.pushViewController(other, animated: true)
        }

    }

    class ForthViewController: UIViewController {

        // 極普通のUIViewControllerを作成。
        // NavigationItem: largeTitleをneverに設定
        static func create() -> ForthViewController {
            let vc = ForthViewController()
            vc.view = UIView()
            vc.view.backgroundColor = UIColor.white
            vc.navigationItem.title = "4th Controller"
            vc.navigationItem.setupOpaqueColor(.cyan)

            // 注意A
            vc.navigationItem.largeTitleDisplayMode = .never
            return vc
        }

        @objc func pop() {
            navigationController?.popViewController(animated: true)
        }
    }

    static func rootViewController() -> UIViewController {

        let vc = ThirdViewController.create()
        let nvc = UINavigationController()
        // 注意A
        // まず、navigationBarでprefersLargeTitlesをtrueにすると
        // デフォルトでlargeTitleが採用される。
        // そして 各画面では vc.navigationItem.largeTitleDisplayMode
        // を適切に変更することができて、アニメーションはいい感じで表示される。
        nvc.navigationBar.prefersLargeTitles = true
        nvc.viewControllers = [vc]
        return nvc
    }

}
