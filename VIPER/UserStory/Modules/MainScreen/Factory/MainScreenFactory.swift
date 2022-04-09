//
//  MainScreenFactory.swift
//  VIPER
//
//  Created by Tatiana Sosina on 02.04.2022.
//

import UIKit

/// события которые отправляем из Factory в Presenter
protocol MainScreenFactoryOutput: AnyObject {
    
    /// Был получен готовый текст
    /// - Parameters:
    /// - text: готовый, сформированный `текст`
    func didReciveFull(text: String)
}

/// события которые отправляем от Presenter к Factory
protocol MainScreenFactoryInput {
    
    /// OUTPUT прокидывает события в PRESENTER
    var output: MainScreenFactoryOutput? { get set }
    
    /// Создает секции для отображения
    /// - Parameters:
    ///   - text: `вторая часть готового текста`
    ///   - output: output `MainScreenFactoryOutput`
    /// - Returns: секции
    func createTitle(text: String)
}

/// Фабрика элментов `Главного Экрана`
final class MainScreenFactory: MainScreenFactoryInput {
    
    weak var output: MainScreenFactoryOutput?
    
    func createTitle(text: String) {
        let fullText = "\(Appearance().title), \(text)"
        output?.didReciveFull(text: fullText)
    }
}

// MARK: - Appearance

private extension MainScreenFactory {
    struct Appearance {
        let title = "Hello"
    }
}
