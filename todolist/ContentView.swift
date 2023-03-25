//
//  ContentView.swift
//  mactest
//
//  Created by Thomas Da Silva on 14/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Text("Home")
                    }
                AboutView()
                    .tabItem {
                        Text("About")
                    }
            }
        }
    }
}

struct HomeView: View {
    
    @State var textT: String = ""
    @State var dataArray: [String] = []
    @State var isSelected: Bool = false
    var body: some View {
        VStack {
            HStack {
                Text("TodoList - Home")
                    .font(.title)
            }.padding(.all, 30)
            VStack {
                TextField("Ajouter une note...", text: $textT)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: addList, label: {
                    Text("Ajouter")
                })
                ForEach(dataArray, id: \.self) { data in
                    Toggle(isOn: $isSelected) {
                        Text(data)
                    }

                }
                Spacer()
                
            }
        }
    }
    func addList() {
        dataArray.append(textT)
    }
    func removeList() {
    }
}

struct AboutView: View {
    var body: some View {
        VStack {
            HStack {
                Text("TodoList")
                    .font(.title)
            }.padding(.all, 10)
            
            HStack {
                Text("Voici la TodoList avec les tâches à effectuer tous les jours.")
                    .font(.title2)
            }.padding(.all, 10)
            HStack {
                Text("Entré dans l'input un text à effectuer, il sera ensuiste inscrit dans la zone du bas. Vous pouvais ensuite le selectionner ou le deselectionner quand vous avez finit.")
                    .font(.title3)
            }.padding(.all, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
