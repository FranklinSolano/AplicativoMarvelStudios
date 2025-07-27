//
//  protocol.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 26/07/25.
//

import UIKit

protocol LogindependencyProtocol {
    var emailLabel: Labeling { get }
    var emailTextField: TextFielding { get }
    var passwordLabel: Labeling { get }
    var passwordTextField: TextFielding { get }
    var forgotPasswordButton: Buttoning { get }
    var loginButton: Buttoning { get }
    var registerButton: Buttoning { get }
}

final class LoginDependencyContainer: LogindependencyProtocol {
    lazy var emailLabel: Labeling = DSLabelAdapter()
    lazy var emailTextField: TextFielding = DSTextFieldAdapter()
    lazy var passwordLabel: Labeling = DSLabelAdapter()
    lazy var passwordTextField: TextFielding = DSTextFieldAdapter()
    lazy var forgotPasswordButton: Buttoning = DSButtonTitlesAdapter()
    lazy var loginButton: Buttoning = DSButtonAdapter()
    lazy var registerButton: Buttoning = DSButtonTitlesAdapter()
}
