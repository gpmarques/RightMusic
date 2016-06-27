//
//  MusicViewController.swift
//  RightMusic2
//
//  Created by Gabriel Bendia on 6/26/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController, UIScrollViewDelegate {

    var musicView: MusicView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        musicView = MusicView(view: view, parent: self)
        
        musicView.scrollView.delegate = self
        musicView.scrollView.minimumZoomScale = 1.0
        musicView.scrollView.maximumZoomScale = 4.0
//        musicView.scrollView.zoomScale = 1.0
        
        setupGestureRecognizer()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return musicView.zoomingView
    }
    
    func setupGestureRecognizer() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(MusicViewController.handleDoubleTap(_:)))
        doubleTap.numberOfTapsRequired = 2
        musicView.scrollView.addGestureRecognizer(doubleTap)
    }
    
    func handleDoubleTap(recognizer: UITapGestureRecognizer) {
        
        if (musicView.scrollView.zoomScale > musicView.scrollView.minimumZoomScale) {
            musicView.scrollView.setZoomScale(musicView.scrollView.minimumZoomScale, animated: true)
        } else {
            musicView.scrollView.setZoomScale(musicView.scrollView.maximumZoomScale, animated: true)
        }
    }

}
