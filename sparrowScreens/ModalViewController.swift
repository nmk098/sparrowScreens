//
//  ModalViewController.swift
//  sparrowScreens
//
//  Created by Никита Курюмов on 14.03.23.
//

import UIKit

class ModalViewController: UIViewController {
    
    var height: CGFloat = 150
    
    var items: [String] = ["150", "280"]
    
    lazy var segment: UISegmentedControl = UISegmentedControl(items: items)
    
    lazy var cancellButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "x.circle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(segment)
        view.addSubview(cancellButton)
        cancellButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        segment.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            segment.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segment.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            segment.widthAnchor.constraint(equalToConstant: 100),
            segment.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            cancellButton.topAnchor.constraint(equalTo: view.topAnchor, constant:20),
            cancellButton.widthAnchor.constraint(equalToConstant: 30),
            cancellButton.heightAnchor.constraint(equalToConstant: 30),
            cancellButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    @objc func segmentChanged(){
        updatePopoverHeight(selectedSegmentIndex: segment.selectedSegmentIndex, popoverController: self.popoverPresentationController)
    }
    
    @objc func buttonTap() {
        dismiss(animated: true)
    }
    
    func updatePopoverHeight(selectedSegmentIndex: Int, popoverController: UIPopoverPresentationController?) {
        guard let popover = popoverController else { return }
        let height: CGFloat = selectedSegmentIndex == 0 ? 150 : 280
        UIView.animate(withDuration: 0.3) {
            popover.presentedViewController.preferredContentSize = CGSize(width: 300, height: height)
        }
    }
    
}
