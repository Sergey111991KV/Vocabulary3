//
//  DictionaryVC.swift
//  Vocabulary2
//
//  Created by Сергей Косилов on 21/05/2019.
//  Copyright © 2019 Сергей Косилов. All rights reserved.
//

import UIKit

class DictionaryVC: UIViewController {

    var dictionary = [Dictionary]()
    
    @IBOutlet weak var dictionaryCollection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dictionaryCollection.delegate = self
        dictionaryCollection.dataSource = self
    }
}

extension DictionaryVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let dictionaryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DictionaryCell", for: indexPath) as? DictionaryCell{
            return dictionaryCell
        }
        return UICollectionViewCell()
    }
    
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return dictionary.count + 1
    }
    
    
    
}

