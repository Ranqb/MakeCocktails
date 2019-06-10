//
//  DataBaseService.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 22/03/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import Foundation
import CoreData

class DataBaseService: ServicesProtocol {
    
    // MARK: Properties
    
    private let backgroundContext: NSManagedObjectContext!
    
    // MARK: Initialization
    
    init(context: NSManagedObjectContext) {
        backgroundContext = context
    }
    
    convenience init() {
        //Use the default container for production environment
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Can not get shared app delegate")
        }
        self.init(context: appDelegate.managedObjectContext)
    }
    
    // Internal Helpers
    
    func fetchAlbums(completion: @escaping (Result<[AlbumDetailsModel?]>) -> Void) {
        backgroundContext.perform {
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Album")
                guard let results = try self.backgroundContext.fetch(fetchRequest) as? [Album] else { return }
                var albums = results.map { $0.fetch() }
                albums = albums.sorted(by: { $0.albumName?.lowercased() ?? "" < $1.albumName?.lowercased() ?? "" })
                completion(Result.success(albums))
            } catch {
                completion(Result.failure(error))
            }
        }
    }
    
    func addAlbum(newAlbum: AlbumDetailsModel, completion: @escaping (VoidResult) -> Void) {
        backgroundContext.perform {
            do {
                let managedAlbum = NSEntityDescription.insertNewObject(forEntityName: "Album",
                                                                       into: self.backgroundContext) as! Album
                managedAlbum.add(newAlbum: newAlbum)
                try self.backgroundContext.save()
                completion(Result.success(Void()))
            } catch {
                completion(Result.failure(error))
            }
        }
    }
    
    func removeAlbum(withID mbid: String, completion: @escaping (VoidResult) -> Void) {
        backgroundContext.perform {
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Album")
                let predicate = NSPredicate(format: "albumID == %@", mbid)
                fetchRequest.predicate = predicate
                guard let results = try self.backgroundContext.fetch(fetchRequest) as? [Album] else { return }
                for object in results {
                    self.backgroundContext.delete(object)
                }
                try self.backgroundContext.save()
                completion(Result.success(Void()))
            } catch {
                completion(Result.failure(error))
            }
        }
    }
    
    func fetchArtists(with name: String, completion: @escaping (Result<[ArtistModel]?>) -> Void) {
        fatalError("never shouldn't be called")
    }
    
    func fetchAlbumsFor(artistID: String, completion: @escaping (Result<[AlbumDetailsModel]?>) -> Void) {
        backgroundContext.perform {
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Album")
                let predicate = NSPredicate(format: "artistID == %@", artistID)
                fetchRequest.predicate = predicate
                
                guard let results = try self.backgroundContext.fetch(fetchRequest) as? [Album] else { return }
                let albums = results.map { $0.fetch() }
                completion(Result.success(albums))
            } catch {
                completion(Result.failure(error))
            }
        }
    }
    
    func fetchAlbumDetailFor(albumID: String, artistID: String, completion: @escaping (Result<AlbumDetailsModel?>) -> Void) {
        backgroundContext.perform {
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Album")
                let predicate = NSPredicate(format: "albumID == %@", albumID)
                fetchRequest.predicate = predicate
                
                guard let results = try self.backgroundContext.fetch(fetchRequest) as? [Album] else { return }
                let albums = results.map { $0.fetch() }
                if let album = albums.first {
                    completion(Result.success(album))
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: nil)
                    completion(Result.failure(error))
                }
            } catch {
                completion(Result.failure(error))
            }
        }
    }
    
    func isAlbumExistInCoreData(albumID: String) -> Bool {
        var results: [NSManagedObject] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Album")
        let predicate = NSPredicate(format: "albumID == %@", albumID)
        fetchRequest.predicate = predicate
        do {
            results = try backgroundContext.fetch(fetchRequest) as! [NSManagedObject]
        } catch {
            print("error executing fetch request: \(error)")
        }
        return results.count > 0
    }
}
