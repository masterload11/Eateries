//
//  RateViewController.swift
//  Eateries
//
//  Created by Владислав Варфоломеев on 18.04.2018.
//  Copyright © 2018 Владислав Варфоломеев. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {
    
    @IBOutlet weak var brilliantButton: UIButton!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var ratingStackView: UIStackView!
    
    @IBAction func rateRestaurant(_ sender: UIButton) {
        switch sender.tag {
        case 0: restRating = "sad.png"
        case 1: restRating = "pokerface.png"
        case 2: restRating = "brilliant.png"
        default: break
        }

        performSegue(withIdentifier: "unwindSegueToDVC", sender: sender)
    }
    
    var restRating: String?

    override func viewDidAppear(_ animated: Bool)
    {
        //Запуск анимации
        let buttonArray = [badButton, goodButton, brilliantButton]
        
        for (index, button) in buttonArray.enumerated() {
            let delay = Double(index) * 0.2
            UIView.animate(withDuration: 0.6, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                button?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //задаём начальные значения для анимаций
        badButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        goodButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        brilliantButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        //Блюрим view
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.insertSubview(blurEffectView, at: 1)
    }
}
