//
//  GlobalViewModel.swift
//  EvangVitalData
//
//  Created by 塗木冴 on 2020/02/07.
//  Copyright © 2020 塗木冴. All rights reserved.
//

import Foundation

class GlobalViewModel {
    
    var vitals: [Vital] = []

    init() {}
}

extension GlobalViewModel {
    
    func getSheetData() {
        print("API requestする")
    }
}
