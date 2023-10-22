//
//  LoadingIndicator.swift
//  SwiftUI Clean Code Example
//
//  Created by Michael on 22.10.23.
//

import SwiftUI

struct LoadingIndicator: UIViewRepresentable {
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<LoadingIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<LoadingIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
