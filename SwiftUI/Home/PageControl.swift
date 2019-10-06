//
//  PageControl.swift
//  SwiftUIFirst
//
//  Created by M_Sugawara on 2019/10/06.
//  Copyright © 2019 Sugawar. All rights reserved.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int

    func makeCoordinator() -> PageControl.Coordinator {
        return Coordinator(self)
    }

    func makeUIView(context: UIViewRepresentableContext<PageControl>) -> PageControl.UIViewType {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(context.coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)

        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: UIViewRepresentableContext<PageControl>) {
        uiView.currentPage = currentPage
    }

    class Coordinator: NSObject {
        var control: PageControl

        init(_ control: PageControl) {
            self.control = control
        }

        @objc func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
