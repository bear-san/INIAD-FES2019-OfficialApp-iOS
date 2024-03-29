//
//  IniadMapExpansionController.swift
//  INIADFES-2019
//
//  Created by Kentaro on 2019/10/24.
//  Copyright © 2019 Kentaro. All rights reserved.
//

import Foundation
import UIKit

class IniadMapExpansionViewController:UIViewController, UIScrollViewDelegate{
    @IBOutlet weak var baseView: UIView!
    var baseImage:UIImage!
    var imageView: UIImageView!
    var imageViewBase: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageViewBase = UIScrollView()
        self.imageViewBase.maximumZoomScale = 4.0
        self.imageViewBase.minimumZoomScale = 1.0
        self.imageViewBase.delegate = self
        self.imageViewBase.frame = self.view.frame
        self.imageViewBase.bounces = true
        self.baseView.addSubview(imageViewBase)
        
        self.imageView = UIImageView()
        self.imageView.image = self.baseImage
        self.imageView.backgroundColor = .white
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.frame = self.imageViewBase.frame
        
        self.imageViewBase.addSubview(self.imageView)
        
        let statusBarBackground = UIView(frame: CGRect(x: 0.0, y: 0.0,
          width: UIApplication.shared.statusBarFrame.size.width,
          height: UIApplication.shared.statusBarFrame.size.height))
        statusBarBackground.backgroundColor = UIColor.init(red: 19.0, green: 27.0, blue: 46.0, alpha: 1.0)
        
        self.view.addSubview(statusBarBackground)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}
