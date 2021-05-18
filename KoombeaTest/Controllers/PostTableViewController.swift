//
//  PostTableViewController.swift
//  KoombeaTest
//
//  Created by Samaniego Villarroel Stephany Katherine on 5/15/21.
//

import UIKit


class PostTableViewController: UITableViewController {

    var elements = [String]()
    var usuarios = [Users]()
    var cntPictures = 0
    var cntPosts = 0
    var j = 0
    var postsDict : [[String:Any]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showSpinner(onView: self.view)
        network()
    }
    
    func network(){
        ApiCall.getDataApi(_parameters: "") { [self] (posts, mensaje) in
            guard let posts = posts, posts.count > 1 else {
                return
            }
            if(mensaje == "ok"){
                self.usuarios = posts
                
                for i in 0..<usuarios.count{
                    
                    cntPosts = cntPosts + (self.usuarios[i].posts).count
                }
                var a = 0
                var dictionaryAny = [String : Any]()
                        for i in 0..<usuarios.count{
                            for j in 0..<(usuarios[i].posts).count{
                                dictionaryAny["userName"] = usuarios[i].name
                                dictionaryAny["userEmail"] = usuarios[i].email
                                dictionaryAny["userId"] = usuarios[i].id
                                dictionaryAny["profilePic"] = usuarios[i].profile_pic
                                dictionaryAny["idPost"] = usuarios[i].posts[j].id
                                
                                
                                var postDateSF = usuarios[i].posts[j].date
                                
                                dictionaryAny["datePost"] = changeDateFormat(date: postDateSF)
                                dictionaryAny["headerPost"] = usuarios[i].posts[j].header
                                
                                var pics = [UIImage]()
                                var images = usuarios[i].posts[j].pics
                                for image in images{
                                    var downImg = self.downloadImage(imagen: image.url)
                                    if let imageData = downImg.jpeg(.lowest) {
                                        pics.append(downImg)
                                    }
                                }
                                dictionaryAny["pics"] = pics
                                postsDict.append(dictionaryAny)
                        }
                    }
                    
                self.tableView.reloadData()
                self.removeSpinner()
            }else{
                self.removeSpinner()
            }
        }
    }
    
    @IBAction func refresh(_ sender: UIRefreshControl) {
        network()
        sender.endRefreshing()
        tableView.reloadData()
    }
    
    func changeDateFormat(date : String) -> String{
        var postDateSF = String(date.dropLast(9))
        
        let inputFormat = DateFormatter()
        inputFormat.locale = Locale(identifier: "en_US_POSIX")
        inputFormat.dateFormat = "E MMM dd yyyy HH:mm:ss"
        
        let outputFormat = DateFormatter()
        outputFormat.locale = Locale(identifier: "en_US_POSIX")
        outputFormat.dateFormat = "MMM d"
        
        let date : Date = inputFormat.date(from: postDateSF)!
        let resultDate = outputFormat.string(from: date)
        
    
        print(resultDate)
        var fechaSp = resultDate.split(separator: " ")
        
        var a = daySuffix(from: date)
        postDateSF = resultDate + a
        return postDateSF
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cntPosts
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var posts = postsDict[indexPath.row]
        var pictures = posts["pics"] as? [UIImage]
        cntPictures = pictures!.count
        
        if(cntPictures == 1){
            return 510.0
        }else if(cntPictures == 2){
            return 300.0
        }else if(cntPictures == 3){
            return 746.0
        }else if(cntPictures > 3){
            return 650
        }else{
            return 444.0
        }
        return 444.0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var posts = postsDict[indexPath.row]
        
        print(indexPath.row)
        
        var nombre = posts["userName"] as? String
        var email = posts["userEmail"] as? String
        var idUsuario = posts["userId"] as? String
        var profilePic = posts["profilePic"] as? String
        var datePost = posts["datePost"] as? String
        var idPost = posts["idPost"] as? String
        var headerPost = posts["headerPost"] as? Bool
        var pictures = posts["pics"] as? [UIImage]
        
        cntPictures = pictures!.count
        
        if(cntPictures == 1){
            
            let cell = Bundle.main.loadNibNamed("oneImageCell", owner: self, options: nil)?.first as! oneImageCell
            cell.userProfilePic.makeRounded()
            cell.viewHeader.isHidden = headerPost!
            cell.userProfilePic.image = self.downloadImage(imagen: profilePic!)
            cell.datePost.text = datePost!
            cell.userName.text = nombre!
            cell.userEmail.text = email!
            cell.imagePost.image = pictures![0]
            
            return cell
            
        }else if(cntPictures == 2){
            let cell = Bundle.main.loadNibNamed("twoImagesCell", owner: self, options: nil)?.first as! twoImagesCell
            cell.userProfilePic.makeRounded()
            cell.viewHeader.isHidden = headerPost!
            cell.userProfilePic.image = self.downloadImage(imagen: profilePic!)
            cell.datePost.text = datePost!
            cell.imagePost1.image = pictures![0]
            cell.imagePost2.image = pictures![1]
            cell.userName.text = nombre!
            cell.userEmail.text = email!
            return cell
            
        }else if(cntPictures == 3){
            let cell = Bundle.main.loadNibNamed("threeImagesCell", owner: self, options: nil)?.first as! threeImagesCell
            cell.userProfilePic.makeRounded()
            cell.viewHeader.isHidden = headerPost!
            cell.userProfilePic.image = self.downloadImage(imagen: profilePic!)
            cell.datePost.text = datePost!
            cell.imagePost1.image = pictures![0]
            cell.imagePost2.image = pictures![1]
            cell.imagePost3.image = pictures![2]
            cell.userName.text = nombre!
            cell.userEmail.text = email!
            
            
            return cell
            
        }else if(cntPictures > 3){
            let cell = Bundle.main.loadNibNamed("moreImagesCell", owner: self, options: nil)?.first as! moreImagesCell
            cell.userProfilePic.makeRounded()
            cell.viewHeader.isHidden = headerPost!
            cell.userProfilePic.image = self.downloadImage(imagen: profilePic!)
            cell.datePost.text = datePost!
            cell.imagePost.image = pictures![0]
            cell.userName.text = nombre!
            cell.userEmail.text = email!
            
            for a in 1..<pictures!.count{
                    cell.picturesCarousel.append(pictures![a])
            }
            
            return cell
            
        }else{
            let cell = Bundle.main.loadNibNamed("oneImageCell", owner: self, options: nil)?.first as! oneImageCell
            cell.userProfilePic.makeRounded()
            cell.viewHeader.isHidden = headerPost!
            cell.userProfilePic.image = self.downloadImage(imagen: profilePic!)
            cell.datePost.text = datePost!
            cell.userName.text = nombre!
            cell.userEmail.text = email!
            cell.imagePost.image = pictures![0]
            
            return cell
        }
        
    }

    func downloadImage(imagen: String) -> UIImage {
        let url = URL(string: imagen)
        
        if let data = try? Data(contentsOf: url!) {
                // Create Image and Update Image View
            return UIImage(data: data)!
        }else{
            return UIImage(named: "user")!
        }
    }
    
    func daySuffix(from date: Date) -> String {
        let calendar = Calendar.current
        
        let dayOfMonth = calendar.component(.day, from: date)
        switch dayOfMonth {
        case 1, 21, 31: return "st"
        case 2, 22: return "nd"
        case 3, 23: return "rd"
        default: return "th"
        }
    }
}
