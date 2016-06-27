//
//  MusicView.swift
//  RightMusic2
//
//  Created by Gabriel Bendia on 6/26/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit

class MusicView: UIView {
    
    var musicTitle: UILabel!
    var artistName: UILabel!
    var tone: UILabel!
    var toneLabel: UILabel!
    var lyrics: UITextView!
    var chords: UITextView!
    var scrollView: UIScrollView!
    var scrollView2: UIScrollView!
    var zoomingView: UIView!
    
    init(view: UIView, parent: MusicViewController) {
        super.init(frame: view.frame)
        
        // MARK: Background
        
        view.backgroundColor = dark
        
        // MARK: musicTitle Label
        
        musicTitle = UILabel(frame: CGRectMake(view.frame.width*0.0724658, view.frame.height*0.0407609, view.frame.width-view.frame.width*0.0724638, view.frame.height*0.0869565))
        musicTitle.text = "Big Me"
        musicTitle.font = UIFont(name: (musicTitle?.font?.fontName)!, size: 20)
        musicTitle.textColor = UIColor.whiteColor()
        
        // MARK: artistName Label
        
        artistName = UILabel(frame: CGRectMake(view.frame.width*0.0724638, view.frame.height*0.0951087, view.frame.width-view.frame.width*0.0724658, view.frame.height*0.0724638))
        artistName.text = "Foo Fighters"
        artistName.font = UIFont(name: (musicTitle?.font?.fontName)!, size: 16)
        artistName.textColor = UIColor.whiteColor()
        
        // MARK: tone Label
        
        tone = UILabel(frame: CGRectMake(view.frame.width*0.0724638, view.frame.height*0.169837, view.frame.width, view.frame.height*0.0724638))
        tone.text = "Tone:"
        // Mudar fonte
        tone.font = UIFont(name: (musicTitle?.font?.fontName)!, size: 16)
        tone.textColor = UIColor.whiteColor()
        
        // MARK: toneLabel Label
        
        toneLabel = UILabel(frame: CGRectMake(view.frame.width*0.217391, view.frame.height*0.169837, view.frame.width, view.frame.height*0.0724638))
        toneLabel.text = "C"
        // Mudar fonte
        toneLabel.font = UIFont(name: (musicTitle?.font?.fontName)!, size: 16)
        toneLabel.textColor = red
        
        // MARK: lyrics Text View
        
        pegaCifraMusica("https://www.cifraclub.com.br/foo-fighters/big-me/")
        
        // Calculando tamanho das Text Views
        
        let lines = letra.componentsSeparatedByString("\n")
        
        lyrics = UITextView(frame: CGRectMake(view.frame.width*0.0483092, view.frame.height*0.244565, view.frame.width-view.frame.width*0.0483092, 16*CGFloat(lines.count) + view.frame.height*0.0951087))
        lyrics.font = UIFont(name: "Courier", size: 14)
        lyrics.text = letra
        lyrics.textColor = UIColor.whiteColor()
        lyrics.backgroundColor = UIColor.clearColor()
        lyrics.editable = false
        lyrics.selectable = false
        lyrics.textAlignment = NSTextAlignment.Left
        
        // MARK: chords Text View
        
        chords = UITextView(frame: CGRectMake(view.frame.width*0.0483092, view.frame.height*0.244565, view.frame.width-view.frame.width*0.0483092, 16*CGFloat(lines.count) + view.frame.height*0.0951087))
        chords.font = UIFont(name: "Courier-Bold", size: 14)
        chords.text = cifra
        chords.textColor = red
        chords.backgroundColor = UIColor.clearColor()
        chords.editable = false
        chords.selectable = false
        chords.textAlignment = NSTextAlignment.Left
        
        // MARK: Scroll View
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.contentSize = self.lyrics.bounds.size
        scrollView.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        // MARK: View Scrolling
        
        scrollView2 = UIScrollView(frame: view.bounds)
        scrollView2.backgroundColor = UIColor.clearColor()
        scrollView2.contentSize = self.lyrics.bounds.size
        scrollView2.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        // MARK: Zooming View
        
        zoomingView = UIView(frame: scrollView.bounds)
        zoomingView.backgroundColor = UIColor.clearColor()
        
        // MARK: AddSubviews
        
//        view.addSubview(musicTitle)
//        view.addSubview(artistName)
//        view.addSubview(tone)
//        view.addSubview(toneLabel)
//        view.addSubview(lyrics)
//        view.addSubview(chords)
        
        // Ajeitar as views por causa do zoom bugado
        
        view.addSubview(scrollView)
        scrollView2.addSubview(musicTitle)
        scrollView2.addSubview(artistName)
        scrollView2.addSubview(tone)
        scrollView2.addSubview(toneLabel)
        scrollView2.addSubview(lyrics)
        scrollView2.addSubview(chords)
        scrollView2.addSubview(chords)
        zoomingView.addSubview(scrollView2)
        scrollView.addSubview(zoomingView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
