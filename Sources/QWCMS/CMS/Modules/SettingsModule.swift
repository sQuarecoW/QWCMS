////
////  SettingsModule.swift
////  App
////
////  Created by Jan-Willem Oskam on 01/07/2018.
////
//
//import Foundation
//import Vapor
//import Fluent
//
//public protocol CMSSettingsModule {
//    
//    /// Groep prefix voor de settings
//    ///
//    ///
//    var settingsPrefix: String { get }
//    
//    /// Gedefinieerde instellingen
//    ///
//    /// Lijst met instellingen voor deze module
//    /// - note: Hier kunnen ook standaardwaardes worden gedefinieerd
//    var defaultSettings: [DefaultSetting] { get }
//}
//
//extension CMSModule where Self: CMSSettingsModule {
//    
//    /// Haal de settings voor deze module
//    ///
//    /// Als er geen settings zijn gedefinieerd voor de module dan zijn we klaar
//    func getSettings(on req: Request) throws -> EventLoopFuture<[String: String]> {
//        guard defaultSettings.count > 0 else {
//            throw SettingsError.NoSettingsDefinedForModule(module: self.settingsPrefix)
//        }
//        
//        return Setting.query(on: req).filter(\.module == self.settingsPrefix).all().flatMap(to: [String: String].self) { savedSettings in
//            var settings = [String: String]()
//            
//            // loop alle gedefinieerde settings langs en kijk of er een waarde voor is opgeslagen
//            for defaultSetting in self.defaultSettings {
//                let key = defaultSetting.key
//                
//                // is er een waarde?
//                if let setting = savedSettings.first(where: { $0.key == defaultSetting.key }) {
//                    settings[key] = setting.value
//                }
//                // anders maken we een nieuwe setting, die meteen wordt opgeslagen in de db
//                else {
//                    _ = Setting(module: self.settingsPrefix, key: key, value: defaultSetting.value).create(on: req).map(to: Setting.self) { setting in
//                        settings[key] = setting.value
//                        return setting
//                    }
//                }
//            }
//            
//            // 
//            return EventLoopFuture.map(on: req) {
//                return settings
//            }
//        }
//    }
//    
////    func saveSettings(on req: Request, postData: SettingsPostData) throws -> EventLoopFuture<[Setting]> {
////        var settings = [EventLoopFuture<Setting>]()
////
////        // settings langs
////        for setting in postData.settings {
////            print(setting)
////            settings.append(Setting(module: self.settingsPrefix, key: setting.key, value: setting.value).save(on: req))
////        }
////
////        // opslaan en klaar
////        return settings.map(to: [Setting].self, on: req) { settings in
////            return settings
////        }
////    }
//}
//
///// Lege settings
//public struct DefaultSetting {
//    var key: String
//    var value: String
//}
//
//extension DefaultSetting {
//    /// Init zonder default value
//    init(key: String) {
//        self.init(key: key, value: "")
//    }
//}
//
///// Fouten voor de settings
//public enum SettingsError: Error {
//    case NoSettingsDefinedForModule(module: String)
//}
//
///// GePOSTte settings
//public struct SettingsPostData: Content {
//    var settings: [String: String]
//}
