//
//  NetworkManager.swift
//  YinzcamSwiftApp
//
//  Created by Setu Desai on 2/9/24.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    var cachedImage = NSCache<NSString, UIImage>()
    
    private let apiURL = "http://files.yinzcam.com.s3.amazonaws.com/iOS/interviews/ScheduleExercise/schedule.json"
    private let URLPhoto = "http://yc-app-resources.s3.amazonaws.com/nfl/logos/nfl_%@_light.png"
    
    var imageCacheList = NSCache<NSString, UIImage>()

    func getTeamImage(midURL: String, completionImage: @escaping (UIImage) -> Void) {
        var imageView = UIImage()
        defer { completionImage(imageView) }
        if let triImageString = imageCacheList.object(forKey: NSString(string: midURL)) {
            imageView = triImageString
        } else if let url = URL(string: getURLPhotoString(midURL: midURL)) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil else {  return }
                
                if let data, let image = UIImage(data: data) {
                    self.imageCacheList.setObject(image, forKey: NSString(string: midURL))
                    completionImage(image)
                }
            }.resume()
        }
    }

    fileprivate func getURLPhotoString(midURL: String) -> String {
        return String(format: URLPhoto, midURL)
    }

    //MARK:- API Function Call
    func apiCall(completionHandler: @escaping (YZGameDetail?) -> Void) {
        guard let url = URL(string: apiURL) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {  return }
            
            if let data {
                let jsonData = try? JSONDecoder().decode(YZGameDetail.self, from: data)
                completionHandler(jsonData)
            }
        }.resume()
    }

}
