//
//  ViewController.swift
//  CoreDadaSample
//
//  Created by ミズキ on 2022/06/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let entity = CoreDataManager.shared.createEntity(title: "ｍizuki")
//        CoreDataManager.shared.
        let entities = CoreDataManager.shared.fetchEntities()
        print(entities)
    }


}

