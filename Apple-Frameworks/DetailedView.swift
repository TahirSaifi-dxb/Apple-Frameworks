//
//  DetailedView.swift
//  Apple-Frameworks
//
//  Created by Tahir Saifi on 09/09/2024.
//

import SwiftUI

struct DetailedView: View {
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView: Bool = false
    var body: some View {
        VStack(alignment: HorizontalAlignment.center){
            HStack() {
                Spacer()
                Button{
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44,height: 44)
                    
                }
            }.padding()
            
            DetailedViewSubject(image: framework.imageName, title: framework.name, description: framework.description)
            
            Button{
                isShowingSafariView = true
            }label:{
                Text("Learn More")
                    .frame(width: 280,height: 50)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .background(Color.blue.gradient)
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    .padding()
                    
                
            }
            Spacer()
        }.sheet(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        })
    }
    
}

#Preview {
    DetailedView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
}

struct DetailedViewSubject: View {
    var image: String
    var title: String
    var description: String
    var body: some View {
        
            Image(image)
                .resizable()
                .frame(width: 100,height:100).padding(.top, 100)
            Text(title)
                .font(.title)
                .fontWeight(.bold)
            Text(description).font(.body)
                .padding(.top, 10)
                .padding()
          
        }
    
    
}
