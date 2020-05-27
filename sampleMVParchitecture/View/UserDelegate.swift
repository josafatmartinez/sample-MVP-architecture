//
//  UserDelegate.swift
//  sampleMVParchitecture
//
//  Created by Josafat Martínez  on 27/05/20.
//  Copyright © 2020 Josafat Martínez . All rights reserved.
//

import Foundation

protocol UserDelegate: NSObjectProtocol {
    func showProgress()
    func hideProgress()
    func signinDidSucceed()
    func signinDidFailed(message: String)
}
