//
//  TableViewCell.swift
//  rb685_p4
//
//  Created by Trey Burrell on 10/28/18.
//  Copyright © 2018 Trey. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var nameLabel: UILabel!
    var artistLabel: UILabel!
    var albumLabel: UILabel!
    var photoImageView: UIImageView!
    
    let padding: CGFloat = 10
    let labelHeight: CGFloat = 16
    let photoImageWidth: CGFloat = 30
    let photoImageHeight: CGFloat = 30
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        
        artistLabel = UILabel()
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.font = UIFont.systemFont(ofSize: 12)
        
        albumLabel = UILabel()
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.font = UIFont.systemFont(ofSize: 12)
        
        photoImageView = UIImageView()
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(artistLabel)
        contentView.addSubview(albumLabel)
        contentView.addSubview(photoImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            artistLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            artistLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            artistLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            albumLabel.leadingAnchor.constraint(equalTo: artistLabel.trailingAnchor, constant: padding),
            albumLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            albumLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: padding * -1),
            photoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: photoImageHeight),
            photoImageView.widthAnchor.constraint(equalToConstant: photoImageWidth)
            ])
        super.updateConstraints()
    }
    
    func configure(for song: Song) {
        nameLabel.text = song.name
        artistLabel.text = song.artist
        albumLabel.text = song.album
        photoImageView.image = song.image
        contentView.addSubview(photoImageView)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
