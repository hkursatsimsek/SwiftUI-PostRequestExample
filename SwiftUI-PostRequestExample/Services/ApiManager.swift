//
//  ApiManager.swift
//  SwiftUI-PostRequestExample
//
//  Created by Kürşat Şimşek on 16.11.2021.
//

import Foundation

class ApiManager {
    
    let baseURL = "https://northwind.vercel.app/api/suppliers"

    func getAllSupplier(completionHandler: @escaping ( [Supplier])->Void ) {
        if let url = URL(string: baseURL) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode([Supplier].self, from: data)
                        completionHandler(decodedData)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
        }
    }
    
    func addSupplier(supplierModel: Supplier, completionHandler: @escaping (Supplier)-> Void) {
        guard let url = URL(string: baseURL) else { return }
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        if let compName = supplierModel.companyName, let contName = supplierModel.contactName, let title = supplierModel.contactTitle {
            
            let postString = "companyName=\(compName)&contactName=\(contName)&contactTitle=\(title)"
            
            request.httpBody = postString.data(using: .utf8)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(Supplier.self, from: data)
                        completionHandler(decodedData)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
        }
    }
    
    
}
