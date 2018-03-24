//
//  ViewController.swift
//  SliceViewAnimation
//
//  Created by Burak Ceylan on 24.03.18.
//  Copyright © 2018 Burak Ceylan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var containerView: UIView!
	
	var view1: UIView?
	var view2: UIView?

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func button(_ sender: Any) {
		let firstRect = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height / 2.0)
		let secondRect = CGRect(x: 0, y: view.frame.size.height/2.0, width: view.frame.size.width, height: view.frame.size.height/2.0)
		view1 = containerView.resizableSnapshotView(from: firstRect, afterScreenUpdates: true, withCapInsets: .zero)
		view2 = containerView.resizableSnapshotView(from: secondRect, afterScreenUpdates: true, withCapInsets: .zero)
		view2?.frame.origin.y = view.frame.height / 2.0
		containerView.isHidden = true
		view.addSubview(view1!)
		view.addSubview(view2!)
		UIView.animate(withDuration: 0.5) {
			self.view1?.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height / 2.0)
			self.view2?.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height / 2.0)
		}
	}
	
	@IBAction func close(_ sender: Any) {
		UIView.animate(withDuration: 0.5, animations: {
			self.view1?.transform = .identity
			self.view2?.transform = .identity
		}) { (success) in
			self.containerView.isHidden = false
			self.view1?.removeFromSuperview()
			self.view2?.removeFromSuperview()
		}
	}
	

}

