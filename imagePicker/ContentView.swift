//
//  ContentView.swift
//  imagePicker
//
//  Created by 野澤拓己 on 2020/09/01.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var imgData = Data(capacity: 0)
    @State var shown = false
    
    var body: some View {
        
        VStack {
            
            Image(uiImage: UIImage(data: imgData)!).resizable().frame(height: 300).padding().cornerRadius(20)
            
            Button(action: {
                
                self.shown.toggle()
                
            }) {
                
                Text("Select Image")
                
            }.sheet(isPresented: $shown, onDismiss: {
                
                self.shown.toggle()
                
            }) {
                
                picker()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct picker: UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<picker>) -> UIImagePickerController {
        
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<picker>) {
        
        
    }
}
