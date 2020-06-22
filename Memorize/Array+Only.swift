//
//  Array+Only.swift
//  Memorize
//
//  Created by Desmarais, Jacque on 6/22/20.
//  Copyright © 2020 Desmarais, Jax. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
