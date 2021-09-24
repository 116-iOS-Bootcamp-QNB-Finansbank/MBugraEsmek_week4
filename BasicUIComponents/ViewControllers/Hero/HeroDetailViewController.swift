//
//  HeroDetailViewController.swift
//  BasicUIComponents
//
//  Created by Melih Bugra Esmek on 25.09.2021.
//

import UIKit
import Hero
class HeroDetailViewController: UIViewController {

  
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.hero.isEnabled = true
        secondView.hero.id = "viewid"
        secondButton.hero.id = "buttonid"
        
        // Do any additional setup after loading the view.
    }
    

  
}
