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
    var betOneButton:UIButton!
    var betMaxButton:UIButton!
    var spinButton:UIButton!
    
    let kMarginForView:CGFloat = 0.0
    let kMarginForSlot:CGFloat = 1.0
    let kSixth:CGFloat = 1.0/6.0
    let kThird:CGFloat = 1.0/3.0
    let kHalf:CGFloat = 1.0/2.0
    let kEighth:CGFloat = 1.0/8.0
    
    let kNumberOfContainers = 3
    let kNumberOfSlots = 3
    
    var slots:[[Slot]] = []
    var credits = 50
    var currentBet = 0
    var winnings = 0
    
    var timer = NSTimer()
    var counter = 0
    let TIME_INCREMENT = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.blackColor()
        setupContainerViews()
        setupFirstContainer(firstContainer)
        setupSecondContainer(secondContainer)
        setupThirdContainer(thirdContainer)
        setupFourthContainer(fourthContainer)
        updateMainView ()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
        //        showAlertWithText(header: "No More Credits", message: "Reset Game")
    }
    
    func setupContainerViews() {
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
        slots = Factory.createSlots()
        for var containerNumber = 0; containerNumber < kNumberOfContainers; ++containerNumber {
            for var slotNumber = 0; slotNumber < kNumberOfSlots; ++slotNumber {
                var slotImageView = UIImageView()
                slotImageView.backgroundColor = UIColor.blackColor()
                slotImageView.frame = CGRect(
                    x: containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird),
                    y: containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird),
                    width: containerView.bounds.width * kThird - kMarginForSlot,
                    height: containerView.bounds.height * kThird - kMarginForSlot)
                slotImageView.image = slots[containerNumber][slotNumber].image
                slotImageView.contentMode = UIViewContentMode.ScaleAspectFit
                containerView.addSubview(slotImageView)
            }
        }
    }
    func setupThirdContainer(contanerView:UIView) {
        creditsLabel = UILabel()
        creditsLabel.text = "000000"
//        creditsLabel.textColor = UIColor.redColor()
        creditsLabel.font = UIFont.systemFontOfSize(16)
        creditsLabel.sizeToFit()
        creditsLabel.center = CGPoint(x: contanerView.frame.width * kSixth, y: contanerView.frame.height * kThird)
        creditsLabel.textAlignment = NSTextAlignment.Center
        contanerView.addSubview(creditsLabel)
        
        betLabel = UILabel()
        betLabel.text = "0000"
//        betLabel.textColor = UIColor.redColor()
        betLabel.font = UIFont.systemFontOfSize(16)
        betLabel.sizeToFit()
        betLabel.center = CGPoint(x: contanerView.frame.width * kSixth * 3, y: contanerView.frame.height * kThird)
        betLabel.textAlignment = NSTextAlignment.Center
        contanerView.addSubview(betLabel)
        
        winnerPaidLabel = UILabel()
        winnerPaidLabel.text = "000000"
//        winnerPaidLabel.textColor = UIColor.redColor()
        winnerPaidLabel.font = UIFont.systemFontOfSize(16)
        winnerPaidLabel.sizeToFit()
        winnerPaidLabel.center = CGPoint(x: contanerView.frame.width * kSixth * 5, y: contanerView.frame.height * kThird)
        winnerPaidLabel.textAlignment = NSTextAlignment.Center
        contanerView.addSubview(winnerPaidLabel)
        
        creditsTitleLabel = UILabel()
        creditsTitleLabel.text = "Credits"
//        creditsTitleLabel.textColor = UIColor.redColor()
        creditsTitleLabel.font = UIFont.systemFontOfSize(16)
        creditsTitleLabel.sizeToFit()
        creditsTitleLabel.center = CGPoint(x: contanerView.frame.width * kSixth, y: contanerView.frame.height * kThird * 2)
        creditsTitleLabel.textAlignment = NSTextAlignment.Center
        contanerView.addSubview(creditsTitleLabel)
        
        betTitleLabel = UILabel()
        betTitleLabel.text = "Bet"
//        betTitleLabel.textColor = UIColor.redColor()
        betTitleLabel.font = UIFont.systemFontOfSize(16)
        betTitleLabel.sizeToFit()
        betTitleLabel.center = CGPoint(x: contanerView.frame.width * kSixth * 3, y: contanerView.frame.height * kThird * 2)
        betTitleLabel.textAlignment = NSTextAlignment.Center
        contanerView.addSubview(betTitleLabel)
        
        winnerPaidTitleLabel = UILabel()
//        winnerPaidTitleLabel.textColor = UIColor.redColor()
        winnerPaidTitleLabel.text = "Winner Paid"
//        winnerPaidTitleLabel.textColor = UIColor.redColor()
        winnerPaidTitleLabel.font = UIFont.systemFontOfSize(16)
        winnerPaidTitleLabel.sizeToFit()
        winnerPaidTitleLabel.center = CGPoint(x: contanerView.frame.width * kSixth * 5, y: contanerView.frame.height * kThird * 2)
        winnerPaidTitleLabel.textAlignment = NSTextAlignment.Center
        contanerView.addSubview(winnerPaidTitleLabel)
    }
    func setupFourthContainer (containerView: UIView) {
        containerView.backgroundColor = UIColor.whiteColor()
        resetButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        resetButton.setTitle("Reset", forState: UIControlState.Normal)
        resetButton.sizeToFit()
        resetButton.center = CGPoint(x: containerView.frame.width * kEighth, y:containerView.frame.height * kHalf)
        resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(resetButton)
        
        betOneButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        betOneButton.setTitle("Bet One", forState: UIControlState.Normal)
        betOneButton.sizeToFit()
        betOneButton.center = CGPoint(x: containerView.frame.width * kEighth * 3, y:containerView.frame.height * kHalf)
        betOneButton.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(betOneButton)
        
        betMaxButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        betMaxButton.setTitle("Bet Max", forState: UIControlState.Normal)
        betMaxButton.sizeToFit()
        betMaxButton.center = CGPoint(x: containerView.frame.width * kEighth * 5, y:containerView.frame.height * kHalf)
        betMaxButton.addTarget(self, action: "betMaxButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(betMaxButton)
        
        spinButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        spinButton.setTitle("Spin", forState: UIControlState.Normal)
        spinButton.sizeToFit()
        spinButton.center = CGPoint(x: containerView.frame.width * kEighth * 7, y:containerView.frame.height * kHalf)
        spinButton.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(spinButton)
        
    }
    
    func resetButtonPressed(sender:UIButton) {
        hardReset()
    }
    func betOneButtonPressed(sender:UIButton) {
        println("betOneButtonPressed")
        if credits <= 0 {
            showAlertWithText(header: "No More Credits", message: "Reset Game")
        }
        else {
            if currentBet < 5 {
                currentBet += 1
                credits -= 1
                updateMainView()
            }
            else {
                currentBet = 1
                credits += 4
                updateMainView()
            }
        }
    }
    func betMaxButtonPressed(sender:UIButton) {
        println("betMaxButtonPressed")
        if credits <= 0 {
            showAlertWithText(header: "No More Credits", message: "Reset Game")
        }
        else {
            if credits + currentBet < 5 {
                credits = 0
                currentBet = credits + currentBet
                updateMainView()
            }
            else if currentBet < 5 {
                credits = credits + currentBet - 5
                currentBet = 5
                updateMainView()
            }
        }
        
    }
    func spinButtonPressed(sender:UIButton) {
        if currentBet == 0 {
            showAlertWithText(header: "Warning", message: "Please bet first!")
        }
        else {
            println("spinButtonPressed")
            timer = NSTimer.scheduledTimerWithTimeInterval(TIME_INCREMENT, target:self, selector: Selector("spin"), userInfo: nil, repeats: true)
        }
        
    }
    func removeSlotImageViews () {
        if secondContainer != nil {
            let container: UIView? = secondContainer
            let subViews:Array? = container!.subviews
            for view in subViews! {
                view.removeFromSuperview()
            }
        }
    }
    func hardReset() {
        removeSlotImageViews()
        slots.removeAll(keepCapacity: true)
        setupSecondContainer(secondContainer)
        credits = 50
        winnings = 0
        currentBet = 0
        updateMainView()
    }
    func updateMainView () {
        creditsLabel.text = "\(credits)"
        betLabel.text = "\(currentBet)"
        winnerPaidLabel.text = "\(winnings)"
    }
    func showAlertWithText (header: String = "Warning", message: String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    func spin () {
        removeSlotImageViews()
        slots = Factory.createSlots()
        setupSecondContainer(secondContainer)
        titleLabel.text = "Slots"
        firstContainer.backgroundColor = UIColor.redColor()
        self.counter++
        println(self.counter)
        if counter > 10 {
            timer.invalidate()
            counter = 0
            println("stop")
            var winningMultiplier = SlotBrain.computeWinnings(slots)
            winnings = winningMultiplier * currentBet
            credits += winnings - currentBet
            if winnings > 0 {
                firstContainer.backgroundColor = UIColor.greenColor()
                titleLabel.text = "WIN!!!"
                titleLabel.sizeToFit()
            }
            updateMainView()
        }
    }
}

