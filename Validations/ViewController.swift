//
//  ViewController.swift
//  Validations
//
//  Created by Sierra 2 on 14/09/17.
//  Copyright © 2017 Sierra 2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let response = Validation.shared.validate(values: (ValidationType.email, "hello@gmail.com"), (ValidationType.stringWithFirstLetterCaps, "tyh56gf"))
        switch response {
        case .success:
            break
        case .failure(_, let message):
            print(message.localized())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

