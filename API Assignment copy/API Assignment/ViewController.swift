//
//  ViewController.swift
//  API Assignment
//
//  Created by promact on 06/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var url1: UIButton!
    @IBOutlet weak var url2: UIButton!
    @IBOutlet weak var url3: UIButton!
    @IBOutlet weak var url4: UIButton!
    @IBOutlet weak var url5: UIButton!
    @IBOutlet weak var url6: UIButton!
    @IBOutlet weak var url7: UIButton!
    @IBOutlet weak var url8: UIButton!
    @IBOutlet weak var url9: UIButton!
    @IBOutlet weak var url10: UIButton!
    @IBOutlet weak var url11: UIButton!
    @IBOutlet weak var url12: UIButton!
    @IBOutlet weak var url13: UIButton!
    @IBOutlet weak var url14: UIButton!
    @IBOutlet weak var url15: UIButton!
    
    let url = URL(string: "https://onesignal.com/api/v1/notifications")!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func UrlAction1(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewControllerforData") as! ViewControllerforData
    
                
        vc.tag = sender.tag
        
        navigationController?.pushViewController(vc, animated: true)
    }
    

}

