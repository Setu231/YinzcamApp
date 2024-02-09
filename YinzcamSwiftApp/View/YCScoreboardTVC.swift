//
//  YCScoreboardTVC.swift
//  YinzcamSwiftApp
//
//  Created by Setu Desai on 2/8/24.
//

import UIKit

class YCScoreboardTVC: UITableViewCell {
    
    private(set) lazy var homeTeamName: UILabel = {
        let homeTeamName = UILabel()
        homeTeamName.font = UIFont.boldSystemFont(ofSize: 20.0)
        homeTeamName.textAlignment = .center
        homeTeamName.numberOfLines = 0
        return homeTeamName
    }()
    
    private(set) lazy var homeTeamScore: UILabel = {
        let homeTeamScore = UILabel()
        homeTeamScore.font = UIFont.systemFont(ofSize: 18.0)
        homeTeamScore.textAlignment = .center
        homeTeamScore.numberOfLines = 0
        return homeTeamScore
    }()
    
    private(set) lazy var matchDate: UILabel = {
        let matchDate = UILabel()
        matchDate.font = UIFont.systemFont(ofSize: 16.0)
        matchDate.textAlignment = .center
        matchDate.numberOfLines = 0
        return matchDate
    }()
    
    private(set) lazy var awayTeamName: UILabel = {
        let awayTeamName = UILabel()
        awayTeamName.font = UIFont.boldSystemFont(ofSize: 20.0)
        awayTeamName.textAlignment = .center
        awayTeamName.numberOfLines = 0
        return awayTeamName
    }()
    
    private(set) lazy var awayTeamScore: UILabel = {
        let awayTeamScore = UILabel()
        awayTeamScore.font = UIFont.systemFont(ofSize: 18.0)
        awayTeamScore.textAlignment = .center
        awayTeamScore.numberOfLines = 0
        return awayTeamScore
    }()
    
    private(set) lazy var matchStatus: UILabel = {
        let matchStatus = UILabel()
        matchStatus.font = UIFont.systemFont(ofSize: 16.0)
        matchStatus.textAlignment = .center
        matchStatus.numberOfLines = 0
        return matchStatus
    }()
    
    private(set) lazy var homeTeamStack: UIStackView = {
        let homeTeamStack = UIStackView()
        homeTeamStack.alignment = .fill
        homeTeamStack.axis = .vertical
        homeTeamStack.distribution = .fillEqually
        homeTeamStack.spacing = 5
        return homeTeamStack
    }()
    
    private(set) lazy var awayTeamStack: UIStackView = {
        let awayTeamStack = UIStackView()
        awayTeamStack.alignment = .fill
        awayTeamStack.axis = .vertical
        awayTeamStack.distribution = .fillEqually
        awayTeamStack.spacing = 5
        return awayTeamStack
    }()
    
    private(set) lazy var teamScoreStack: UIStackView = {
        let teamScoreStack = UIStackView()
        teamScoreStack.alignment = .center
        teamScoreStack.axis = .vertical
        teamScoreStack.distribution = .fillProportionally
        teamScoreStack.spacing = 5
        return teamScoreStack
    }()
    
    private(set) lazy var homeTeamImage: UIImageView = {
        let homeTeamImage = UIImageView()
        homeTeamImage.contentMode = .center
        return homeTeamImage
    }()
    
    private(set) lazy var awayTeamImage: UIImageView = {
        let awayTeamImage = UIImageView()
        awayTeamImage.contentMode = .center
        return awayTeamImage
    }()
    
    private(set) lazy var teamImageStack: UIStackView = {
        let teamImageStack = UIStackView()
        teamImageStack.alignment = .center
        teamImageStack.axis = .horizontal
        teamImageStack.distribution = .fillProportionally
        teamImageStack.spacing = 8
        return teamImageStack
    }()
    
    private(set) lazy var matchWeek: UILabel = {
        let matchWeek = UILabel()
        matchWeek.textAlignment = .center
        matchWeek.numberOfLines = 0
        return matchWeek
    }()
    
    private(set) lazy var cellViewStack: UIStackView = {
        let cellViewStack = UIStackView()
        cellViewStack.axis = .horizontal
        cellViewStack.alignment = .center
        cellViewStack.distribution = .fillEqually
        return cellViewStack
    }()
    
    func setupViews() {
        selectionStyle = .none
        contentView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        let curvedView = UIView()
        curvedView.backgroundColor = .white
        curvedView.layer.cornerRadius = 20
        curvedView.clipsToBounds = true
        homeTeamStack.addArrangedSubview(homeTeamName)
        homeTeamStack.addArrangedSubview(homeTeamScore)
        homeTeamStack.addArrangedSubview(matchDate)
        awayTeamStack.addArrangedSubview(awayTeamName)
        awayTeamStack.addArrangedSubview(awayTeamScore)
        awayTeamStack.addArrangedSubview(matchStatus)
        teamImageStack.addArrangedSubview(homeTeamImage)
        teamImageStack.addArrangedSubview(awayTeamImage)
        teamScoreStack.addArrangedSubview(teamImageStack)
        teamScoreStack.addArrangedSubview(matchWeek)
        cellViewStack.addArrangedSubview(homeTeamStack)
        cellViewStack.addArrangedSubview(teamScoreStack)
        cellViewStack.addArrangedSubview(awayTeamStack)
        contentView.addSubview(curvedView)
        curvedView.addSubview(cellViewStack)
        homeTeamImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        awayTeamName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        homeTeamImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        awayTeamName.widthAnchor.constraint(equalToConstant: 50).isActive = true
        cellViewStack.heightAnchor.constraint(equalToConstant: 200).isActive = true
        homeTeamStack.heightAnchor.constraint(equalToConstant: 200).isActive = true
        awayTeamStack.heightAnchor.constraint(equalToConstant: 200).isActive = true
        curvedView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        cellViewStack.leadingAnchor.constraint(equalTo: curvedView.leadingAnchor, constant: 10).isActive = true
        cellViewStack.trailingAnchor.constraint(equalTo: curvedView.trailingAnchor, constant: -10).isActive = true
        cellViewStack.topAnchor.constraint(equalTo: curvedView.topAnchor, constant: 10).isActive = true
        cellViewStack.bottomAnchor.constraint(equalTo: curvedView.bottomAnchor, constant: -10).isActive = true
        curvedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        curvedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        curvedView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        curvedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        curvedView.translatesAutoresizingMaskIntoConstraints = false
        homeTeamName.translatesAutoresizingMaskIntoConstraints = false
        homeTeamScore.translatesAutoresizingMaskIntoConstraints = false
        matchDate.translatesAutoresizingMaskIntoConstraints = false
        awayTeamName.translatesAutoresizingMaskIntoConstraints = false
        awayTeamScore.translatesAutoresizingMaskIntoConstraints = false
        matchStatus.translatesAutoresizingMaskIntoConstraints = false
        homeTeamStack.translatesAutoresizingMaskIntoConstraints = false
        awayTeamStack.translatesAutoresizingMaskIntoConstraints = false
        cellViewStack.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

