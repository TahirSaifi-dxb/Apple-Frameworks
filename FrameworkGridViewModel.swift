//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Tahir Saifi on 09/09/2024.
//

import SwiftUI


final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework?
    {
        didSet{
            isShowingDetailview = true
        }
    }
    
    @Published var isShowingDetailview: Bool = false
    
    
    
}
