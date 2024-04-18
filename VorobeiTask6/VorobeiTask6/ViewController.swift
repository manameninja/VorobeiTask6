//
//  ViewController.swift
//  VorobeiTask6
//
//  Created by Даниил Павленко on 18.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    lazy var squareView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.frame.size = CGSize(width: 100, height: 100)
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 10
        view.center = self.view.center
        return view
    }()
    
    lazy var animator = UIDynamicAnimator(referenceView: view)
    var snapBehavior: UISnapBehavior?
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(squareView)
    
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    //MARK: - Methods
    @objc func handleTap(sender: UITapGestureRecognizer){
        let newLocation = sender.location(in: view)
        if let snapBehavior = snapBehavior {
            animator.removeBehavior(snapBehavior)
        }
        let snap = UISnapBehavior(item: squareView, snapTo: newLocation)
        animator.addBehavior(snap)
        
        snapBehavior = snap
    }

}

