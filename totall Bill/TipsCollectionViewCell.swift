//
//  TipsCollectionViewCell.swift
//  totall Bill
//
//  Created by Alexey Ekimow on 04.09.2022.
//

import UIKit

class TipsCollectionViewCell: UICollectionViewCell{
    
    let procentLabel: UILabel = {
        let Label = UILabel()
        Label.text = "10%"
        Label.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        Label.textAlignment = .center
//        Label.font = UIFont(name: "Avenir Next Bold", size: 24)
        Label.translatesAutoresizingMaskIntoConstraints = false
        return Label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected{
                layer.borderWidth = 3
                layer.borderColor = #colorLiteral(red: 0.2678741813, green: 0.759506464, blue: 0.9603367448, alpha: 1)
            } else{
                layer.borderWidth = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        layer.cornerRadius = 10
        
        addSubview(procentLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        procentLabel.font = UIFont(name: "Avenir Next Bold", size: frame.height / 3.4)
        
    }
    func setConstrains() {
        NSLayoutConstraint.activate([
            procentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            procentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            procentLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
