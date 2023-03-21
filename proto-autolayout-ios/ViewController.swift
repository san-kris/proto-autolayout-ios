//
//  ViewController.swift
//  proto-autolayout-ios
//
//  Created by Santosh Krishnamurthy on 3/20/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let redView = UIView()
        redView.backgroundColor = .red
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        
        [redView, blueView, greenView].forEach { view in
            self.view.addSubview(view)
        }
        
        
        // AutoLayout constraints must be added after adding subview
        // trying to place a view on top right corner
        redView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                       leading: nil,
                       bottom: nil,
                       trailing: view.safeAreaLayoutGuide.trailingAnchor,
                       padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 12),
                       size: CGSize(width: 100, height: 0))
        redView.widthAnchor.constraint(equalTo: redView.heightAnchor).isActive = true
        
        blueView.anchor(top: redView.bottomAnchor,
                        leading: nil,
                        bottom: nil,
                        trailing: redView.trailingAnchor,
                        padding: UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0),
                        size: CGSize(width: 0, height: 0))
        blueView.anchoorSize(to: redView)
        
        greenView.anchor(top: redView.topAnchor,
                         leading: view.safeAreaLayoutGuide.leadingAnchor,
                         bottom: blueView.bottomAnchor,
                         trailing: redView.leadingAnchor,
                        padding: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12),
                        size: CGSize(width: 200, height: 200))
        
        
    }


}

extension UIView {
    
    func fillSuperview() -> Void {
        anchor(top: superview?.topAnchor,
               leading: superview?.leadingAnchor,
               bottom: superview?.bottomAnchor,
               trailing: superview?.trailingAnchor)
    }
    
    func anchoorSize(to view: UIView) -> Void {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> Void {
        // this enables AutoLayout
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading{
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing{
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0{
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0{
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
