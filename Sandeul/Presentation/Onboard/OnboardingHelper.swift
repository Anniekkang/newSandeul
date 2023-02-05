//
//  Extension.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/05.
//

import UIKit
import UIOnboarding


struct UIOnboardingHelper {
    // App Icon
    static func setUpIcon() -> UIImage {
        return Bundle.main.appIcon ?? .init(named: "logo")!
    }

    // First Title Line
    // Welcome Text
    static func setUpFirstTitleLine() -> NSMutableAttributedString {
        .init(string: "Welcome to", attributes: [.foregroundColor: Color.shared.Gray])
    }
    
    // Second Title Line
    // App Name
    static func setUpSecondTitleLine() -> NSMutableAttributedString {
        .init(string: Bundle.main.displayName ?? "Sandeul", attributes: [
            .foregroundColor: Color.shared.Green
        ])
    }

    // Core Features
    static func setUpFeatures() -> Array<UIOnboardingFeature> {
        return .init([

            .init(icon: .init(named: "logo2")!,
                  iconTint: Color.shared.Gray,
                  title: "Mountains near me",
                  description: "현 위치 기준 같은 '시'에 있는 산을 확인 할 수 있어요"),
            .init(icon: .init(named: "logo2")!,
                  title: "Search Mountains",
                  description: "국내 산의 고도,지역을 확인 할 수 있어요"),
            .init(icon: .init(named: "logo2")!,
                  title: "Record your schedule",
                  description: "다이어리 기능이 있어 산에 대한 일정을 기록하고 관리해요")
        ])
    }

    // Notice Text
    static func setUpNotice() -> UIOnboardingTextViewConfiguration {
        return .init(icon: nil,
                     text: "Developed and designed for NariKang",
                     linkTitle: "Learn more...",
                     link: "https://velog.io/@knr9144",
                     tint: Color.shared.Green)
    }

    // Continuation Title
    static func setUpButton() -> UIOnboardingButtonConfiguration {
        return .init(title: "Start",
                     titleColor: Color.shared.Gray, // Optional, `.white` by default
                     backgroundColor: Color.shared.Green)
    }
}


