//
//  ViewController.swift
//  Touch ID Demo
//
//  Created by Rob Percival on 06/10/2015.
//  Copyright © 2015 Appfish. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let authenticationContext = LAContext();
        var error: NSError?

        if authenticationContext.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error: &error){

            authenticationContext.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "We need to know who you are...", reply: { (success, error) -> Void in

                if success {
                    // user has authenticated
                }else{
                    if let error = error {
                        // there was an error
                        print(error)
                    }else{
                        // user did not authenticate
                    }
                }
            })
        }else{
            // no touch id available
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

