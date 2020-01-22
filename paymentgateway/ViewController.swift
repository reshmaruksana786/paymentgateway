//
//  ViewController.swift
//  paymentgateway
//
//  Created by Syed.Reshma Ruksana on 22/01/20.
//  Copyright © 2020 Syed.Reshma Ruksana. All rights reserved.
//

import UIKit
import Razorpay

class ViewController: UIViewController,RazorpayPaymentCompletionProtocol {
    
   var razorpay:Razorpay!
    
    func onPaymentError(_ code: Int32, description str: String) {
        print("error")
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        print("success")
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        razorpay=Razorpay.initWithKey("rzp_live_MWuBuwjcEgv1L4", andDelegate: self)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

     
    @IBAction func onButtonClick(_ sender: UIButton) {
        
        showPaymentForm()
    }
        func showPaymentForm(){
            let options: [String:Any] = [
                        "amount": "100", //This is in currency subunits. 100 = 100 paise= INR 1.
                        "currency": "INR",//We support more that 92 international currencies.
                        "description": "purchase description",
                        "order_id": "order_E7Tpj5ZGnM6OI7",
                        "image": "https://url-to-image.png",
                        "name": "business or product name",
                        "prefill": [
                            "contact": "9797979797",
                            "email": "foo@bar.com"
                        ],
                        "theme": [
                            "color": "#F37254"
                        ]
                    ]
            razorpay.open(options)
        }
        
    
    
}

