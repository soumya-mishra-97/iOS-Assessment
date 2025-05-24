//
//  UserView.swift
//  BarclaysAssesment
//
//  Created by Soumya Mishra on 20/05/25.
//

import SwiftUI

struct UserView: View {
    @StateObject private var viewModel = UserServicesViewModel()
    
    var body: some View {
        List(viewModel.users) { user in
            VStack(alignment: .leading) {
                Text(user.name).font(.headline)
                Text(user.email).foregroundColor(.secondary)
                Text("City: \(user.address.city), Zip: \(user.address.zipcode)")
                    .font(.subheadline)
                Text("Company: \(user.company.name)")
                    .font(.subheadline).italic()
            }
        }
    }
}

#Preview {
    UserView()
}
