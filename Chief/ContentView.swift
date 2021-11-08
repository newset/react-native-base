//
//  ContentView.swift
//  Chief
//
//  Created by Doctorwork on 2021/10/19.
//

import SwiftUI
import React

struct Tutor {
    let name: String
}

struct TutorCell: View {
    let tutor: Tutor
    var body: some View {
        Text(tutor.name)
            .font(.subheadline)
            .foregroundColor(.blue)
    }
}

struct ContentView: View {
    var tutors: [Tutor] = [];

    let jsLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")
    
    
    @State var showAlert = false
    @State var percent = 0.5
    
    var body: some View {
//        let rootView = RCTRootView(
//            bundleURL: jsLocation!,
//            moduleName: "RNHighScores",
//            initialProperties: nil,
//            launchOptions: nil
//        )
        
    
        NavigationView{
        
            VStack {
                Button(action: {
                    self.showAlert = true
                }){
                    Text("ok")
                }
                .alert(isPresented: $showAlert){
                    Alert(title: Text("ok"),
                          message: Text("message"))
                }
                HStack {
                    VStack {
                        Rectangle()
                            .foregroundColor(.blue)
                        Text("Target Color Block")
                    }
                    VStack{
                        Rectangle()
                            .foregroundColor(.red)
                        ExtractedView()
                    }
                }
                HStack{
                    Text("0")
                    Slider(value: $percent)
                        .accentColor(.red)
                    Text("255")
                }
                
            }
            
           
        }.navigationTitle(Text("Tutors"))
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    var body: some View {
        HStack{
            Text("r: xx")
            Text("g: xx")
            Text("b: xx")
        }
    }
}
