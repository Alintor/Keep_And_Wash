//
//  AlertRoutable.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

import LightRoute

struct Action {
    
    let title: String
    let handler: (() -> Void)?
}

struct AlertTextFieldConfiguration {
    
    let tag: Int
    let placeholder: String?
    let value: String?
}

struct AlertTextFieldAction {
    
    let title: String
    let handler: ((_ textValues: [Int: String]) -> Void)?
}

protocol PopupRoutable: Router {
    
}

extension TransitionHandler where Self: UIViewController {
    
    func showAlert(
        withMessage message: String,
        title: String? = nil,
        cancelTitle: String,
        actions: [Action] = [],
        closeHandler: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // TODO:
        //alert.view.tintColor = R.clr.zaymer.nastyGreen()
        for action in actions {
            alert.addAction(UIAlertAction(title: action.title, style: .default) { _ in
                action.handler?()
            })
        }
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel))
        present(alert, animated: true, completion: closeHandler)
    }
    
    func showTextFieldAlert(
        withMessage message: String,
        title: String? = nil,
        cancelTitle: String,
        textFieldConfigs: [AlertTextFieldConfiguration],
        actions: [AlertTextFieldAction],
        closeHandler: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // TODO:
        //alert.view.tintColor = R.clr.zaymer.nastyGreen()
        for textFieldConfig in textFieldConfigs {
            alert.addTextField { textField in
                textField.placeholder = textFieldConfig.placeholder
                textField.text = textFieldConfig.value
                textField.tag = textFieldConfig.tag
            }
        }
        for action in actions {
            alert.addAction(UIAlertAction(
                title: action.title,
                style: .default
            ) { [weak alert] _ in
                guard let textFields = alert?.textFields else { return }
                var textValues = [Int: String]()
                textFields.forEach({ textValues[$0.tag] = $0.text })
                action.handler?(textValues)
            })
        }
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel))
        present(alert, animated: true, completion: closeHandler)
    }
}

extension PopupRoutable {
    
    func showAlert(
        withMessage message: String,
        title: String? = nil,
        cancelTitle: String = R.string.localizable.commonCancel(),
        actions: [Action] = [],
        closeHandler: (() -> Void)? = nil) {
        guard let transitionHandler = transitionHandler as? UIViewController else { return }
        transitionHandler.showAlert(
            withMessage: message,
            title: title,
            cancelTitle: cancelTitle,
            actions: actions,
            closeHandler: closeHandler)
    }
    
    func showTextFieldAlert(
        withMessage message: String,
        title: String? = nil,
        cancelTitle: String = R.string.localizable.commonCancel(),
        textFieldConfigs: [AlertTextFieldConfiguration],
        actions: [AlertTextFieldAction],
        closeHandler: (() -> Void)? = nil) {
        guard let transitionHandler = transitionHandler as? UIViewController else { return }
        transitionHandler.showTextFieldAlert(
            withMessage: message,
            title: title,
            cancelTitle: cancelTitle,
            textFieldConfigs: textFieldConfigs,
            actions: actions,
            closeHandler: closeHandler
        )
    }
}
