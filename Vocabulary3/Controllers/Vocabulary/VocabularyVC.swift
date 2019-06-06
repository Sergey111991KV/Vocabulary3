//
//  VocabularyVC.swift
//  Vocabulary3
//
//  Created by Сергей Косилов on 31/05/2019.
//  Copyright © 2019 Сергей Косилов. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class VocabularyVC: UIViewController {

  var vocabulary = [Vocabulary]()
    
  lazy var vocabularyAdd = vocabulary.count + 1
    
    
    @IBOutlet weak var vocabularyCollView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vocabularyCollView.delegate = self
        vocabularyCollView.dataSource = self

    }
    

 

}

extension VocabularyVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return  vocabularyAdd
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = vocabularyCollView.dequeueReusableCell(withReuseIdentifier: "VocabularyCell", for: indexPath) as? VocabularyCollCell else{ return UICollectionViewCell()}
        
        if indexPath.count == vocabulary.count{
            cell.learningLanguage.text = vocabulary[indexPath.count].learningV
            cell.nativeLanguage.text = vocabulary[indexPath.count].nativeV
         
        } else{
            
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VocabularyCell", for: indexPath) as? VocabularyCollCell
        if indexPath.count == vocabulary.count{
            self.performSegue(withIdentifier: "DetailVocabulary", sender: cell)
        } else{
            self.performSegue(withIdentifier: "AddVocabulary", sender: cell)
        }
    }
    
    
}
