

import Foundation

protocol ServiceProtocol {
    func fetchPostList(userId: Int, completion: @escaping ([Parameter]?) -> Void)
    func checkUser(userName: String , completion: @escaping ([UserModel]?) -> Void)
    func fetchComments(postId: Int , completion: @escaping ([Comment]?) -> Void)
    func fetchAlbums(userId: Int , completion: @escaping ([Album]?) -> Void)
    func fetchPhotos(albumId: Int , completion: @escaping ([Photo]?) -> Void)
}
