//
//  pprueba.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 27/11/23.
//

import SwiftUI

struct pprueba: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundStyle(.secundario)
            
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundStyle(.principal)
            
        }
    }
}

#Preview {
    pprueba()
}
