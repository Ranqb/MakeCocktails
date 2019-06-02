//
//  ViewController.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 22/03/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Internal Properties
    
    let spinner = UIActivityIndicatorView(style: .gray)
    let spinnerView = UIView()
    
    // MARK: Private Properties
    
    private var keyboardWillShowObserver: NSObjectProtocol?
    private var keyboardWillHideObserver: NSObjectProtocol?
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupSpinnerView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerKeyboardNotificationObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardNotificationObservers()
    }
    
    // MARK: Internal Helpers
    
    func keyboardWillShow(keyboardHeight: CGFloat) {}
    func keyboardWillHide(keyboardHeight: CGFloat) {}
    
    func displayLoading() {
        view.bringSubviewToFront(spinnerView)
        spinnerView.bringSubviewToFront(spinner)
        spinnerView.isHidden = false
        spinner.startAnimating()
    }
    
    func displayContent() {
        spinnerView.isHidden = true
        spinner.stopAnimating()
    }
    
    // MARK: Private Helpers
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func setupSpinnerView() {
        spinnerView.addSubview(spinner)
        view.addSubview(spinnerView)
        spinner.hidesWhenStopped = true
        spinnerView.backgroundColor = UIColor.clear
        spinnerView.isHidden = true
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        let spinnerViewConstraints = [
            spinnerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            spinnerView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            spinnerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinnerView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ]
        NSLayoutConstraint.activate(spinnerViewConstraints)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        let spinnerConstraints = [
            spinner.centerXAnchor.constraint(equalTo: spinnerView.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: spinnerView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(spinnerConstraints)
    }
    
    private func registerKeyboardNotificationObservers() {
        let center = NotificationCenter.default
        keyboardWillShowObserver = center.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: .main
        ) { [weak self] notification in
            self?.keyboardWillShow(keyboardHeight: notification.keyboardHeight)
        }
        keyboardWillHideObserver = center.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: .main
        ) { [weak self] notification in
            self?.keyboardWillHide(keyboardHeight: notification.keyboardHeight)
        }
    }
    
    private func removeKeyboardNotificationObservers() {
        let center = NotificationCenter.default
        if let keyboardWillShowObserver = keyboardWillShowObserver {
            center.removeObserver(keyboardWillShowObserver)
            self.keyboardWillShowObserver = nil
        }
        if let keyboardWillHideObserver = keyboardWillHideObserver {
            center.removeObserver(keyboardWillHideObserver)
            self.keyboardWillHideObserver = nil
        }
    }
}
