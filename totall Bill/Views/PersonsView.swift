//
//  Persons.swift
//  totall Bill
//
//  Created by Alexey Ekimow on 29.08.2022.
//

import UIKit

class PersonsView: UIView {
    
    let titleLabel: UILabel = {
        let Label = UILabel()
        Label.text = "Persons"
        Label.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        Label.font = UIFont(name: "Avenir Next", size: 14)
        Label.translatesAutoresizingMaskIntoConstraints = false
        return Label
    }()
    
    let backgroundGrayView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9719485641, green: 0.9719484448, blue: 0.9719484448, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
   lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
//        button.setTitle("-", for: .normal)
        button.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
       button.isEnabled = false
//       button.titleLabel?.font = UIFont(name: "Avenir Next", size: 60)
       button.setImage(UIImage(systemName: "minus"), for: .normal)
       button.addTarget(self, action: #selector(minusButtonTapped), for:.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var plusButton: UIButton = {
         let button = UIButton(type: .system)
//         button.setTitle("+", for: .normal)
         button.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
//        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 40)
        button.addTarget(self, action: #selector(plusButtonTapped), for:.touchUpInside)
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
    
    let counterLabel: UILabel = {
        let Label = UILabel()
        Label.text = "2"
        Label.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        Label.textAlignment = .center
        Label.font = UIFont(name: "Avenir Next", size: 48)
        Label.translatesAutoresizingMaskIntoConstraints = false
        return Label
    }()
    
    var counter = 2
    
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
        titleLabel.font = UIFont(name: "Avenir Next", size: frame.width / 26.7)
        counterLabel.font = UIFont(name: "Avenir Next", size: frame.height / 2.6)
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(backgroundGrayView)
        backgroundGrayView.addSubview(minusButton)
        backgroundGrayView.addSubview(plusButton)
        backgroundGrayView.addSubview(counterLabel)
    }
    
    @objc func minusButtonTapped(){
        counter -= 1
        counterLabel.text = "\(counter)"
        
        if counter <= 2 {
            minusButton.isEnabled = false
        }
        
    }
    @objc func plusButtonTapped(){
        counter += 1
        counterLabel.text = "\(counter)"
        minusButton.isEnabled = true
        
    }
    func setConstrains() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            backgroundGrayView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            backgroundGrayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundGrayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundGrayView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            minusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor, constant: 0),
            minusButton.leadingAnchor.constraint(equalTo: backgroundGrayView.leadingAnchor, constant: 0),
            minusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 80),
            
            plusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor, constant: 0),
            plusButton.trailingAnchor.constraint(equalTo: backgroundGrayView.trailingAnchor, constant: 0),
            plusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 80),
            
            counterLabel.centerYAnchor.constraint(equalTo: backgroundGrayView.centerYAnchor),
            counterLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 10),
            counterLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -10)
        ])
        
    }
    
    
    
    
}
