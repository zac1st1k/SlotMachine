//
//  ViewController.swift
//  SlotMachine
//
//  Created by Zac on 29/01/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    var titleLabel: UILabel!
    
    let kMarginForView:CGFloat = 10.0
    let kMarginForSlot:CGFloat = 2.0
    let kSixth:CGFloat = 1.0/6.0
    let kThird:CGFloat = 1.0/3.0
    
    let kNumberOfContainers = 3
    let kNumberOfSlots = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupContainerViews()
        setupFirstContainer(firstContainer)
        setupSecondContainer(secondContainer)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupContainerViews()
    {
        firstContainer = UIView(frame: CGRect(x: view.bounds.origin.x + kMarginForView, y: view.bounds.origin.y, width: view.bounds.width - (kMarginForView * 2), height: view.bounds.height * kSixth))
        firstContainer.backgroundColor = UIColor.redColor()
        view.addSubview(firstContainer)
        secondContainer = UIView(frame: CGRect(x: view.bounds.origin.x + kMarginForView, y: firstContainer.frame.height, width: view.bounds.width - (kMarginForView * 2), height: view.bounds.height * (3 * kSixth)))
        secondContainer.backgroundColor = UIColor.blackColor()
        view.addSubview(secondContainer)
        thirdContainer = UIView(frame: CGRect(x: view.bounds.origin.x + kMarginForView, y: firstContainer.frame.height + secondContainer.frame.height, width: view.bounds.width - (kMarginForView * 2), height: view.bounds.height * kSixth))
        thirdContainer.backgroundColor = UIColor.lightGrayColor()
        view.addSubview(thirdContainer)
        fourthContainer = UIView(frame: CGRect(x: view.bounds.origin.x + kMarginForView, y: firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height, width: view.bounds.width - (kMarginForView * 2), height: view.bounds.height * kSixth))
        fourthContainer.backgroundColor = UIColor.blackColor()
        view.addSubview(fourthContainer)
    }
    
    func setupFirstContainer(containerView: UIView) {
        titleLabel = UILabel()
        titleLabel.text = "Slots"
        titleLabel.textColor = UIColor.yellowColor()
        titleLabel.font = UIFont.boldSystemFontOfSize(40)
        titleLabel.sizeToFit()
        titleLabel.center = containerView.center
        containerView.addSubview(titleLabel)
    }
    func setupSecondContainer(containerView: UIView) {
        
        for var containerNumber = 0; containerNumber < kNumberOfContainers; ++containerNumber {
            
            for var slotNumber = 0; slotNumber < kNumberOfSlots; ++slotNumber {
                
                var slotImageView = UIImageView()
                slotImageView.backgroundColor = UIColor.yellowColor()
                slotImageView.frame = CGRect(x: containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird), y: containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird), width: containerView.bounds.width * kThird - kMarginForSlot, height: containerView.bounds.height * kThird - kMarginForSlot)
                containerView.addSubview(slotImageView)
            }
        }
    }
}

