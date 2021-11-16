//
//  ContentView.swift
//  SwiftUI-PostRequestExample
//
//  Created by Kürşat Şimşek on 16.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    var apiManager = ApiManager()
    @State var suppliers = [Supplier]()
    @State var companyName = ""
    @State var contactName = ""
    @State var contactTitle = ""
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            
            Form {
                Section {
                    ForEach(suppliers, id:\.id){item in
                        Text(item.companyName ?? "").tag(item.id)
                    }
                } header: {
                    Text("Supplier List")
                }
                
                Section(header: Text("Supplier Form")) {
                    TextField("Company Name", text: $companyName).padding()
                    TextField("Contact Name", text: $contactName).padding()
                    TextField("Contact Title", text: $contactTitle).padding()
                }
                
            }
            .onAppear() {
                apiManager.getAllSupplier { supplierList in
                    suppliers = supplierList
                }
            }
            
            Button(action: {
                
                let supplierModel = Supplier(companyName: companyName, contactName: contactName, contactTitle: contactTitle)
                
                apiManager.addSupplier(supplierModel: supplierModel) { newSupplier in
                    suppliers.append(newSupplier)
                }
            }) {
                Text("Supplier").font(.body)
                Image(systemName: "plus.app")
                    .font(.system(size: 30.0))
            }
            .frame(width: 140, height: 30, alignment: .center)
            .foregroundColor(.white)
            .padding(.all)
            .background(Color.accentColor)
            .cornerRadius(16)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
