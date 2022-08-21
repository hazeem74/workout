//
//  CardSelectionVC.swift
//  card prog
//
//  Created by Hazem Abdallah on 21/08/2022.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    
    let cardImageview    = UIImageView()
    let stopButton       = CWButton(backgroundColor: .systemRed, title: "Stop!")
    let ResetButton      = CWButton(backgroundColor: .systemGreen, title: "Reset")
    let RulesButton      = CWButton(backgroundColor: .systemBlue, title: "Rules")

    var cards = CardDeck.allValues
    var timer : Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
        }
    
    func configureUI(){
        configureCardImageView()
        configureStopButton()
        confiureResetButton()
        confiureRulesButton()
    }
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
   @objc  func stopTimer() {
       timer.invalidate()
   }
    @objc  func ResetTimer() {
stopTimer()
        startTimer()
    }
    
    @objc func showRandomCard(){
        cardImageview.image = cards.randomElement()
    }
    
    func configureCardImageView( ) {
        view.addSubview(cardImageview)
        cardImageview.translatesAutoresizingMaskIntoConstraints = false
        cardImageview.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageview.widthAnchor.constraint(equalToConstant: 250),
            cardImageview.heightAnchor.constraint(equalToConstant: 350),
            cardImageview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageview.centerYAnchor.constraint(equalTo: view.centerYAnchor , constant: -75)
        ])
    }
    func configureStopButton(){
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer),for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageview.bottomAnchor, constant: 30)
        ])
    }
    func confiureResetButton(){
        view.addSubview(ResetButton)
        ResetButton.addTarget(self, action: #selector(ResetTimer),for: .touchUpInside)

        NSLayoutConstraint.activate([
            ResetButton.widthAnchor.constraint(equalToConstant: 115),
            ResetButton.heightAnchor.constraint(equalToConstant: 50),
            ResetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            ResetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
            
        ])
    }
    
    func confiureRulesButton(){
        view.addSubview(RulesButton)
        RulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            RulesButton.widthAnchor.constraint(equalToConstant: 115),
            RulesButton.heightAnchor.constraint(equalToConstant: 50),
            RulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            RulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
            
        ])
    }
    
    @objc func presentRulesVC(){
        present(RulesVc(), animated: true)
    }
    
}




