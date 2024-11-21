//
//  ViewController.swift
//  FavoriteGames
//
//  Created by Zholbarys on 21.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let games: [VideoGame] = [
        VideoGame(title: "The Legend of Zelda: Breath of the Wild", platform: "Nintendo Switch", releaseYear: 2017, coverImageName: "zelda_botw"),
        VideoGame(title: "Red Dead Redemption 2", platform: "PS4/Xbox One", releaseYear: 2018, coverImageName: "rdr2"),
        VideoGame(title: "God of War", platform: "PS4", releaseYear: 2018, coverImageName: "god_of_war"),
        VideoGame(title: "Super Mario Odyssey", platform: "Nintendo Switch", releaseYear: 2017, coverImageName: "mario_odyssey"),
        VideoGame(title: "The Last of Us Part II", platform: "PS4", releaseYear: 2020, coverImageName: "last_of_us_2"),
        VideoGame(title: "Cyberpunk 2077", platform: "PS4/Xbox One/PC", releaseYear: 2020, coverImageName: "cyberpunk"),
        VideoGame(title: "Ghost of Tsushima", platform: "PS4", releaseYear: 2020, coverImageName: "ghost_tsushima"),
        VideoGame(title: "Hades", platform: "Nintendo Switch/PC", releaseYear: 2020, coverImageName: "hades"),
        VideoGame(title: "Final Fantasy VII Remake", platform: "PS4", releaseYear: 2020, coverImageName: "ff7_remake"),
        VideoGame(title: "Animal Crossing: New Horizons", platform: "Nintendo Switch", releaseYear: 2020, coverImageName: "animal_crossing")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        title = "Favorite Games"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "GameTableViewCell", bundle: nil), forCellReuseIdentifier: "GameTableViewCell")
        tableView.rowHeight = 100
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameTableViewCell", for: indexPath) as! GameTableViewCell
        let game = games[indexPath.row]
        cell.configure(with: game)
        return cell
    }
}
