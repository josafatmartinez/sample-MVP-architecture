//
//  UserPresenter.swift
//  sampleMVParchitecture
//
//  Created by Josafat Martínez  on 27/05/20.
//  Copyright © 2020 Josafat Martínez . All rights reserved.
//

import Foundation

class UserPresenter {
    weak var delegate: UserDelegate?
    
    init(delegate: UserDelegate) {
        self.delegate = delegate
    }
    
    func register(username: String, password: String) {
        self.delegate?.showProgress()
        if username.isEmpty {
            print("email can't be blank")
            self.delegate?.signinDidFailed(message: "email can't be blank")
        }
        let delay = DispatchTime.now() + Double(Int64(Double(NSEC_PER_SEC)*2)) / Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: delay) {
            self.delegate?.hideProgress()
            self.delegate?.signinDidSucceed()
        }
    }
}
