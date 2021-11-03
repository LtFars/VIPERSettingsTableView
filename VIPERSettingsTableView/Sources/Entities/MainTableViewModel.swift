//
//  MainTableViewModel.swift
//  VIPERSettingsTableView
//
//  Created by Denis Snezhko on 03.11.2021.
//
import UIKit

struct Section {
    let title: String
    var option: [SettingsCellOption]
}

struct SettingsCellOption {
    let title: String
    let additionLabel: String?
    let icon: String
    let iconBackgroundColor: UIColor
    var isSwitchButton: Bool
}

final class SettingsModel {
    
    func createOptions() -> [Section] {
        
        let wifiNames = ["pipax", "Guest-WiFi", "SosediPNH", "home-wifi", "MTS-accessPoint", "Не подключено"]
        
        return [
            
            //  First section
            Section(title: "", option: [
                SettingsCellOption(title: "Авиарежим", additionLabel: nil, icon: "airplane", iconBackgroundColor: .systemOrange, isSwitchButton: true),
                SettingsCellOption(title: "Wi-Fi", additionLabel: wifiNames[Int.random(in: 0..<wifiNames.count)], icon: "wifi", iconBackgroundColor: .systemBlue, isSwitchButton: false),
                SettingsCellOption(title: "Bluetooth", additionLabel: "Вкл.", icon: "iphone.homebutton.radiowaves.left.and.right", iconBackgroundColor: .systemBlue, isSwitchButton: false),
                SettingsCellOption(title: "Сотовая связь", additionLabel: nil, icon: "antenna.radiowaves.left.and.right", iconBackgroundColor: .systemGreen, isSwitchButton: false),
                SettingsCellOption(title: "Режим модема", additionLabel: nil, icon: "personalhotspot", iconBackgroundColor: .systemGreen, isSwitchButton: false),
                SettingsCellOption(title: "VPN", additionLabel: nil, icon: "personalhotspot", iconBackgroundColor: .systemBlue, isSwitchButton: true)
            ]),
            
            //  Second section
            Section(title: "", option: [
                SettingsCellOption(title: "Уведомления", additionLabel: nil, icon: "app.badge", iconBackgroundColor: .systemRed, isSwitchButton: false),
                SettingsCellOption(title: "Звуки, тактильные сигналы", additionLabel: nil, icon: "volume.3.fill", iconBackgroundColor: .systemPink, isSwitchButton: false),
                SettingsCellOption(title: "Не беспокоить", additionLabel: nil, icon: "moon.fill", iconBackgroundColor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), isSwitchButton: false),
                SettingsCellOption(title: "Экранное время", additionLabel: nil, icon: "hourglass", iconBackgroundColor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), isSwitchButton: false)
            ]),
            
            //  Third section
            Section(title: "", option: [
                SettingsCellOption(title: "Основные", additionLabel: nil, icon: "gear", iconBackgroundColor: .systemGray, isSwitchButton: false),
                SettingsCellOption(title: "Пункт управления", additionLabel: nil, icon: "house", iconBackgroundColor: .systemGray, isSwitchButton: false),
                SettingsCellOption(title: "Экран и яркость", additionLabel: nil, icon: "textformat.size", iconBackgroundColor: .systemBlue, isSwitchButton: false),
                SettingsCellOption(title: "Экран \"Домой\"", additionLabel: nil, icon: "moon.fill", iconBackgroundColor: .purple, isSwitchButton: false),
                SettingsCellOption(title: "Универсальный доступ", additionLabel: nil, icon: "hourglass", iconBackgroundColor: .systemBlue, isSwitchButton: false)
            ])
        ]
    }
}
