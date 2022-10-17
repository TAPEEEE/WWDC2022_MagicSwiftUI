//
//  File.swift
//  SwiftMagic
//
//  Created by Nattapon Suwanno on 20/4/2565 BE.
//

import SwiftUI

struct FormRowView: View {
    var icon:String
    var Name:String
    var color:Color
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                Image(systemName: icon)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .frame(width: 55, height: 55, alignment: .center)
            Text(Name).foregroundColor(Color("Text"))
                .font(.system(size: 18))
        }
        .padding(5)
    }
}



