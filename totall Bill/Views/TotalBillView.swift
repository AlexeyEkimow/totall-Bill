//
//  TotalBillView.swift
//  totall Bill
//
//  Created by Alexey Ekimow on 29.08.2022.
//

import UIKit

class TotalBillView: UIView {
    
    let titleLabel: UILabel = {
        let Label = UILabel()
        Label.text = "Total Bill"
        Label.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        Label.font = UIFont(name: "Avenir Next", size: 14)
        Label.translatesAutoresizingMaskIntoConstraints = false
        return Label
    }()
    
    let summTextFieled: UITextView = {
        let textFieled = UITextView()
        textFieled.backgroundColor = #colorLiteral(red: 0.9719485641, green: 0.9719484448, blue: 0.9719484448, alpha: 1)
        textFieled.layer.cornerRadius = 10
        textFieled.textColor = .black
        textFieled.tintColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        textFieled.keyboardType = .numberPad
//        textFieled.font = UIFont(name: "Avenir Next Bold", size: 48)
        textFieled.textAlignment = .center
        textFieled.translatesAutoresizingMaskIntoConstraints = false
        return textFieled
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstrains()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.font = UIFont(name: "Avenir Next", size: frame.width / 26.6)
        summTextFieled.font = UIFont(name: "Avenir Next Bold", size: frame.height / 2.2)
        
    }
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(summTextFieled)
        
    }
    
    func setConstrains() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            summTextFieled.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            summTextFieled.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            summTextFieled.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            summTextFieled.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        
    }
    
    
    
    
}
