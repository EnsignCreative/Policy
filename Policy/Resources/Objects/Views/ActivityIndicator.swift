//
//  ActivityIndicator.swift
//  Policy
//
//  Created by Bradley Ensign on 5/30/22.
//


import UIKit


class ActivityView: UIActivityIndicatorView {
    
    override init(style: UIActivityIndicatorView.Style) {
        super.init(style: style)
    }
    
    init(color spinColor: UIColor = .titleColor, style spinnerStyle: UIActivityIndicatorView.Style) {
        super.init(style: spinnerStyle)
        setRequirements(with: spinColor)
    }
    

    private func setRequirements(with spinColor: UIColor) {
        isHidden = true
        color = spinColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func showSpinner() {
        DispatchQueue.main.async { [weak self] in
            self?.startAnimating()
            self?.isHidden = false
        }
    }
    
    func hideSpinner() {
        DispatchQueue.main.async { [weak self] in
            self?.stopAnimating()
            self?.isHidden = true
        }
    }
    
    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}





protocol ActivityIndicatorDelegate {
    var blurView: BlurView! { get }
    var activityView: ActivityView! { get }
}

extension ActivityIndicatorDelegate where Self: UIViewController {
    func showActivityIndicator() {
        blurView.showBlur()
        activityView.showSpinner()
    }
    
    func hideActivityIndicator() {
        blurView.hideBlur()
        activityView.hideSpinner()
    }
}






class CollectionActivityViewCell: UICollectionViewCell {
    var indicator = UIActivityIndicatorView(style: .large)

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        contentView.addSubview(indicator)
        indicator.center = CGPoint(x: contentView.center.x, y: contentView.center.y)
        indicator.startAnimating()
    }
}

