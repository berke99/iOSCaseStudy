//
//  CButton.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 23.05.2025.
//

import SwiftUI

struct CButton: View {
    var title: String
    var action: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            isPressed = true
            action()
            // Kısa süre sonra rengini geri döndür
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                isPressed = false
            }
        }) {
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.vertical, 14)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(isPressed ? Color.blue.opacity(0.6) : Color.blue)
                        .shadow(color: Color.blue.opacity(0.4), radius: 8, x: 0, y: 4)
                )
                .padding(.horizontal)
        }
    }
}
