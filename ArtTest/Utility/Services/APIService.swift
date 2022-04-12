

import Foundation



class APIService : ServiceProtocol {
    func fetchAlbums(userId: Int, completion: @escaping ([Album]?) -> Void) {
        loadAlbumData({ albums in
            completion(albums)
        }, userId: userId)
    }
    
    func fetchPhotos(albumId: Int, completion: @escaping ([Photo]?) -> Void) {
        loadPhotoData({ photos in
            completion(photos)
        }, albumId: albumId)
    }
    
    
    func fetchComments(postId: Int, completion: @escaping ([Comment]?) -> Void) {
        loadCommentData({ comments in
            completion(comments)
        }, postId: postId)
    }
    
    func checkUser(userName: String, completion: @escaping ([UserModel]?) -> Void) {
        loadUserData({ users in
            completion(users)
        }, userName: userName)
    }
    
   
    
    
    func fetchPostList(userId: Int, completion: @escaping ([Parameter]?) -> Void) {
        loadPostData({ articles in
            completion(articles)
        }, userId: userId)
    }
    
    private func loadUserData(_ completion: @escaping ([UserModel]?) -> Void, userName: String) {
        
        let url = "\(URLConstants.base_url)\(URLConstants.user)"
        
        guard var components = URLComponents(string: url) else {
            print("Error: cannot create URLCompontents")
            return
        }
        
        components.queryItems = [URLQueryItem(name: "username", value: userName.description)]

        guard let url = components.url else {
            print("Error: cannot create URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        print(request.description)
        
        URLSession.shared.dataTask(with: request){ (data, _, _) in
            
            guard let data = data else {
                completion([])
                return
            }
            
            guard let parameters = try? JSONDecoder().decode(UserModels.self, from: data) else {
                completion([])
                return
            }
            
            DispatchQueue.main.async {
                
                completion(parameters)
                
            }
            
        }.resume()
    }
    
    private func loadPostData(_ completion: @escaping ([Parameter]?) -> Void, userId: Int) {
        
         let url = "\(URLConstants.base_url)\(URLConstants.posts)"
        
        guard var components = URLComponents(string: url) else {
            print("Error: cannot create URLCompontents")
            return
        }
        components.queryItems = [URLQueryItem(name: "userId", value: userId.description)]

        guard let url = components.url else {
            print("Error: cannot create URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        print(request.description)
        URLSession.shared.dataTask(with: request){ (data, _, _) in
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            guard let parameters = try? JSONDecoder().decode(Parameters.self, from: data) else {
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                
                completion(parameters)
                
            }
            
        }.resume()
    }
    
    private func loadCommentData(_ completion: @escaping ([Comment]?) -> Void, postId: Int) {
        
         let url = "\(URLConstants.base_url)\(URLConstants.comments)"
        
        guard var components = URLComponents(string: url) else {
            print("Error: cannot create URLCompontents")
            return
        }
        components.queryItems = [URLQueryItem(name: "postId", value: postId.description)]

        guard let url = components.url else {
            print("Error: cannot create URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        print(request.description)
        URLSession.shared.dataTask(with: request){ (data, _, _) in
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            guard let parameters = try? JSONDecoder().decode(Comments.self, from: data) else {
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                
                completion(parameters)
                
            }
            
        }.resume()
    }
    
    private func loadAlbumData(_ completion: @escaping ([Album]?) -> Void, userId: Int) {
        
         let url = "\(URLConstants.base_url)\(URLConstants.user)/\(userId)\(URLConstants.albums)"
        
        guard let components = URLComponents(string: url) else {
            print("Error: cannot create URLCompontents")
            return
        }
//        components.queryItems = [URLQueryItem(name: "postId", value: postId.description)]

        guard let url = components.url else {
            print("Error: cannot create URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        print(request.description)
        URLSession.shared.dataTask(with: request){ (data, _, _) in
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            guard let parameters = try? JSONDecoder().decode(Albums.self, from: data) else {
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                
                completion(parameters)
                
            }
            
        }.resume()
    }
    
    private func loadPhotoData(_ completion: @escaping ([Photo]?) -> Void, albumId: Int) {
        
         let url = "\(URLConstants.base_url)\(URLConstants.albums)/\(albumId)\(URLConstants.photos)"
        
        guard let components = URLComponents(string: url) else {
            print("Error: cannot create URLCompontents")
            return
        }
//        components.queryItems = [URLQueryItem(name: "postId", value: postId.description)]

        guard let url = components.url else {
            print("Error: cannot create URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        print(request.description)
        URLSession.shared.dataTask(with: request){ (data, _, _) in
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            guard let parameters = try? JSONDecoder().decode(Photos.self, from: data) else {
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                
                completion(parameters)
                
            }
            
        }.resume()
    }
}
