//
//  MovieDetailsViewController.swift
//  Tipster
//
//  Created by Chen Hanrui on 2022/2/24.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController{
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    @IBAction func didMoview(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "firstSegue", sender: nil)
    }
    
    
    //dictionary
    var movie: [String:Any]!   //swift optional: !
    var image = UIImage(named: "estonia")

    override func viewDidLoad() {
        super.viewDidLoad()


        posterView.clipsToBounds = false
        posterView.layer.masksToBounds = false
        posterView.layer.shadowColor = UIColor.white.cgColor
        posterView.layer.shadowOffset = CGSize(width: 3, height: 3)
        posterView.layer.shadowOpacity = 0.7
        posterView.layer.shadowRadius = 4.0
        //posterView.layer.borderColor = UIColor.white.cgColor
        //posterView.layer.cornerRadius = 5.0
        //posterView.layer.borderWidth = 3
        posterView.contentMode = .scaleAspectFill
        posterView.image = image
//
        // Do any additional setup after loading the view.
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        posterView.af.setImage(withURL: posterUrl!)
        

        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        
        backdropView.af.setImage(withURL: backdropUrl!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let WebViewController = segue.destination as! WebViewController
        
        let idnum = self.movie["id"] as! NSNumber
        WebViewController.id = idnum.stringValue
        //WebViewController.url = "https://image.tmdb.org/t/p/w185"
    }

}
