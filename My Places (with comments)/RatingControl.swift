//
//  RatingControl.swift
//  My Places (with comments)
//
//  Created by Артём Тюрморезов on 06.10.2022.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {

    private var ratingButtons = [UIButton]()
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44, height: 44) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starsCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    var rating = 0
//MARK: - initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    @objc func ratingButtonTapped(button: UIButton) {
        print("Nashal")
    }
    
    private func setupButtons() {
        
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButtons.removeAll()
        
        for _ in 0..<starsCount {
            let button = UIButton()
            button.backgroundColor = .red
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            
            addArrangedSubview(button)
            ratingButtons.append(button)
        }
    }
    
}
