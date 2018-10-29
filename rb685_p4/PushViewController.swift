//
//  PushViewController.swift
//  rb685_p4
//
//  Created by Trey Burrell on 10/28/18.
//  Copyright © 2018 Trey. All rights reserved.
//

import UIKit

class PushViewController: UIViewController {
    var Save: UIButton!
    var songName: UITextField!
    var albumName: UITextField!
    var artistName: UITextField!
    var changeSong: Song?
    weak var delegate: ChangeButtonTitleDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        songName = UITextField()
        songName.translatesAutoresizingMaskIntoConstraints = false
        songName.placeholder = "Change the Song Name"
        songName.borderStyle = .roundedRect
        songName.backgroundColor = .white
        songName.textAlignment = .center
        view.addSubview(songName)
        
        albumName = UITextField()
        albumName.translatesAutoresizingMaskIntoConstraints = false
        albumName.placeholder = "Change the Album Name"
        albumName.borderStyle = .roundedRect
        albumName.backgroundColor = .white
        albumName.textAlignment = .center
        view.addSubview(albumName)
        
        artistName = UITextField()
        artistName.translatesAutoresizingMaskIntoConstraints = false
        artistName.placeholder = "Change the Artist Name"
        artistName.borderStyle = .roundedRect
        artistName.backgroundColor = .white
        artistName.textAlignment = .center
        view.addSubview(artistName)
        
        
        let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(dismissViewandSave))
        self.navigationItem.rightBarButtonItem = saveButton
        
        setupConstraints()
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            songName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            songName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            songName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            songName.heightAnchor.constraint(equalToConstant: 24)
            ])
        
        NSLayoutConstraint.activate([
            albumName.topAnchor.constraint(equalTo: songName.bottomAnchor, constant: 10),
            albumName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            albumName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            albumName.heightAnchor.constraint(equalToConstant: 24)
            ])
        
        NSLayoutConstraint.activate([
            artistName.topAnchor.constraint(equalTo: albumName.bottomAnchor, constant: 10),
            artistName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            artistName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            artistName.heightAnchor.constraint(equalToConstant: 24)
            ])
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissViewandSave() {
        if let songText = songName.text, songText != "" {
            changeSong?.name = songText
        }
        
        
        if let albumText = albumName.text, albumText != "" {
            changeSong?.album = albumText
        }
        
        
        if let artistText = artistName.text, artistText != "" {
            changeSong?.artist = artistText
        }
        delegate?.songHasChanged()
        navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
