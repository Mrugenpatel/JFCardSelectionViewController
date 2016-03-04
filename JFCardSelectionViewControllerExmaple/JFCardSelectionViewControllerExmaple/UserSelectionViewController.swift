//
//  ViewController.swift
//  JFCardSelectionViewControllerExmaple
//
//  Created by Jeremy Fox on 3/1/16.
//  Copyright © 2016 Jeremy Fox. All rights reserved.
//

import UIKit
import JFCardSelectionViewController

class UserSelectionViewController: JFCardSelectionViewController {
    
    let cards = [
        User(name: "John Smith", photoURL: "https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Smith", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Smith", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Smith", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar Smith", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven Smith", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Smith", photoURL: "http://zblogged.com/wp-content/uploads/2015/11/5.png", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345)
    ]
    
    override func viewDidLoad() {
//        backgroundImage = UIImage(named: "bg")
        dataSource = self
        selectionAnimationStyle = .Slide
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let image = UIImage()
        let navBar = navigationController?.navigationBar
        navBar?.setBackgroundImage(image, forBarMetrics: .Default)
        navBar?.shadowImage = image
        reloadData()
    }
}

extension UserSelectionViewController: JFCardSelectionViewControllerDataSource {
    
    func numberOfCardsForCardSelectionViewController(cardSelectionViewController: JFCardSelectionViewController) -> Int {
        return cards.count
    }
    
    func cardSelectionViewController(cardSelectionViewController: JFCardSelectionViewController, cardForItemAtIndexPath indexPath: NSIndexPath) -> CardPresentable {
        return cards[indexPath.row]
    }
    
}


//----------------


struct User {
    var name: String
    var photoURL: String
    var address: String
    var city: String
    var state: String
    var zip: Int
}

extension User: CardPresentable {
    
    var imageURLString: String {
        return photoURL
    }
    
    var placeholderImage: UIImage? {
        return UIImage(named: "default")
    }
    
    var titleText: String {
        return name
    }
    
    var detailText: String {
        return "\(address) \n\(city), \(state) \(zip)"
    }
    
    var actionOne: CardAction? {
        return CardAction(title: "Call") {
            print("Call Action Fired!")
        }
    }
    
    var actionTwo: CardAction? {
        return CardAction(title: "Email") {
            print("Email Action Fired!")
        }
    }
    
}

