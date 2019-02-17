//
//  ReceiveViewController.swift
//  SlideshowApp
//
//  Created by ふるふる on 2019/02/17.
//  Copyright © 2019 Tsuyoshi Furuhata. All rights reserved.
//

import UIKit

class ReceiveViewController: UIViewController {

    @IBOutlet weak var zoomView: UIImageView!
    
    //受け取る画像名のプロパティを宣言/初期化
    var receiveImage:UIImage = UIImage.init()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let image = UIImage(named: "imageA.png")
        zoomView.image = receiveImage
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
