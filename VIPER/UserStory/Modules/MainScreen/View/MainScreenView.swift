//
//  MainScreenView.swift
//  VIPER
//
//  Created by Tatiana Sosina on 02.04.2022.
//

import UIKit

/// Обработчик событий от view модуля SBPBeneficiaryBankScreenView
protocol MainScreenViewOutput: AnyObject {
    
    /// Кнопка была нажаты пользователем
    func presentNewScreenButtonAction()
}

/// View для экрана SBPBeneficiaryBankScreenView
protocol MainScreenViewInput: AnyObject {
    
    /// Обработчик событий от view экрана MainScreenView
    var output: MainScreenViewOutput? { get set }
    
    /// Показать новый экран
    func changeBackgroundColor()
}

/// View для экрана MainScreenView
final class MainScreenView: UIView, MainScreenViewInput {
    
    // MARK: - Public properties
    
    weak var output: MainScreenViewOutput?
    
    // MARK: - Private properties
    
    private let presentNewScreenButton = UIButton()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupConstraints()
        setDefaultsSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public func
    
    /// Изменяет цвет она при нажатии
    public func changeBackgroundColor() {
        backgroundColor = UIColor(red: CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 1)
    }
    
    // MARK: - Private func
    
    private func setupConstraints() {
        [presentNewScreenButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            presentNewScreenButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            presentNewScreenButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setDefaultsSettings() {
        presentNewScreenButton.setTitle("Перейти на новый экран", for: .normal)
        presentNewScreenButton.addTarget(self, action: #selector(presentNewScreenButtonAction), for: .touchUpInside)
    }
    
    @objc private func presentNewScreenButtonAction() {
        output?.presentNewScreenButtonAction()
    }
}
