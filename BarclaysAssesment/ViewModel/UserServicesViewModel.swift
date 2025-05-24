//
//  UserServicesViewModel.swift
//  BarclaysAssesment
//
//  Created by Soumya Mishra on 20/05/25.
//

import Foundation
import Combine

class UserServicesViewModel: ObservableObject {
    
    @Published var users: [User] = []
    private var cancellables: Set<AnyCancellable> = []
    
    init () {
        fetchUsersFromLocal()
    }
    
    // MARK: - Load from API
    func fetchUsersFromAPI() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else{
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Api Error: \(error)")
                }
            },
                  receiveValue: {[weak self] users in
                self?.users = users
            }).store(in: &cancellables)
        
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
