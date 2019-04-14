//
//  ServicesProtocol.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 22/03/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import Foundation

protocol ServicesProtocol {
    func getPopularDrinks(completion: @escaping (Result<[Drink]?>) -> Void)
//    func fetchAlbums(completion: @escaping (Result<[AlbumDetailsModel?]>) -> Void)
//    func fetchAlbumsFor(artistID: String, completion: @escaping (Result<[AlbumDetailsModel]?>) -> Void)
//    func fetchArtists(with name: String, completion: @escaping (Result<[ArtistModel]?>) -> Void)
//    func fetchAlbumDetailFor(albumID: String, artistID: String, completion: @escaping (Result<AlbumDetailsModel?>) -> Void)
//    func addAlbum(newAlbum: AlbumDetailsModel, completion: @escaping (VoidResult) -> Void)
//    func removeAlbum(withID mbid: String, completion: @escaping (VoidResult) -> Void)
}
