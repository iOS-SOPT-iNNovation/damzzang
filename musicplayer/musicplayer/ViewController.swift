//
//  ViewController.swift
//  musicplayer
//
//  Created by 최은지 on 09/05/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSongs()
        
        
        table.delegate = self
        table.dataSource = self
        
    }
    
    func configureSongs(){
        
        // sample data
        songs.append(Song(name: "song1", albumName: "album1", artitstName: "singer1", imageName: "cover1", trackName: "sample1"))
        songs.append(Song(name: "song2", albumName: "album2", artitstName: "singer2", imageName: "cover2", trackName: "sample2"))
        songs.append(Song(name: "song3", albumName: "album3", artitstName: "singer3", imageName: "cover3", trackName: "sample3"))
        songs.append(Song(name: "song1", albumName: "album1", artitstName: "singer1", imageName: "cover1", trackName: "sample1"))
        songs.append(Song(name: "song2", albumName: "album2", artitstName: "singer2", imageName: "cover2", trackName: "sample2"))
        songs.append(Song(name: "song3", albumName: "album3", artitstName: "singer3", imageName: "cover3", trackName: "sample3"))
        songs.append(Song(name: "song1", albumName: "album1", artitstName: "singer1", imageName: "cover1", trackName: "sample1"))
        songs.append(Song(name: "song2", albumName: "album2", artitstName: "singer2", imageName: "cover2", trackName: "sample2"))
        songs.append(Song(name: "song3", albumName: "album3", artitstName: "singer3", imageName: "cover3", trackName: "sample3"))
    }
    
    
    
    // table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        // present the player
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else { return }
         
        vc.songs = songs
        vc.position = position
        
        present(vc, animated: true)
        
    }


}


struct Song {
    let name: String
    let albumName: String
    let artitstName: String
    let imageName: String
    let trackName: String
}

