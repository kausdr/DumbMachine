//
//  ScreenManager.swift
//  WWDC24
//
//  Created by Kauane Santana on 17/02/24.
//

import SwiftUI

class ScreenManager: ObservableObject {
    @Published var tela: Screen = .dumbMachine
}

extension ScreenManager {
    enum Screen {
        case dumbMachine
        case introdution
        case algorithm
        case example
        case tutorial
        case tutorial2
    }
}
