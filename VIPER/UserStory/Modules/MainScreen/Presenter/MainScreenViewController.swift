//
//  MainScreenViewController.swift
//  VIPER
//
//  Created by Tatiana Sosina on 02.04.2022.
//

import UIKit

/// Главный экран
final class MainScreenViewController: UIViewController {
    
    // MARK: - Private property
    
    private let interactor: MainScreenInteractorInput
    private let viewAssembly: () -> UIView & MainScreenViewInput
    private lazy var moduleView: UIView & MainScreenViewInput = viewAssembly()
    
    /// Инициализатор
    /// - Parameters:
    ///   - interactor: интерактор
    ///   - viewAssembly: вью
    init(interactor: MainScreenInteractorInput,
         viewAssembly: @escaping () -> UIView & MainScreenViewInput) {
        self.interactor = interactor
        self.viewAssembly = viewAssembly
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        view = moduleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moduleView.output = self
        interactor.getContent()
        title = Appearance().title
    }
}

// MARK: - MainScreenInteractorOutput

extension MainScreenViewController: MainScreenInteractorOutput {
    func didReceive(text: String) {
        moduleView.setTitle(text: text)
    }
}

// MARK: - MainScreenViewOutput

extension MainScreenViewController: MainScreenViewOutput {
    func presentNewScreenButtonAction() {
        moduleView.changeBackgroundColor()
    }
}

// MARK: - Appearance

private extension MainScreenViewController {
    struct Appearance {
        let title = "VIPER Архитектура"
    }
}
