//
//  TextField.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 23.05.2025.
//

import SwiftUI

struct CTextField: View {
    //MARK: - Properties
    @Binding var text: String
    var placeholder: String = "placeholder"
    
    var cornerRadius: CGFloat = 8
    var borderColor: Color = .gray.opacity(0.5)
    var borderWidth: CGFloat = 1
    
    //MARK: - View
    var body: some View {
        TextField(placeholder, text: $text)
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .padding(.horizontal)

    }
    
    //MARK: - Functions
    
}

