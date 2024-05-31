//
//  ViewModel.swift
//  DemoMVVM
//
//  Created by Disha on 31/05/24.
//

import Foundation

class GuitarCoursesViewModel {

    var arrIndex: [Course] = []
    var arrSmart: [SmartCollection] = []
    var arrOwnedData: [Course] = []
    var arrRecentlyWatch: [Course] = []
    var arrFavorites: [Course] = []
    var arrWishList: [Course] = []
    var arrInProgress: [Course] = []
    var arrCompleted: [Course] = []

    func fetchGuitarCourses(completion: @escaping (Bool) -> Void) {

        guard let gitUrl = URL(string: "https://gist.githubusercontent.com/akshayxunison/d026f35698e6de4ace5b350c281d4992/raw/8f1a506716440e3a96aa7914fba083aacf0e9b28/tfRSPNS") else {
            completion(false)
            return
        }

        let request = URLRequest(url: gitUrl)
        let session = URLSession.shared

        session.dataTask(with: request) { data, response, error in

            guard let data = data else {
                completion(false)
                return
            }
            
            do {
                let gitData = try JSONDecoder().decode(SetCategory.self, from: data)
                self.arrIndex = gitData.result.index
                self.arrSmart = gitData.result.collections.smart
                
                for i in 0..<self.arrSmart.count {
                    let courses = self.arrSmart[i].courses
                    let filteredArray = self.arrIndex.filter { course in
                        courses.contains(course.id)
                    }
                    self.arrSmart[i].arrCourceData = filteredArray
                    
                    switch self.arrSmart[i].id {
                    case "owned":
                        self.arrOwnedData = filteredArray
                    case "recently_watched":
                        self.arrRecentlyWatch = filteredArray
                    case "favorites":
                        self.arrFavorites = filteredArray
                    case "wishlist":
                        self.arrWishList = filteredArray
                    case "in_progress":
                        self.arrInProgress = filteredArray
                    case "completed":
                        self.arrCompleted = filteredArray
                    default:
                        break
                    }
                }
                
                DispatchQueue.main.async {
                    completion(true)
                }
            } catch let err {
                print("Err", err)
                completion(false)
            }
        }.resume()
    }
}

