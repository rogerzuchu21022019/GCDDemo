//
//  ViewController.swift
//  GCDDemo
//
//  Created by Vu Thanh Nam on 12/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ivScreen: UIImageView!
    @IBOutlet weak var iv1: UIImageView!
    @IBOutlet weak var iv2: UIImageView!
    @IBAction func getData(_ sender: UIButton) {
        
        getLoadDataWithGCD(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKWcBHW9-xQ_jRA9H4f7AB7HbJYfK8OEOVevyjDlzbmhCCaStLAhw8XAPgWWdTs3FuWKM&usqp=CAU",img: ivScreen)
     
        getLoadDataWithGCD(url: "https://wallpaperaccess.com/full/639436.jpg", img: iv1)
        getLoadDataWithGCD(url: "https://wallpaperaccess.com/full/639436.jpg", img: iv2)
    }
    @IBAction func nextToScreen(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let screen2 = storyboard.instantiateViewController(withIdentifier: "SecondVC")
        navigationController?.pushViewController(screen2, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getLoadDataWithGCD(url:String,img:UIImageView){
        let queue1 = DispatchQueue(label: "action")
         queue1.async {
             let url = URL(string: url)
             //data
             do {
                 let data = try Data(contentsOf: url!)
                 DispatchQueue.main.async {
                     img.image = UIImage(data: data)
                 }
             } catch  {
                 
             }
         }
    }


}

