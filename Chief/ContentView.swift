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
    let jsCodeLocation = Bundle.main.url(forResource: "base.ios", withExtension: "jsbundle");
    
    @State var showAlert = false
    @State var percent = 0.5
    
    var body: some View {
    
        NavigationView{
        
            VStack {
                RNScreen()
            }
           
        }.navigationTitle(Text("Tutors"))
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
