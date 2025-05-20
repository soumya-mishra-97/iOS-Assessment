//
//  UserServicesViewModel.swift
//  BarclaysAssesment
//
//  Created by Soumya Mishra on 20/05/25.
//

import Foundation

class UserServicesViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    init () {
        fetchUsersFromLocal()
    }
    
    // MARK: - Load from Local JSON
    func fetchUsersFromLocal() {
        guard let url = Bundle.main.url(forResource: "users", withExtension: "json") else {
            print("Local JSON file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedUsers = try JSONDecoder().decode([User].self, from: data)
            self.users = decodedUsers
        } catch {
            print("Local JSON decode error: \(error)")
        }
    }
}
