//
//  Quotes.swift
//  oct
//
//  Created by Francisco Perez on 25/12/22.
//

import SwiftUI

struct Quote: Codable{
    
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

struct Quotes: View {
    
    @State private var quotes = [Quote]()
    
    
    // [backslah combination] option + ?'     \
    var body: some View {
        
        NavigationView {
            List(quotes,id: \.id) { quote in
                
      
                NavigationLink(destination: quoteDesc(title: quote.title,description: quote.body), label:{
                    
                            
                    VStack(alignment: .leading){
                        Text(quote.title)
                            .font(.headline)
                            .foregroundColor(.black)
                        Text(quote.body)
                            .font(.body)
                            .foregroundColor(.blue)
                        
                       
                    }
                    
                    
                })
                

                
            }
            .navigationTitle("Quotes")
            .task {
                await fetchdata()
            }
        }
    }
    
    
    func fetchdata() async{
        
        //create the url
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("my bad")
            return }
        
        //fetch the data
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([Quote].self, from: data){
                quotes = decodedResponse
            }
        }catch{
            print("bad news")
        }
    } // end async
}

struct Quotes_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Quotes()
            
        }
    }
}
    

