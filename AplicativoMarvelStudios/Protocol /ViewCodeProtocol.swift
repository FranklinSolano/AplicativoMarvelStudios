//
//  Viewcode.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//


protocol ViewCodeProtocol {
    func setupElements()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCodeProtocol {
    func setupView(){
        setupElements()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}


