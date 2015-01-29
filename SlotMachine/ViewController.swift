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
    
    // Information Labels
    var creditsLabel:UILabel!
    var betLabel:UILabel!
    var winnerPaidLabel:UILabel!
    var creditsTitleLabel:UILabel!
    var betTitleLabel:UILabel!
    var winnerPaidTitleLabel:UILabel!
    
    var resetButton:UIButton!
    
    let kMarginForView:CGFloat = 10.0
    let kMarginForSlot:CGFloat = 2.0
    let kSixth:CGFloat = 1.0/6.0
    let kThird:CGFloat = 1.0/3.0
    let kHalf:CGFloat = 1.0/2.0
    let kEighth:CGFloat = 1.0/8.0
    
    let kNumberOfContainers = 3
    let kNumberOfSlots = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupContainerViews()
        setupFirstContainer(firstContainer)
        setupSecondContainer(secondContainer)
        setupThirdContainer(thirdContainer)
        setupFourthContainer(fourthContainer)
        
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
                slotImageView.frame = CGRect(
                    x: containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird),
                    y: containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird),
                    width: containerView.bounds.width * kThird - kMarginForSlot,
                    height: containerView.bounds.height * kThird - kMarginForSlot)
                containerView.addSubview(slotImageView)
            }
        }
    }
    
    func setupThirdContainer(contanerView:UIView) {
        creditsLabel = UILabel()
        creditsLabel.text = "000000"
        creditsLabel.textColor = UIColor.redColor()
        creditsLabel.font = UIFont.systemFontOfSize(16)
        creditsLabel.sizeToFit()
        creditsLabel.center = CGPoint(x: contanerView.frame.width * kSixth, y: contanerView.frame.height * kThird)
        creditsLabel.textAlignment = NSTextAlignment.Center
        contanerView.addSubview(creditsLabel)
        
        betLabel = UILabel()
        betLabel.text = "0000"
        betLabel.textColor = UIColor.redColor()
        betLabel.font = UIFont.systemFontOfSize(16)
        betLabel.sizeToFit()
        betLabel.center = CGPoint(x: contanerView.frame.width * kSixth * 3, y: contanerView.frame.height * kThird)
        betLabel.textAlignment = NSTextAlignment.Center
        contanerView.addSubview(betLabel)
        
        winnerPaidLabel = UILabel()
        winnerPaidLabel.text = "000000"
        winnerPaidLabel.textColor = UIColor.redColor()
        winnerPaidLabel.font = UIFont.systemFontOfSize(16)
        winnerPaidLabel.sizeToFit()
        winnerPaidLabel.center = CGPoint(x: contanerView.frame.width * kSixth * 5, y: contanerView.frame.height * kThird)
        winnerPaidLabel.textAlignment = NSTextAlignment.Center
        contanerView.addSubview(winnerPaidLabel)
        
        creditsTitleLabel = UILabel()
        creditsTitleLabel.text = "Credits"
        creditsTitleLabel.textColor = UIColor.redColor()
        creditsTitleLabel.font = UIFont.systemFontOfSize(16)
        creditsTitleLabel.sizeToFit()
        creditsTitleLabel.center = CGPoint(x: contanerView.frame.width * kSixth, y: contanerView.frame.height * kThird * 2)
        creditsTitleLabel.textAlignment = NSTextAlignment.Center
        contanerView.addSubview(creditsTitleLabel)
        
        betTitleLabel = UILabel()
        betTitleLabel.text = "Bet"
        betTitleLabel.textColor = UIColor.redColor()
        betTitleLabel.font = UIFont.systemFontOfSize(16)
        betTitleLabel.sizeToFit()
        betTitleLabel.center = CGPoint(x: contanerView.frame.width * kSixth * 3, y: contanerView.frame.height * kThird * 2)
        betTitleLabel.textAlignment = NSTextAlignment.Center
        contanerView.addSubview(betTitleLabel)
        
        winnerPaidTitleLabel = UILabel()
        winnerPaidTitleLabel.textColor = UIColor.redColor()
        winnerPaidTitleLabel.text = "Winner Paid"
        winnerPaidTitleLabel.textColor = UIColor.redColor()
        winnerPaidTitleLabel.font = UIFont.systemFontOfSize(16)
        winnerPaidTitleLabel.sizeToFit()
        winnerPaidTitleLabel.center = CGPoint(x: contanerView.frame.width * kSixth * 5, y: contanerView.frame.height * kThird * 2)
        winnerPaidTitleLabel.textAlignment = NSTextAlignment.Center
        contanerView.addSubview(winnerPaidTitleLabel)
    }
    
    func setupFourthContainer (containerView: UIView) {
        resetButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        resetButton.setTitle("Reset", forState: UIControlState.Normal)
        resetButton.sizeToFit()
        resetButton.center = CGPoint(x: containerView.frame.width * kEighth, y:containerView.frame.height * kHalf)
        resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.resetButton)
    }
    
    func resetButtonPressed(sender:UIButton) {
        creditsLabel.text = "000000"
        betLabel.text = "0000"
        winnerPaidLabel.text = "000000"
    }
}

