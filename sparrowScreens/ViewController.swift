//
//  ViewController.swift
//  sparrowScreens
//
//  Created by Никита Курюмов on 14.03.23.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    var height: CGFloat = 0
    
    lazy var popButton: UIButton = {
        var button = UIButton()
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Present"
        configuration.baseBackgroundColor = .systemBlue
        button.configuration = configuration
        button.addTarget(self, action: #selector(popTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(popButton)
        
        NSLayoutConstraint.activate([
            popButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            popButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popButton.widthAnchor.constraint(equalToConstant: 100),
            popButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    @objc func popTap() {
        let popoverVC = ModalViewController()
        popoverVC.modalPresentationStyle = .popover
        popoverVC.preferredContentSize = CGSize(width: 300, height: 150)
        guard let presentationController = popoverVC.popoverPresentationController else { return }
        presentationController.delegate = self
        presentationController.sourceView = popButton
        presentationController.permittedArrowDirections = .up
        presentationController.sourceRect = CGRect(x: Int(popButton.bounds.midX),
                                                   y: Int(popButton.bounds.maxY + 5),
                                                   width: 0, height: 0)
        present(popoverVC, animated: true)
    }
}

extension ViewController: UIPopoverControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
           return .none
       }
    
    func getHeight(sender: UISegmentedControl) -> Double {
        var height: Double = 0
        if sender.selectedSegmentIndex == 0 {
                      height = 150
                    } else {
                       height = 280
                    }
        return height
    }

}
