//
//  YZCollections.swift
//  YinzcamSwiftApp
//
//  Created by Setu Desai on 2/7/24.
//

import Foundation

enum YZGameType: String {
    case F, B, S
}

struct YZGameDetail: Codable {
    var team: YZTeam?
    var defaultGameId: String?
    var gameSection: [YZGameSection]?
    var filters: [YZFilters]?
    var yinzNode: YZYinznode?
    
    enum YZGameDetailCK: String, CodingKey {
        case team = "Team"
        case defaultGameId = "DefaultGameId"
        case gameSection = "GameSection"
        case filters = "Filters"
        case yinzNode = "YinzNode"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: YZGameDetailCK.self)
        self.team = try? container?.decode(YZTeam.self, forKey: .team)
        self.defaultGameId = try? container?.decode(String.self, forKey: .defaultGameId)
        self.gameSection = try? container?.decode([YZGameSection].self, forKey: .gameSection)
        self.filters = try? container?.decode([YZFilters].self, forKey: .filters)
        self.yinzNode = try? container?.decode(YZYinznode.self, forKey: .yinzNode)
    }
}

struct YZTeam: Codable {
    var triCode: String?
    var fullName: String?
    var name: String?
    var city: String?
    var record: String?
    var wins: String?
    var losses: String?
    var winPercentage: String?
    
    enum YZTeamCK: String, CodingKey {
        case triCode = "TriCode"
        case fullName = "FullName"
        case name = "Name"
        case city = "City"
        case record = "Record"
        case wins = "Wins"
        case losses = "Losses"
        case winPercentage = "WinPercentage"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: YZTeamCK.self)
        self.triCode = try? container?.decode(String.self, forKey: .triCode)
        self.fullName = try? container?.decode(String.self, forKey: .fullName)
        self.name = try? container?.decode(String.self, forKey: .name)
        self.city = try? container?.decode(String.self, forKey: .city)
        self.record = try? container?.decode(String.self, forKey: .record)
        self.wins = try? container?.decode(String.self, forKey: .wins)
        self.losses = try? container?.decode(String.self, forKey: .losses)
        self.winPercentage = try? container?.decode(String.self, forKey: .winPercentage)
    }
}

struct YZGameSection: Codable {
    var heading: String?
    var game: [YZMatchDetail]?
    
    enum YZGameSectionCK: String, CodingKey {
        case heading = "Heading"
        case game = "Game"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: YZGameSectionCK.self)
        self.heading = try? container?.decode(String.self, forKey: .heading)
        self.game = try? container?.decode([YZMatchDetail].self, forKey: .game)
    }
}

struct YZFilters: Codable {
    var name: String?
    var queryParameter: String?
    var placeholder: String?
    var typeValue: String?
    var current: String?
    var items: [YZItems]?
    
    enum YZFiltersCK: String, CodingKey {
        case name = "Name"
        case queryParameter = "QueryParameter"
        case placeholder = "Placeholder"
        case typeValue = "Type"
        case current = "Current"
        case items = "Items"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: YZFiltersCK.self)
        self.name = try? container?.decode(String.self, forKey: .name)
        self.queryParameter = try? container?.decode(String.self, forKey: .queryParameter)
        self.placeholder = try? container?.decode(String.self, forKey: .placeholder)
        self.typeValue = try? container?.decode(String.self, forKey: .typeValue)
        self.items = try? container?.decode([YZItems].self, forKey: .items)
    }
}

struct YZYinznode: Codable {
    var inVenue: Bool?
    var venueStatus: String?
    var carrier: String?
    var ads: String?
    var generated: String?
    
    enum YZYinznodeCK: String, CodingKey {
        case inVenue = "InVenue"
        case venueStatus = "VenueStatus"
        case carrier = "Carrier"
        case ads = "Ads"
        case generated = "Generated"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: YZYinznodeCK.self)
        self.inVenue = try? container?.decode(Bool.self, forKey: .inVenue)
        self.venueStatus = try? container?.decode(String.self, forKey: .venueStatus)
        self.carrier = try? container?.decode(String.self, forKey: .carrier)
        self.ads = try? container?.decode(String.self, forKey: .ads)
        self.generated = try? container?.decode(String.self, forKey: .generated)
    }
}

struct YZMatchDetail: Codable {
    var week: String?
    var label: String?
    var tv: String?
    var radio: String?
    var venue: String?
    var wlt: String?
    var gameState: String?
    var clock: String?
    var quarterShorthand: String?
    var quarter: String?
    var awayScore: String?
    var homeScore: String?
    var down: String?
    var isHome: Bool?
    var scheduleHeader: String?
    var isSuperStadium: Bool?
    var cardData: YZCardData?
    var id: Double?
    var typeValue: String?
    var dateValue: YZDateDict?
    var opponent: YZOpponent?
    var tickets: YZTicket?
    var result: String?
    var home: Bool?
    var buttons: [YZButtonsDict]?
    var secondaryButtons: [String]?
    
    enum YZMatchDetailCK: String, CodingKey {
        case week = "Week"
        case label = "Label"
        case tv = "TV"
        case radio = "Radio"
        case venue = "Venue"
        case wlt = "WLT"
        case gameState = "GameState"
        case clock = "Clock"
        case quarterShorthand = "QuarterShorthand"
        case quarter = "Quarter"
        case awayScore = "AwayScore"
        case homeScore = "HomeScore"
        case down = "Down"
        case isHome = "IsHome"
        case scheduleHeader = "ScheduleHeader"
        case isSuperStadium = "IsSuperStadium"
        case cardData = "CardData"
        case id = "Id"
        case typeValue = "Type"
        case dateValue = "Date"
        case opponent = "Opponent"
        case tickets = "Tickets"
        case result = "Result"
        case home = "Home"
        case buttons = "Buttons"
        case secondaryButtons = "SecondaryButtons"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: YZMatchDetailCK.self)
        self.week = try? container?.decode(String.self, forKey: .week)
        self.label = try? container?.decode(String.self, forKey: .label)
        self.tv = try? container?.decode(String.self, forKey: .tv)
        self.radio = try? container?.decode(String.self, forKey: .radio)
        self.venue = try? container?.decode(String.self, forKey: .venue)
        self.wlt = try? container?.decode(String.self, forKey: .wlt)
        self.gameState = try? container?.decode(String.self, forKey: .gameState)
        self.clock = try? container?.decode(String.self, forKey: .clock)
        self.quarterShorthand = try? container?.decode(String.self, forKey: .quarterShorthand)
        self.quarter = try? container?.decode(String.self, forKey: .quarter)
        self.awayScore = try? container?.decode(String.self, forKey: .awayScore)
        self.homeScore = try? container?.decode(String.self, forKey: .homeScore)
        self.isHome = try? container?.decode(Bool.self, forKey: .isHome)
        self.scheduleHeader = try? container?.decode(String.self, forKey: .scheduleHeader)
        self.isSuperStadium = try? container?.decode(Bool.self, forKey: .isSuperStadium)
        self.cardData = try? container?.decode(YZCardData.self, forKey: .cardData)
        self.id = try? container?.decode(Double.self, forKey: .id)
        self.typeValue = try? container?.decode(String.self, forKey: .typeValue)
        self.dateValue = try? container?.decode(YZDateDict.self, forKey: .dateValue)
        self.opponent = try? container?.decode(YZOpponent.self, forKey: .opponent)
        self.tickets = try? container?.decode(YZTicket.self, forKey: .tickets)
        self.result = try? container?.decode(String.self, forKey: .result)
        self.home = try? container?.decode(Bool.self, forKey: .home)
        self.buttons = try? container?.decode([YZButtonsDict].self, forKey: .buttons)
        self.secondaryButtons = try? container?.decode([String].self, forKey: .secondaryButtons)
    }
}

struct YZItems: Codable {
    var id: String?
    var name: String?
    
    enum YZItemsCK: String, CodingKey {
        case id = "Id"
        case name = "Name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: YZItemsCK.self)
        self.id = try? container?.decode(String.self, forKey: .id)
        self.name = try? container?.decode(String.self, forKey: .name)
    }
}

struct YZCardData: Codable {
    var clickthroughURL: String?
    var isDefault: String?
    
    enum CardDataCK: String, CodingKey {
        case clickthroughURL = "ClickthroughURL"
        case isDefault = "IsDefault"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CardDataCK.self)
        self.clickthroughURL = try? container?.decode(String.self, forKey: .clickthroughURL)
        self.isDefault = try? container?.decode(String.self, forKey: .isDefault)
    }
}

struct YZDateDict: Codable {
    var numeric: String?
    var text: String?
    var time: String?
    var timestamp: String?
    var isTBA: String?
    var isTba: String?
    
    enum YZDateDictCK: String, CodingKey {
        case numeric = "Numeric"
        case text = "Text"
        case time = "Time"
        case timestamp = "Timestamp"
        case isTBA = "IsTBA"
        case isTba = "IsTba"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: YZDateDictCK.self)
        self.numeric = try? container?.decode(String.self, forKey: .numeric)
        self.text = try? container?.decode(String.self, forKey: .text)
        self.time = try? container?.decode(String.self, forKey: .time)
        self.timestamp = try? container?.decode(String.self, forKey: .timestamp)
        self.isTBA = try? container?.decode(String.self, forKey: .isTBA)
        self.isTba = try? container?.decode(String.self, forKey: .isTba)
    }
}

struct YZOpponent: Codable {
    var triCode: String?
    var fullName: String?
    var name: String?
    var city: String?
    var record: String?
    
    enum YZOpponentCK: String, CodingKey {
        case triCode = "TriCode"
        case fullName = "FullName"
        case name = "Name"
        case city = "City"
        case record = "Record"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: YZOpponentCK.self)
        self.triCode = try? container?.decode(String.self, forKey: .triCode)
        self.fullName = try? container?.decode(String.self, forKey: .fullName)
        self.name = try? container?.decode(String.self, forKey: .name)
        self.city = try? container?.decode(String.self, forKey: .city)
        self.record = try? container?.decode(String.self, forKey: .record)
    }
}

struct YZTicket: Codable {
    var hasLink: Bool?
    var label: String?
    var link: String?
    
    enum YZTicketCK: String, CodingKey {
        case hasLink = "HasLink"
        case label = "Label"
        case link = "Link"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: YZTicketCK.self)
        self.hasLink = try? container?.decode(Bool.self, forKey: .hasLink)
        self.label = try? container?.decode(String.self, forKey: .label)
        self.link = try? container?.decode(String.self, forKey: .link)
    }
}

struct YZButtonsDict: Codable {
    var title: String?
    var url: String?
    
    enum YZButtonsDictCK: String, CodingKey {
        case title = "Title"
        case url = "URL"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: YZButtonsDictCK.self)
        self.title = try? container?.decode(String.self, forKey: .title)
        self.url = try? container?.decode(String.self, forKey: .url)
    }
}
