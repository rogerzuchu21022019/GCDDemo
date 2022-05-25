//
//  SecondViewController.swift
//  GCDDemo
//
//  Created by Vu Thanh Nam on 12/05/2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imGirl: UIImageView!
    var arrImage:[UIImage] = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!,
    ]
    var n = 0
    @IBAction func ChangeImage(_ sender: UIButton) {
        
        n += 1
        imGirl.image = arrImage[n] as UIImage
        if n == 4 {
            n = -1
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromURL(url: "https://toigingiuvedep.vn/wp-content/uploads/2020/12/tai-hinh-girl-xinh-viet-nam-cute-2-530x600.jpg", position: 0)
        getDataFromURL(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcYamg9jqL4_uQHDtWO8_2PedSADkhxrhgFw&usqp=CAU", position: 1)
       getDataFromURL(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIuvkqRko5pjmXt6qqvo27e4D26qdBFKF8MQ&usqp=CAU", position: 2)
        getDataFromURL(url: "https://live.staticflickr.com/65535/47729768431_1f98a8827c_b.jpg", position: 3)
        getDataFromURL(url: "https://kenh14cdn.com/2019/9/27/566226151661511044021668004432122225985389n-1569234596911848541502-1569517951952686128625.jpg", position: 4)
    }
    
    func getDataFromURL(url:String,position:Int){
        let queue1 = DispatchQueue(label: "action1")
        queue1.async {
            let url1 = URL(string: url)
            do {
                let data = try Data(contentsOf: url1!)
                DispatchQueue.main.async {
                    self.arrImage[position] = UIImage(data: data)!
                    
                }
            } catch  {
                
            }
        }
    }
    
}
