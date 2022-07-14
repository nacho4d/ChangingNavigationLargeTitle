//
//  Router1.swift
//  NavigationTest
//
//  Created by Guillermo Ignacio Enriquez Gutierrez on 2022/07/14.
//

import Foundation
import UIKit

class Router12 {

    class FirstViewController: UIViewController {

        // 極普通のUIViewControllerを作成。
        // NavigationバーやそのNavigationItemにほとんど変更加えない
        static func create() -> FirstViewController {
            let vc = FirstViewController()
            vc.view = UIView()
            vc.view.backgroundColor = UIColor.white
            vc.navigationItem.title = "1st Controller"
            vc.navigationItem.setupOpaqueColor(.systemPink)
            vc.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: vc, action: #selector(FirstViewController.pushSecond))
            return vc
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            // 注意B
            // trueに設定すると強制的にlargeTitleになるが
            // アニメーションがイマイチな感じ。
            navigationController?.navigationBar.prefersLargeTitles = true
        }

        @objc func pushSecond() {
            let other = SecondViewController.create()
            navigationController?.pushViewController(other, animated: true)
        }
    }

    class SecondViewController: UIViewController {

        // 極普通のUIViewControllerを作成。
        // NavigationバーやそのNavigationItemにほとんど変更加えない
        static func create() -> SecondViewController {
            let vc = SecondViewController()
            vc.view = UIView()
            vc.view.backgroundColor = UIColor.white
            vc.navigationItem.title = "2nd Controller"
            vc.navigationItem.setupOpaqueColor(.cyan)
            return vc
        }

        func pop() {
            navigationController?.popViewController(animated: true)
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            // 注意B
            // falseに設定すると強制的にsmallTitleになるが
            // アニメーションがイマイチな感じ。
            navigationController?.navigationBar.prefersLargeTitles = false
        }

    }

    static func rootViewController() -> UIViewController {

        let vc = FirstViewController.create()
        let nvc = UINavigationController()
        // 注意B
        // navigationBarでprefersLargeTitlesをtrueにすると
        // デフォルトでlargeTitleが採用される。
        nvc.navigationBar.prefersLargeTitles = true
        nvc.viewControllers = [vc]
        return nvc
    }
}
