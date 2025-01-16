//
//  SearchViewController.swift
//  MyMovieAppNoftz
//
//  Created by EVANGELINE NOFTZ on 1/16/25.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //searchMovies()
    }
    
    
    func searchMovies(keywords: String) {
        let session = URLSession.shared

        let movieURL = URL(string: "http://www.omdbapi.com/?i=tt3896198&apikey=bf06009d")!
        
        let dataTask = session.dataTask(with: movieURL) { data, response, error in
            if let e = error {
                print("Error! \(e)")
            } else {
                if let d = data {
                    
                    if let jsonObj = try? JSONSerialization.jsonObject(with: d, options: .fragmentsAllowed) as! NSDictionary {
                        //print("working.")
                        print(jsonObj)
                        
                        /*if let theTitle = jsonObj.value(forKey: "Title") {
                            if let theYear = jsonObj.value(forKey: "Year") {
                                // happens on the main thread
                                DispatchQueue.main.async {
                                    self.releaseDateOutlet.text = "\(self.movieName) was released in \(theYear)"
                                }
                            }
                            
                        } else {
                            DispatchQueue.main.async {
                                self.releaseDateOutlet.text = "That movie does not exist!"
                            }
                            
                        }*/

                        
                    }
               
                }
            }
        }
        
        dataTask.resume()
    }
    
    
    @IBAction func submitSearchAction(_ sender: UIButton) {
        searchMovies(keywords: searchOutlet.text!)
    }
    
    
    

    

}
