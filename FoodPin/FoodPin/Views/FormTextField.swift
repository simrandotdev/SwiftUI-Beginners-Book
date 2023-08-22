//
//  FormTextField.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-08-22.
//

import SwiftUI

struct FormTextField: View {
    
    let label: String
    var placeHolder: String = ""
    
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(label)
                .font(.system(.headline, design: .rounded))
                .foregroundColor(Color(.darkGray))
            
            TextField(placeHolder, text: $value)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .padding(.horizontal)
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                }
                .padding(.vertical, 10)
        }
    }
}

struct FormTextField_Previews: PreviewProvider {
    static var previews: some View {
        FormTextField(label: "NAME", placeHolder: "Add a restaurant name", value: .constant(""))
            .previewLayout(.sizeThatFits)
            .previewDisplayName("FormTextField")
    }
}
