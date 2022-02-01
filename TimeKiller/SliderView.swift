//
//  SliderView.swift
//  TimeKiller
//
//  Created by Никита Рыжкин on 01.02.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
    @Binding var value: Double
    let alpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didSlide(_:)),
            for: .allEvents)
            
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = UIColor(
            displayP3Red: 1,
            green: 0,
            blue: 0,
            alpha: CGFloat(alpha / 100))
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }

}
            
            extension SliderView {
                class Coordinator: NSObject {
                    @Binding var value: Double
                    
                    init(value: Binding<Double>) {
                        self._value = value
                    }
                    
                    @objc func didSlide(_ sender: UISlider) {
                        value = Double(sender.value)
                    }
                }
            }

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(50), alpha: 100)
    }
}
