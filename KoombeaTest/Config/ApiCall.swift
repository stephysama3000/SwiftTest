//
//  ApiCall.swift
//  KoombeaTest
//
//  Created by Samaniego Villarroel Stephany Katherine on 5/15/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiCall{
    
    
    class func getDataApi(_parameters : Any, completion:@escaping(([Users]?,String?) -> Void)) {
        let api = "https://mock.koombea.io/mt/api/users/posts"
        AF.request(api, method: .get).validate().responseJSON{ (data) in
            guard let posts = data.value else { return }
            print(posts)
            switch data.result {
            case let .success(value):
                
                guard let json = JSON(value).dictionary,
                      let info = json["data"]?.array,
                      let usuariosDict = info[0].dictionary else{
                            completion(nil,"")
                            return
                    }
                
                
                var usuario = [Users]()
                
                if let userPostsArray = json["data"]?.array{
                    for userPost in userPostsArray{
                        guard let usuariosDict = userPost.dictionary else{
                            continue
                        }
                        let nombreUsuario = usuariosDict["name"]?.string
                        let emailUsuario = usuariosDict["email"]?.string
                        let imagenPerfilUsuario = usuariosDict["profile_pic"]?.string
                        let idUsuario = usuariosDict["uid"]?.string
                        guard let postsUsuario = usuariosDict["posts"]?.array else{
                            continue
                        }
                        
                        var posts = [Post]()
                        var cntPost = 0
                        var header = true
                        for i in 0..<postsUsuario.count{
                            let idPost = postsUsuario[i]["id"].int
                            let datePost = postsUsuario[i]["date"].string
                            guard let picsPost = postsUsuario[i]["pics"].array else{
                                continue
                            }
                            
                            var imagenes = [Pictures]()
                            for i in 0..<picsPost.count{
                                let pics = picsPost[i].string
                                let newPic = Pictures(url: pics!)
                                imagenes.append(newPic)
                            }
                            cntPost+=1
                            if(cntPost > 1){
                                header = true
                            }else{
                                header = false
                            }
                            let postUser = Post(id: String(idPost!), date: datePost!, pics: imagenes, header: header)
                            posts.append(postUser)
                            
                            
                        }
                        
                        let newUserPost = Users(id: idUsuario!, name: nombreUsuario!, email: emailUsuario!, profile_pic: imagenPerfilUsuario!, posts: posts)
                        usuario.append(newUserPost)
                        
                    }
                }
                completion(usuario,"ok")
            case let .failure(error):
                print(error)
                completion(nil,"error")
            }
            
        }
    }
    
    
}
