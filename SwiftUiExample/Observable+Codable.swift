//
//  Observable+Codable.swift
//  SwiftUiExample
//
//  Created by Marius Wichtner on 13.01.21.
//

import Foundation
import RxSwift

extension ObservableType {
    
    public func mapObject<T: Codable>(type: T.Type) -> Observable<T> {
        return flatMap { data -> Observable<T> in
            print(data)
            return data
        }
        
        //return flatMap { data -> Observable<T> in
        //    let decoder = JSONDecoder()
        //    let data = try PropertyListSerialization.data(fromPropertyList: data, format: PropertyListSerialization.PropertyListFormat.binary, options: 0)
        //    let object = try decoder.decode(T.self, from: data)
        //    return Observable.just(object)
        //}
    }
    
    public func mapArray<T: Codable>(type: T.Type) -> Observable<[T]> {
        return flatMap { data -> Observable<[T]> in
            let decoder = JSONDecoder()
            let data = try PropertyListSerialization.data(fromPropertyList: data, format: PropertyListSerialization.PropertyListFormat.binary, options: 0)
            let objects = try decoder.decode([T].self, from: data)
            return Observable.just(objects)
        }
    }
}

