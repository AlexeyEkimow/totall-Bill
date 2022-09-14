//
//  ViewController.swift
//  totall Bill
//
//  Created by Alexey Ekimow on 25.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let Label = UILabel()
        Label.text = "Total Bill"
        Label.textColor = .blue
//        Label.font = UIFont(name: "Avenir Next Bold", size: 40)
        Label.translatesAutoresizingMaskIntoConstraints = false
        return Label
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        let screenSize: CGRect = UIScreen.main.bounds
        imageView.frame = CGRect(x: 0, y: 0, width: 80, height: screenSize.height * 0.2)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let discriptionLabel: UILabel = {
        let Label = UILabel()
        Label.text = "Enter the invoice amount and click \"Calculate\""
        Label.textColor = .black
        Label.font = UIFont(name: "Avenir Next Bold", size: 15)
        Label.adjustsFontSizeToFitWidth = true
        Label.minimumScaleFactor = 0.7
//        Label.numberOfLines = 2
        Label.textAlignment = .center
        Label.translatesAutoresizingMaskIntoConstraints = false
        return Label
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.2678741813, green: 0.759506464, blue: 0.9603367448, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let totalBillView = TotalBillView()
    let personsView = PersonsView()
    let tipsView = TipsView()
    
    
    override func viewDidLoad() { // Метод, с которого начинается загрузка
        super.viewDidLoad()
        
        setupViews()
        setConstrains()
        addTap()
        
        
    }
    
    func setupViews(){ // настройка всех объектов
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        view.addSubview(titleLabel)
        titleLabel.font = UIFont(name: "Avenir Next Bold", size: view.frame.height * 0.046)
        view.addSubview(logoImageView)
        view.addSubview(discriptionLabel)
        view.addSubview(totalBillView)
        view.addSubview(personsView)
        view.addSubview(calculateButton)
        view.addSubview(tipsView)
        
    }
    
    @objc func calculateButtonTapped() {
        guard let totalBill = totalBillView.summTextFieled.text,
        let totalBillInt = Int(totalBill )else { return }
        
        let summ = totalBillInt + totalBillInt * tipsView.tipsCount / 100
        let persons = personsView.counter
        if persons == 0 {
            discriptionLabel.text = "Enter persons count"
            discriptionLabel.textColor = .red
        } else {
            let resault = summ / persons
            discriptionLabel.text = "\(resault) per person"
            discriptionLabel.textColor = .black
        }
    }
    func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

extension MainViewController {
   
    func setConstrains(){ // Расположение объектов
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23),
            logoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23),
            
            discriptionLabel.topAnchor.constraint(equalTo:logoImageView.bottomAnchor, constant: 15),
            discriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            discriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            totalBillView.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: 10),
            totalBillView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            totalBillView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            totalBillView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),
            
            personsView.topAnchor.constraint(equalTo: totalBillView.bottomAnchor, constant: 10),
            personsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),
            
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalToConstant: 60),
            
            tipsView.topAnchor.constraint(equalTo: personsView.bottomAnchor, constant: 10),
            tipsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tipsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tipsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),
        ])
    }
}

