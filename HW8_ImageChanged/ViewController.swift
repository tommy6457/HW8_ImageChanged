//
//  ViewController.swift
//  HW8_ImageChanged
//
//  Created by 蔡尚諺 on 2021/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var scSegmented: UISegmentedControl!
    @IBOutlet weak var pcPage: UIPageControl!
    @IBOutlet weak var lbPage: UILabel!

    
    //裝圖片
    var images = [UIImage]()
    //裝說明
    var names = [String]()
    //記住現在顯示的index
    var indexShow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showInit()
    }
    
    //SegmentedControl 處理
    @IBAction func segmentedValueChanged(_ segmented: UISegmentedControl) {
        indexShow = segmented.selectedSegmentIndex
        syncPage(index: indexShow)
    }
    
    //Button點擊處理
    @IBAction func clickNext(_ sender: UIButton) {
        changedPageBackNext(status: true)
    }
    
    //Button點擊處理
    @IBAction func clickBack(_ sender: UIButton) {
        
        changedPageBackNext(status: false)
    }
    
    //PageControl點擊處理
    @IBAction func pageValueChanged(_ page: UIPageControl) {
        
        indexShow = page.currentPage
        syncPage(index: indexShow)
    }
    
    //往右滑
    @IBAction func swipeRight(_ swipe: UISwipeGestureRecognizer) {
        changedPageBackNext(status: false)
    }
    
    //往左滑
    @IBAction func swipeLeft(_ swipe: UISwipeGestureRecognizer) {
        changedPageBackNext(status: true)
    }
    
    //長壓
    @IBAction func longPress(_ longPress: UILongPressGestureRecognizer) {
        
        if longPress.state == .ended {
            indexShow = Int.random(in: 0...2)
            syncPage(index: indexShow)
        }
        
    }
    
    //同步處理換頁
    func syncPage(index: Int) {
        ivImage.image = images[index]
        lbName.text = names[index]
        scSegmented.selectedSegmentIndex = index
        pcPage.currentPage = index
        lbPage.text = "\(index + 1) / 3"
    }
    
    //進來頁面初始化值
    func showInit() {
        
        //準備資料
        images.append(UIImage(named: "teemo-1")!)
        images.append(UIImage(named: "teemo-2")!)
        images.append(UIImage(named: "teemo-3")!)
        names.append("約德爾人的一大步")
        names.append("萬聖小惡摩")
        names.append("蜂摩小太郎")
        
        //初始化相關outlet
        ivImage.image = images[0]
        lbName.text = names[0]
        lbPage.text = "1 / 3"
        
    }
    
    //處理下一頁或是上一頁 status: true(下一頁) false(上一頁)
    func changedPageBackNext(status: Bool) {
        
        if status {
            
            indexShow += 1
            
            if indexShow == 3 {
                indexShow = 0
            }
            
            syncPage(index: indexShow)
            
        }else{
            
            indexShow -= 1
            
            if indexShow == -1 {
                indexShow = 2
            }
            
            syncPage(index: indexShow)
            
        }
        
    }
    
    
    
}

