//
//  CustomButton.swift
//  coredata-vs-realm
//
//  Created by Augustinas Malinauskas on 17/07/2021.
//

import SwiftUI


struct CustomButton: View {
    var text: String
    var onTap: () -> ()
    
    var body: some View {
        Button(action: onTap) {
            Text(text)
                .font(.callout)
                .foregroundColor(.white)
                .padding(.horizontal, 5)
                .padding(.vertical, 5)
                .background(Color(.systemIndigo))
                .cornerRadius(2)
            
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Hola", onTap: {})
    }
}
