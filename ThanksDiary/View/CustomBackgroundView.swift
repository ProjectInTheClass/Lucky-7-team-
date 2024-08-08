//
//  UIViewRepresentable.swift
//  ThanksDiary
//
//  Created by my account on 8/7/24.
//

import SwiftUI
import UIKit

struct CustomBackgroundView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 428, height: 926)
        view.layer.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1).cgColor
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // No updates are required for this static view
    }
}
