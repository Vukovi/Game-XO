//
//  ViewController.swift
//  IksOks
//
//  Created by Vuk on 6/25/16.
//  Copyright © 2016 User. All rights reserved.////
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        prikazPobednika.isHidden = true
    }

    var igracIks = true
    var pritisnutaPolja = [Int]()//probao sam da ga drzim unutar f-je ali onda nije punio niz vec ga je uvek iznova stvarao puneći ga sa samo trenutno kliknutom vrednošću taga
    var nizIgracaIks = [Int]()
    var nizIgracaOks = [Int]()
    let pobednickiNizovi = [
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [1,4,7],
        [2,5,8],
        [3,6,9],
        [1,5,9],
        [3,5,7]
    ]
    var pobednik: String?

    @IBAction func dugmeIksOks(_ sender: UIButton) {
        let iks = UIImage(named: "iks.png")
        let oks = UIImage(named: "oks.png")
        
        if pobednik == nil {
            if pritisnutaPolja.contains(sender.tag) == false {
                if igracIks {
                    sender.setImage(iks, for: UIControlState())
                    igracIks = false
                    pritisnutaPolja.append(sender.tag)
                    nizIgracaIks.append(sender.tag)
                }
                else{
                    sender.setImage(oks, for: UIControlState())
                    igracIks = true
                    pritisnutaPolja.append(sender.tag)
                    nizIgracaOks.append(sender.tag)
                }
            }
            //pritisnutaPolja.append(sender.tag)               ovo radi, ali ako bih ovaj red stavio iznad if uslova ne bih blokirao menjanje iksa u oks (i obrnuto) i ne bih imao mogućnost da se pojave iks ili oks posle kliktanja, jer zbog proceduralnosti čitanja redova programa, prvo se dopuni niz a onda je ovaj if uslov uvek true, tako da je najsigurnije postaviti ovaj red unutar if uslova kako je i urađeno
            for i in 0...pobednickiNizovi.count - 1{
                if nizIgracaIks.contains(pobednickiNizovi[i][0]) && nizIgracaIks.contains(pobednickiNizovi[i][1]) && nizIgracaIks.contains(pobednickiNizovi[i][2]){
                    pobednik = "Pobednik je IKS"
                    prikazPobednika.text = pobednik
                    krajIgre()
                }
                if nizIgracaOks.contains(pobednickiNizovi[i][0]) && nizIgracaOks.contains(pobednickiNizovi[i][1]) && nizIgracaOks.contains(pobednickiNizovi[i][2]){
                    pobednik = "Pobednik je OKS"
                    prikazPobednika.text = pobednik
                    krajIgre()
                }
            }
        }
    }
    
    @IBAction func novaIgra(_ sender: AnyObject) {
        pritisnutaPolja = []
        nizIgracaIks = []
        nizIgracaOks = []
        pobednik = nil
        igracIks = true
        prikazPobednika.isHidden = true
        var tagovanoDugme: UIButton
        for i in 1...9 {
            tagovanoDugme = view.viewWithTag(i) as! UIButton
            tagovanoDugme.setImage(nil, for: UIControlState())
        }
    }
    
    @IBOutlet weak var prikazPobednika: UILabel!
    
    func krajIgre() {
        prikazPobednika.isHidden = false
    }
    
  /*  override func viewDidLayoutSubviews() {
        prikazPobednika.frame = CGRectMake(20, 321, 0, 0)
    }
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(3) { 
            self.prikazPobednika.frame = CGRectMake(20, 321, 335, 93)
        }
    } */
}

