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
                Text(user.name)
                Text(user.email)
                Text(user.phone)
                Text(user.website)
            }
        }
    }
}

#Preview {
    UserView()
}
