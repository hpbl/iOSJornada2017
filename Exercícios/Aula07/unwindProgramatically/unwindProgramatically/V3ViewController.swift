//
//  V3ViewController.swift
//  unwindProgramatically
//
//  Created by Hilton Pintor Bezerra Leite on 02/08/17.
//  Copyright © 2017 hpbl. All rights reserved.
//

import UIKit

class V3ViewController: UIViewController {

    @IBAction func popBtn(_ sender: Any) {
        /* se fosse modal:
        dismiss(animated: true, completion: nil)*/
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func voltarV1(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindSegueToV1", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
