//
//  ViewController.swift
//  SlideshowApp
//
//  Created by ふるふる on 2019/02/17.
//  Copyright © 2019 Tsuyoshi Furuhata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //表示する画像
    @IBOutlet weak var slideView: UIImageView!
    //Debug用タイマーラベル
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var forwardButton: UIButton!
    
    //タイマー
    var timer: Timer!
    //タイマー用の時間のための変数
    var timer_sec:Float = 0
    //タイマーで更新される表示画像用変数
    var slideViewNumber = 0
    //画像の名前配列
    let imageNameArray = [
        "imageA",
        "ImageB",
        "ImageC",
        "ImageD",
        "ImageE",
    ]
    //画像の名前
    var slideViewName = "no name"
    //バンドルした画像ファイルを読み込み
    let image = UIImage(named: "imageA.png")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        slideView.image = image
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //segueから遷移先のReceiveViewControllerを取得する
        let receiveViewController:ReceiveViewController = segue.destination as! ReceiveViewController
        //表示している画像を遷移先に渡す
        receiveViewController.receiveImage = slideView.image!
        if self.timer != nil{
            self.timer.invalidate()
            self.timer_sec = 0
            self.timer = nil
        }
    }
    
    // selector: #selector(updatetimer(_:))で指定された関数
    // timeInterval: 0.1, repeats: true で指定された通り、0.1秒毎に読み出され続ける
    @objc func updateTimer(_ timer: Timer){
        self.timer_sec += 0.1
        self.timerLabel.text = String(format: "%.1f", timer_sec)
        
        if timer_sec >= 2.0 {
            timer_sec = 0
            slideViewNumber += 1
            slideViewName = getViewName(slideViewNumber)
            slideView.image = UIImage(named: slideViewName)
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        //ReceiveViewから戻るボタン押したときに呼ばれる
        slideViewName = getViewName(slideViewNumber)
        slideView.image = UIImage(named: slideViewName)
    }

    @IBAction func fowardButton(_ sender: Any) {
        slideViewNumber += 1
        slideViewName = getViewName(slideViewNumber)
        slideView.image = UIImage(named: slideViewName)
    }
        
    @IBAction func backButton(_ sender: Any) {
        slideViewNumber -= 1
        slideViewName = getViewName(slideViewNumber)
        slideView.image = UIImage(named: slideViewName)
    }

    @IBAction func pauseTimerButton(_ sender: Any) {

        if self.timer == nil{
            //pauseTimerButtonでタイマー作成、始動
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            //ボタン無効化
            pauseButton.setTitle("停止", for: .normal)
            backButton.isEnabled = false
            forwardButton.isEnabled = false
        }
        else{
            self.timer.invalidate()
            self.timer_sec = 0
            self.timer = nil
            //ボタン有効化
            pauseButton.setTitle("開始", for: .normal)
            backButton.isEnabled = true
            forwardButton.isEnabled = true
        }
    }
    
    func getViewName(_ number:Int) -> String {
        var num = 0
        if number > 4{
            num = 0
            //先頭に戻す
            slideViewNumber = 0
        }
        else if number < 0{
            num = 4
            slideViewNumber = 4
        }
        else{
            num = number
        }
        print("number =  \(number)")
        return imageNameArray[num]
    }
    
}

