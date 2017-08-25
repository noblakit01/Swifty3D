//
//  DemoCollectionViewController.swift
//  Swifty3dCell
//
//  Created by luan on 8/25/17.
//
//

import UIKit

class DemoCollectionViewController: UIViewController {
    
    var imageNames = [
        "dog-1",
        "dog-2",
        "dog-3",
        "dog-4",
        "dog-5",
        ]
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = view.bounds.width - layout.minimumLineSpacing * 4
            layout.itemSize = CGSize(width: width / 3, height: width / 3)
        }
    }
}

extension DemoCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DemoCollectionCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.row])
        return cell
    }
}

class DemoCollectionCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
}
