//
//  quote.swift
//  oct
//
//  Created by Francisco Perez on 28/12/22.
//

import SwiftUI

struct quoteDesc: View {
    
    // we can use a struct in here for example
    // var quotes: QuotesStruct
    // we can acces the struct
    
    var title: String
    var description: String
    
    
    var body: some View {
        
        
        VStack {
            
       
                
            AsyncImage(
                url: URL(string: "https://ilpacolo.com/facebook.jpg"),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 500, maxHeight: 300)
                },
                placeholder: {
                    ProgressView()
                }
            )
            
            Text(title)
                .foregroundColor(.black)
            .font(.headline)
            .padding()
            
            Text(description)
                .foregroundColor(.blue)
                .font(.body)
        }
            
        
       
       
    }
}

struct quote_Previews: PreviewProvider {
    static var previews: some View {
        quoteDesc(title: "Hello", description: "loading")
    }
}
