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
            .cornerRadius(40)
    }
}

struct ContentView: View {
    
    var pageAliasName = "doctor";
    
    var tutors: [Tutor] = []
    
    @State var showAlert = false
    @State var percent = 0.5
    
    var body: some View {
    
        NavigationView{
        
            VStack {
                NavigationLink(destination: RNScreen()) {
                    Text("Hello World")
                }
                Button(action: {
                    print("ok")
                }){
                    Text("跳转")
                        .frame(minWidth: 0, maxWidth: 100)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(40)
                }
//                RNScreen()
            }.navigationTitle("Dynamic App")
           
        }
        .onAppear {
            print("ContentView appeared!")
        }
    }
}

struct RNScreen: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> HomeViewController {
        let screen = HomeViewController()
        return screen
    }
    
    // 3.
    func updateUIViewController(_ uiViewController: HomeViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = HomeViewController
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            ContentView()
        }.navigationTitle("Test")
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
