//
//  DataService.swift
//  My neighboors
//
//  Created by Admin on 18.07.2018.
//  Copyright © 2018 MaximMasov. All rights reserved.
//

import Foundation
import UIKit

class DataService{
    static let instance = DataService()
    
    private var _loadedPosts = [Post]()
    var loadedPosts: [Post]{
        return _loadedPosts
    }
    
    func savePosts(){
        let postData = NSKeyedArchiver.archivedData(withRootObject: _loadedPosts)
        UserDefaults.standard.set(postData, forKey: "posts")
        UserDefaults.standard.synchronize()
    }
    
    func loadPosts(){
        if let postsData = UserDefaults.standard.object(forKey: "posts") as? Data{
            if let postsArray = NSKeyedUnarchiver.unarchiveObject(with: postsData) as? [Post]{
                _loadedPosts = postsArray
            }
        }
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "postLoaded"), object: nil))
    }
    
    func saveImageAndCreatePath(_ image: UIImage) -> String{
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(Date.timeIntervalSinceReferenceDate).png"
        let fullPath = documentsPathForFileNmae(imgPath)
        try? imgData?.write(to: URL(fileURLWithPath: fullPath), options: [.atomic])
        return imgPath
    }
    
    func imageForPath(_ path: String) -> UIImage? {
        let fullPath = documentsPathForFileNmae(path)
        let image = UIImage(named: fullPath)
        return image
        
    }
    
    func addPost(post: Post){
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
    func documentsPathForFileNmae(_ name: String) -> String{
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.appendingPathComponent(name)
    }
    
    
}
