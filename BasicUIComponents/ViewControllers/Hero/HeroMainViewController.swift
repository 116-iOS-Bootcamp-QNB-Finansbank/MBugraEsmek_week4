//
//  HeroMainViewController.swift
//  BasicUIComponents
//
//  Created by Melih Bugra Esmek on 25.09.2021.
//

import UIKit
import Hero
class HeroMainViewController: UIViewController {

   
//    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var getButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "ibtech.jpg")
        imageView.heroID = "viewid"
        getButton.heroID = "buttonid"
        
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
