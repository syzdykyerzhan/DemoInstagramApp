//
//  ViewController.swift
//  Project_1
//
//  Created by Yerzhan Syzdyk on 24.01.2023.
//

import UIKit
import SnapKit

final class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: HomePageViewController())
        let vc2 = UINavigationController(rootViewController: SearchViewController())
        let vc3 = UINavigationController(rootViewController: AddViewController())
        let vc4 = UINavigationController(rootViewController: ReelsViewController())
        let vc5 = UINavigationController(rootViewController: ProfileViewController())
        
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.fill")
        vc3.tabBarItem.image = UIImage(systemName: "plus.app")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "plus.app.fill")
        vc4.tabBarItem.image = UIImage(systemName: "play.square")
        vc4.tabBarItem.selectedImage = UIImage(systemName: "play.square.fill")
        vc5.tabBarItem.image = UIImage(systemName: "person.circle")
        vc5.tabBarItem.selectedImage = UIImage(systemName: "person.circle.fill")
        
        
        setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: true)
        
        tabBar.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let width = self.view.frame.width
        let height = self.view.frame.height
        let box = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        let imageView = UIImageView(frame: CGRect(x: width/2 - width/3/2, y: height/2 - height/3/2, width: width/3, height: height/3))
        imageView.image = UIImage(named: "insta")
        imageView.contentMode = .scaleAspectFill
        box.backgroundColor = .black
        self.view.addSubview(box)
        box.addSubview(imageView)
        
        let animator = UIViewPropertyAnimator(duration:1, curve: .easeInOut) {
            box.frame = box.frame.offsetBy(dx:width, dy:0)
            
         }
         animator.startAnimation()
        
    }


}

