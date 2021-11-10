//
//  ViewController.swift
//  PersistenceTest
//
//  Created by Baffoe, Joseph - FUT on 11/9/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource
{
    var reds: [CGFloat] = [0.9]
    var blues: [CGFloat] = [0.4]
    var greens: [CGFloat] = [0.1]

    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return reds.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.contentView.backgroundColor = UIColor(displayP3Red: reds[indexPath.row], green: greens[indexPath.row], blue: blues[indexPath.row], alpha: 1)
        
        return cell
        
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        
        let defaults = UserDefaults.standard
        if let storedReds = defaults.array(forKey: "ArrayOfReds"),let storedGreens = defaults.array(forKey:
        "ArrayOfGreens"),let storedBlues = defaults.array(forKey: "ArrayOfBlues")
        {
            reds = storedReds as! [CGFloat]
        greens = storedGreens as! [CGFloat]
        blues = storedBlues as! [CGFloat]
        
        }
    }


    @IBAction func addButton(_ sender: Any)
    {
        reds.append(CGFloat.random(in: 0...1))
        greens.append(CGFloat.random(in: 0...1))
        blues.append(CGFloat.random(in: 0...1))
        
        collectionView.reloadData()
                      
    }
    
    
    @IBAction func saveButton(_ sender: Any)
    {
        let defaults = UserDefaults.standard
        defaults.set(reds, forKey: "ArrayOfReds")
        defaults.set(greens, forKey: "ArrayOfGreens")
        defaults.set(blues, forKey: "ArrayOfBlues")
        
        
    }
    


}
