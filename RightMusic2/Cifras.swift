//
//  Cifras.swift
//  RightMusic2
//
//  Created by Gabriel Bendia on 6/23/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import Foundation

//
//  PegandoCifras.swift
//  Popular_Firebase_RightMusic
//
//  Created by Gabriel Bendia on 6/9/16.
//  Copyright © 2016 Gabriel Bendia. All rights reserved.
//

import Foundation

var tom = ""
var letra = ""
var cifra = ""

func pegaCifraMusica (link: String) {
    
    // Pegando Link da musica atraves do nome
    //
    //    var linkMusica = link
    //
    //    linkMusica = linkMusica.stringByFoldingWithOptions(NSStringCompareOptions.DiacriticInsensitiveSearch, locale: NSLocale.currentLocale())
    //    linkMusica = linkMusica.stringByReplacingOccurrencesOfString("(", withString: "")
    //    linkMusica = linkMusica.stringByReplacingOccurrencesOfString(")", withString: "")
    //    linkMusica = linkMusica.stringByReplacingOccurrencesOfString("/", withString: "-")
    //    linkMusica = linkMusica.stringByReplacingOccurrencesOfString(".", withString: "")
    //    linkMusica = linkMusica.stringByReplacingOccurrencesOfString("'", withString: "")
    //    linkMusica = linkMusica.stringByReplacingOccurrencesOfString(",", withString: "")
    //    linkMusica = linkMusica.stringByReplacingOccurrencesOfString("& ", withString: "")
    //    linkMusica = linkMusica.stringByReplacingOccurrencesOfString("!", withString: "")
    //    linkMusica = linkMusica.stringByReplacingOccurrencesOfString("?", withString: "")
    //    linkMusica = linkMusica.stringByReplacingOccurrencesOfString("´", withString: "")
    //    linkMusica = linkMusica.stringByReplacingOccurrencesOfString("º", withString: "o")
    //    linkMusica = linkMusica.stringByReplacingOccurrencesOfString("+", withString: "")
    //    linkMusica = linkMusica.stringByReplacingOccurrencesOfString("%", withString: "")
    //    linkMusica = linkMusica.stringByReplacingOccurrencesOfString("’", withString: "")
    //    if linkMusica.rangeOfString("-") != nil {
    //        linkMusica = linkMusica.stringByReplacingOccurrencesOfString(" ", withString: "")
    //    } else {
    //        linkMusica = linkMusica.stringByReplacingOccurrencesOfString(" ", withString: "-")
    //    }
    
    let urlMusica: NSURL = NSURL(string: link)!
    //    print(urlMusica)
    var contentsMusica: NSString = ""
    do {
        contentsMusica = try NSString(contentsOfURL: urlMusica, usedEncoding: nil)
    } catch {
        print("\n\nERRO\n\n")
    }
    
    // Retirar o que não preciso:
    
    contentsMusica = contentsMusica.stringByReplacingOccurrencesOfString("</span><span id=\"cifra_afi\"></span><span id=\"cifra_capo\"></span><pre>", withString: "") // agora a separação do tom pro resto é o </a>
    contentsMusica = contentsMusica.stringByReplacingOccurrencesOfString("<span class=\"tablatura\">", withString: "")
    contentsMusica = contentsMusica.stringByReplacingOccurrencesOfString("<span class=\"cnt\">", withString: "")
    contentsMusica = contentsMusica.stringByReplacingOccurrencesOfString("</span></span>", withString: "")
    
    var linhas = contentsMusica.componentsSeparatedByString("\n")
    
    // Tratar o Tom
    
    linhas[20] = linhas[20].stringByReplacingOccurrencesOfString("Tom:                     ", withString: "")
    linhas[20] = linhas[20].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    
    var separandoTom = linhas[20].componentsSeparatedByString("</a>")
    tom = separandoTom[0]
    //    print(tom)
    
    if separandoTom[1].rangeOfString("<b>") != nil {
        
        letra += "\n"
        separandoTom[1] = separandoTom[1].stringByReplacingOccurrencesOfString("<b>", withString: "")
        separandoTom[1] = separandoTom[1].stringByReplacingOccurrencesOfString("</b>", withString: "")
        separandoTom[1] = separandoTom[1].stringByReplacingOccurrencesOfString("</a>", withString: "")
        cifra += separandoTom[1] + "\n"
        
    } else {
        
        letra += separandoTom[1] + "\n"
        cifra += "\n"
        
    }
    
    for i in 21...linhas.count-1 {
        
        if linhas[i].rangeOfString("</pre></div><!-- /CIFRA --></div></div>") != nil {
            var separaUltimaLinha = linhas[i].componentsSeparatedByString("</pre></div><!-- /CIFRA --></div></div>")
            
            if separaUltimaLinha[0].rangeOfString("<b>") != nil {
                
                letra += "\n"
                separaUltimaLinha[0] = separaUltimaLinha[0].stringByReplacingOccurrencesOfString("<b>", withString: "")
                separaUltimaLinha[0] = separaUltimaLinha[0].stringByReplacingOccurrencesOfString("</b>", withString: "")
                cifra += separaUltimaLinha[0] + "\n"
                
            } else {
                
                letra += separaUltimaLinha[0] + "\n"
                cifra += "\n"
                
            }
            
            break
            
        } else {
            
            if linhas[i].rangeOfString("<b>") != nil {
                
                letra += "\n"
                linhas[i] = linhas[i].stringByReplacingOccurrencesOfString("<b>", withString: "")
                linhas[i] = linhas[i].stringByReplacingOccurrencesOfString("</b>", withString: "")
                cifra += linhas[i] + "\n"
                
            } else {
                
                if linhas[i] == "Refrão:" {
                    
                    linhas[i] = "Chorus:"
                    letra += linhas[i] + "\n"
                    cifra += "\n"
                    
                } else {
                    
                    letra += linhas[i] + "\n"
                    cifra += "\n"
                    
                }
                
            }
        }
    }
}

