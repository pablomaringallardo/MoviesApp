//
//  Extensions.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 23/11/23.
//

import Foundation
import SwiftUI

extension URLCache {
    static let imageCache = URLCache(memoryCapacity: 512_000_000, diskCapacity: 10_000_000_000)
}

extension Font {
    
    enum CustomFont: String {
        case montserrat = "Montserrat"
        case poppinsSemiBold = "Poppins-SemiBold"
        case poppinsRegular = "Poppins-Regular"
        case poppinsMedium = "Poppins-Medium"
    }
    
    static func customFont(name: CustomFont, size: CGFloat) -> Font {
        return Font.custom(name.rawValue, size: size)
    }
}

extension Date {
    
    static func getYear(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        // Intentamos convertir la cadena a un objeto de fecha
        if let fechaObjeto = dateFormatter.date(from: date) {
            // Obtenemos el año como cadena
            let year = Calendar.current.component(.year, from: fechaObjeto)
            return String(year)
        } else {
            // La cadena de fecha no es válida
            return "nil"
        }
    }
    
}

