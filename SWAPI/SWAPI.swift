//
//  SWAPI.swift
//  SWAPI
//
//  Created by Bruno Berisso on 2/22/16.
//  Copyright © 2016 Bruno Berisso. All rights reserved.
//

import Foundation


struct Object {

    let name: String?
    let category: String //Planet, Starship, etc

    init(category: String, data: AnyObject) {
        self.category = category

        if let objectData = data as? [String: AnyObject],
            let name = objectData["name"] as? String {
            self.name = name
        } else {
            self.name = nil
        }
    }
}



class SWAPI: NSObject {


    private static let baseUrl = "http://swapi.co/api/"

    class func getObjectList(category:String, onComplete: ([Object] -> ())) {

        let urlString = baseUrl + category.lowercaseString
        guard let url = NSURL(string: urlString) else {
            return
        }

        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: url)

        session.dataTaskWithRequest(request) { (data, response, error) -> Void in

            guard let data = data else {
                print("No data in response")
                return
            }

            do {

                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)

                if let resultList = json["results"] as? [AnyObject] {

                    let objects = resultList.map { Object(category: category, data: $0) }
                    dispatch_async(dispatch_get_main_queue(), { onComplete(objects) })
                }

            } catch let e {
                print(e)
            }


        }.resume()

    }

}