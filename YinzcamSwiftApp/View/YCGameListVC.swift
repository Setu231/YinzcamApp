//
//  YCGameListVC.swift
//  YinzcamSwiftApp
//
//  Created by Setu Desai on 2/7/24.
//

import UIKit

class YCGameListVC: UIViewController {
    
    var gameDetail: YZGameDetail?
        
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(YCScoreboardTVC.self, forCellReuseIdentifier: "YCScoreboardTVC")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.separatorStyle = .none
        getGameDetail()
    }
    
    private func getGameDetail() {
        NetworkManager.shared.apiCall { gameDetail in
            DispatchQueue.main.async {
                self.gameDetail = gameDetail
                self.tableView.reloadData()
            }
        }
    }
}

extension YCGameListVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gameDetail?.gameSection?.first?.game?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "YCScoreboardTVC", for: indexPath) as? YCScoreboardTVC,
              let gameDetail,
              let gameSection = gameDetail.gameSection,
              let gameList = gameSection.first,
              let game = gameList.game
        else { return UITableViewCell() }
        
        let eachGame = game[indexPath.row]
        
        if eachGame.typeValue == YZGameType.B.rawValue {
            cell.matchWeek.text = eachGame.scheduleHeader?.uppercased() ?? ""
        } else {
            let dictDate = eachGame.dateValue
            let matchDate = dictDate?.numeric
            
            let isHomeGame = eachGame.isHome ?? false
            cell.homeTeamName.text = isHomeGame ? gameDetail.team?.name : eachGame.opponent?.name
            cell.awayTeamName.text = isHomeGame ? eachGame.opponent?.name : gameDetail.team?.name
            
            if let matchDate {
                let dateFormatterGet = DateFormatter()
                dateFormatterGet.dateFormat = "yyyy-MM-dd"
                let dateFormatterPrint = DateFormatter()
                dateFormatterPrint.dateFormat = "EE, MMM d"
                
                if let date = dateFormatterGet.date(from: matchDate) {
                    cell.matchDate.text = dateFormatterPrint.string(from: date)
                } else if let time = dictDate?.time, let timestamp = dictDate?.timestamp {
                    let optionalTime = Date.timeChange24(date: matchDate, timeapm: time)
                    let oppTime = timestamp
                    let timeText = oppTime.suffix(1)
                    let abbTZ = Date.convertTimeZoneAbbrevation(wholeString: oppTime)
                    let arrDateTime = Date.timeZoneConverterZ(dateTimeString: optionalTime, abbString: timeText == "Z" ? "GMT" : abbTZ)
                    cell.matchDate.text = String(arrDateTime[0])
                }
            }
            
            cell.homeTeamScore.text = eachGame.homeScore ?? "0"
            cell.awayTeamScore.text = eachGame.awayScore ?? "0"
            cell.matchWeek.text = eachGame.week?.uppercased() ?? ""
            cell.matchStatus.text = eachGame.gameState
        }
        return cell
    }
}
