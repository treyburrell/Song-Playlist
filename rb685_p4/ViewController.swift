//
//  ViewController.swift
//  rb685_p4
//
//  Created by Trey Burrell on 10/28/18.
//  Copyright © 2018 Trey. All rights reserved.
//

import UIKit
protocol ChangeButtonTitleDelegate: class {
    func songHasChanged()
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ChangeButtonTitleDelegate {
    func songHasChanged() {
        tableView.reloadData()
    }
    
    
    var tableView: UITableView!
    var songs: [Song]!
    
    let reuseIdentifier = "songCellReuse"
    let cellHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Songs"
        view.backgroundColor = .black
        
        
        let lastMemory = Song(name: "Last Memory", artist: "Takeoff", album: "Last Memory - Single", image: #imageLiteral(resourceName: "lastMemory.jpg"))
        let yoppa = Song(name: "Yoppa", artist: "Li Mosey", album: "Northsbest", image: #imageLiteral(resourceName: "yoppa.png"))
        let doYouUnderstand = Song(name: "Do You Understand?", artist: "Shy Glizzy", album: "Fully Loaded", image: #imageLiteral(resourceName: "doYouUnderstand"))
        let iAm = Song(name: "I Am", artist: "Lil Baby & Gunna", album: "Drip Harder", image: #imageLiteral(resourceName: "iAm.jpg"))
        let moneyLong = Song(name: "Money Long", artist: "Kevin Gates", album: "Luca Brasi 3", image: #imageLiteral(resourceName: "moneyLong"))
        let unfair = Song(name: "Unfair", artist: "6LACK", album: "East Antlanta Lover Letter", image: #imageLiteral(resourceName: "unfair"))
        let nav = Song(name: "NAV", artist: "NAV", album: "NAV", image: #imageLiteral(resourceName: "nav.jpg"))
        let bigLie = Song(name: "Big Lie", artist: "Post Malone", album: "Stoney", image: #imageLiteral(resourceName: "bigLie.jpg"))
        let drowning = Song(name: "Drowning", artist: "A Boogie wit da Hoodie", album: "The Bigger Artist", image:#imageLiteral(resourceName: "drowning"))
        let marmalade = Song(name: "Marmalade", artist: "Mac Miller", album: "GEMINI", image: #imageLiteral(resourceName: "marmalade"))
        songs = [lastMemory, yoppa, doYouUnderstand, iAm, moneyLong, unfair, nav, bigLie, drowning, marmalade]
        
        
        tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        // Setup the constraints for our views
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableViewCell
        let song = songs[indexPath.row]
        cell.configure(for: song)
        cell.setNeedsUpdateConstraints()
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song = songs[indexPath.row]
        let songController = PushViewController()
        songController.changeSong = song
        songController.delegate = self
        navigationController?.pushViewController(songController, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

