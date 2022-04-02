//
//  MainScreenAssembly.swift
//  VIPER
//
//  Created by Tatiana Sosina on 02.04.2022.
//

import UIKit

/// Сборщик `Главного экрана`
public final class MainScreenAssembly {
    
    /// Собирает экран
    /// - Returns: собранный модуль
    public static func createModule() -> MainScreenModule {
        
        let interactor = MainScreenInteractor()
        let view = MainScreenView()
        let factory = MainScreenFactory()
        
        let presenter = MainScreenViewController(interactor: interactor,
                                                 viewAssembly: { view },
                                                 factory: factory)
        interactor.output = presenter
        return presenter
    }
}
