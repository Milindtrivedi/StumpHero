//
//  MatchModel.swift
//  StumpHero
//
//  Created by Apple on 09/03/23.
//

import Foundation
//
//// MARK: - MatchDatum
//struct MatchDatum: Hashable,Codable {
//    var matchdetail: Matchdetail?
//    var nuggets: [String]?
//    var innings: [MatchInning]?
//    var teams: [String: MatchTeam]?
//    var notes: [String: [String]]?
//}
//
//// MARK: - MatchInning
//struct MatchInning: Hashable,Codable {
//    var number: String?
//    var battingteam: String?
//    var total: String?
//    var wickets: String?
//    var overs: String?
//    var runrate: String?
//    var byes: String?
//    var legbyes: String?
//    var wides: String?
//    var noballs: String?
//    var penalty: String?
//    var allottedOvers: String?
//    var batsmen: [MatchInningBatsman]?
//    var partnershipCurrent: MatchPartnershipCurrent?
//    var bowlers: [MatchBowler]?
//    var fallofWickets: [MatchFallofWicket]?
//    var powerPlay: MatchPowerPlay?
//    var target: String?
//}
//
//// MARK: - MatchInningBatsman
//struct MatchInningBatsman: Hashable,Codable {
//    var batsman: String?
//    var runs: String?
//    var balls: String?
//    var fours: String?
//    var sixes: String?
//    var dots: String?
//    var strikerate: String?
//    var dismissal: MatchDismissal?
//    var howout: String?
//    var bowler: String?
//    var fielder: String?
//    var isonstrike: Bool?
//}
//
//enum MatchDismissal: Hashable,Codable {
//    case bowled
//    case caught
//    case empty
//    case lbw
//    case notOut
//    case stumped
//}
//
//// MARK: - MatchBowler
//struct MatchBowler: Hashable,Codable {
//    var bowler: String?
//    var overs: String?
//    var maidens: String?
//    var runs: String?
//    var wickets: String?
//    var economyrate: String?
//    var noballs: String?
//    var wides: String?
//    var dots: String?
//    var isbowlingtandem: Bool?
//    var isbowlingnow: Bool?
//    var thisOver: [MatchThisOver]?
//}
//
//// MARK: - MatchThisOver
//struct MatchThisOver: Hashable,Codable {
//    var t: MatchT?
//    var b: String?
//}
//
//enum MatchT: Hashable,Codable {
//    case empty
//    case lb
//    case wd
//}
//
//// MARK: - MatchFallofWicket
//struct MatchFallofWicket: Hashable,Codable {
//    var batsman: String?
//    var score: String?
//    var overs: String?
//}
//
//// MARK: - MatchPartnershipCurrent
//struct MatchPartnershipCurrent: Hashable,Codable {
//    var runs: String?
//    var balls: String?
//    var batsmen: [MatchPartnershipCurrentBatsman]?
//}
//
//// MARK: - MatchPartnershipCurrentBatsman
//struct MatchPartnershipCurrentBatsman: Hashable,Codable {
//    var batsman: String?
//    var runs: String?
//    var balls: String?
//}
//
//// MARK: - MatchPowerPlay
//struct MatchPowerPlay: Hashable,Codable {
//    var pp1: String?
//    var pp2: String?
//}
//
//// MARK: - Matchdetail
//struct Matchdetail: Hashable,Codable {
//    var teamHome: String?
//    var teamAway: String?
//    var match: Match?
//    var series: MatchSeries?
//    var venue: MatchVenue?
//    var officials: MatchOfficials?
//    var weather: String?
//    var tosswonby: String?
//    var status: String?
//    var statusID: String?
//    var playerMatch: String?
//    var result: String?
//    var winningteam: String?
//    var winmargin: String?
//    var equation: String?
//}
//
//// MARK: - Match
//struct Match: Hashable,Codable {
//    var livecoverage: String?
//    var id: String?
//    var code: String?
//    var league: String?
//    var number: String?
//    var type: String?
//    var date: String?
//    var time: String?
//    var offset: String?
//    var daynight: String?
//}
//
//// MARK: - MatchOfficials
//struct MatchOfficials: Hashable,Codable {
//    var umpires: String?
//    var referee: String?
//}
//
//// MARK: - MatchSeries
//struct MatchSeries: Hashable,Codable {
//    var id: String?
//    var name: String?
//    var status: String?
//    var tour: String?
//    var tourName: String?
//}
//
//// MARK: - MatchVenue
//struct MatchVenue: Hashable,Codable {
//    var id: String?
//    var name: String?
//}
//
//// MARK: - MatchTeam
//struct MatchTeam: Hashable,Codable {
//    var nameFull: String?
//    var nameShort: String?
//    var players: [String: MatchPlayer]?
//}
//
//// MARK: - MatchPlayer
//struct MatchPlayer: Hashable,Codable {
//    var position: String?
//    var nameFull: String?
//    var iskeeper: Bool?
//    var batting: MatchBatting?
//    var bowling: MatchBowling?
//    var iscaptain: Bool?
//}
//
//// MARK: - MatchBatting
//struct MatchBatting: Hashable,Codable {
//    var style: MatchStyle?
//    var average: String?
//    var strikerate: String?
//    var runs: String?
//}
//
//enum MatchStyle: Hashable,Codable {
//    case lhb
//    case rhb
//}
//
//// MARK: - MatchBowling
//struct MatchBowling: Hashable,Codable {
//    var style: String?
//    var average: String?
//    var economyrate: String?
//    var wickets: String?
//}


// MARK: - MatchDatum
struct MatchDatum: Codable, Hashable {
    let matchdetail: Matchdetail
    let nuggets: [String]
    let innings: [MatchInning]
    let teams: [String: MatchTeam]
    let notes: [String: [String]]

    enum CodingKeys: String, CodingKey {
        case matchdetail = "Matchdetail"
        case nuggets = "Nuggets"
        case innings = "Innings"
        case teams = "Teams"
        case notes = "Notes"
    }
}

// MARK: - MatchInning
struct MatchInning: Codable, Hashable {
    let number, battingteam, total, wickets: String
    let overs, runrate, byes, legbyes: String
    let wides, noballs, penalty, allottedOvers: String
    let batsmen: [MatchInningBatsman]
    let partnershipCurrent: MatchPartnershipCurrent
    let bowlers: [MatchBowler]
    let fallofWickets: [MatchFallofWicket]
    let powerPlay: MatchPowerPlay
    let target: String?

    enum CodingKeys: String, CodingKey {
        case number = "Number"
        case battingteam = "Battingteam"
        case total = "Total"
        case wickets = "Wickets"
        case overs = "Overs"
        case runrate = "Runrate"
        case byes = "Byes"
        case legbyes = "Legbyes"
        case wides = "Wides"
        case noballs = "Noballs"
        case penalty = "Penalty"
        case allottedOvers = "AllottedOvers"
        case batsmen = "Batsmen"
        case partnershipCurrent = "Partnership_Current"
        case bowlers = "Bowlers"
        case fallofWickets = "FallofWickets"
        case powerPlay = "PowerPlay"
        case target = "Target"
    }
}

// MARK: - MatchInningBatsman
struct MatchInningBatsman: Codable, Hashable {
    let batsman, runs, balls, fours: String
    let sixes, dots, strikerate, dismissal: String
    let howout, bowler, fielder: String
    let isonstrike: Bool?

    enum CodingKeys: String, CodingKey {
        case batsman = "Batsman"
        case runs = "Runs"
        case balls = "Balls"
        case fours = "Fours"
        case sixes = "Sixes"
        case dots = "Dots"
        case strikerate = "Strikerate"
        case dismissal = "Dismissal"
        case howout = "Howout"
        case bowler = "Bowler"
        case fielder = "Fielder"
        case isonstrike = "Isonstrike"
    }
}

// MARK: - MatchBowler
struct MatchBowler: Codable, Hashable {
    let bowler, overs, maidens, runs: String
    let wickets, economyrate, noballs, wides: String
    let dots: String
    let isbowlingtandem, isbowlingnow: Bool?
    let thisOver: [MatchThisOver]?

    enum CodingKeys: String, CodingKey {
        case bowler = "Bowler"
        case overs = "Overs"
        case maidens = "Maidens"
        case runs = "Runs"
        case wickets = "Wickets"
        case economyrate = "Economyrate"
        case noballs = "Noballs"
        case wides = "Wides"
        case dots = "Dots"
        case isbowlingtandem = "Isbowlingtandem"
        case isbowlingnow = "Isbowlingnow"
        case thisOver = "ThisOver"
    }
}

// MARK: - MatchThisOver
struct MatchThisOver: Codable, Hashable {
    let t, b: String

    enum CodingKeys: String, CodingKey {
        case t = "T"
        case b = "B"
    }
}

// MARK: - MatchFallofWicket
struct MatchFallofWicket: Codable, Hashable {
    let batsman, score, overs: String

    enum CodingKeys: String, CodingKey {
        case batsman = "Batsman"
        case score = "Score"
        case overs = "Overs"
    }
}

// MARK: - MatchPartnershipCurrent
struct MatchPartnershipCurrent: Codable, Hashable {
    let runs, balls: String
    let batsmen: [MatchPartnershipCurrentBatsman]

    enum CodingKeys: String, CodingKey {
        case runs = "Runs"
        case balls = "Balls"
        case batsmen = "Batsmen"
    }
}

// MARK: - MatchPartnershipCurrentBatsman
struct MatchPartnershipCurrentBatsman: Codable, Hashable {
    let batsman, runs, balls: String

    enum CodingKeys: String, CodingKey {
        case batsman = "Batsman"
        case runs = "Runs"
        case balls = "Balls"
    }
}

// MARK: - MatchPowerPlay
struct MatchPowerPlay: Codable, Hashable {
    let pp1, pp2: String

    enum CodingKeys: String, CodingKey {
        case pp1 = "PP1"
        case pp2 = "PP2"
    }
}

// MARK: - Matchdetail
struct Matchdetail: Codable, Hashable {
    let teamHome, teamAway: String
    let match: Match
    let series: MatchSeries
    let venue: MatchVenue
    let officials: MatchOfficials
    let weather, tosswonby, status, statusID: String
    let playerMatch, result, winningteam, winmargin: String
    let equation: String

    enum CodingKeys: String, CodingKey {
        case teamHome = "Team_Home"
        case teamAway = "Team_Away"
        case match = "Match"
        case series = "Series"
        case venue = "Venue"
        case officials = "Officials"
        case weather = "Weather"
        case tosswonby = "Tosswonby"
        case status = "Status"
        case statusID = "Status_Id"
        case playerMatch = "Player_Match"
        case result = "Result"
        case winningteam = "Winningteam"
        case winmargin = "Winmargin"
        case equation = "Equation"
    }
}

// MARK: - Match
struct Match: Codable, Hashable {
    let livecoverage, id, code, league: String
    let number, type, date, time: String
    let offset, daynight: String

    enum CodingKeys: String, CodingKey {
        case livecoverage = "Livecoverage"
        case id = "Id"
        case code = "Code"
        case league = "League"
        case number = "Number"
        case type = "Type"
        case date = "Date"
        case time = "Time"
        case offset = "Offset"
        case daynight = "Daynight"
    }
}

// MARK: - MatchOfficials
struct MatchOfficials: Codable, Hashable {
    let umpires, referee: String

    enum CodingKeys: String, CodingKey {
        case umpires = "Umpires"
        case referee = "Referee"
    }
}

// MARK: - MatchSeries
struct MatchSeries: Codable, Hashable {
    let id, name, status, tour: String
    let tourName: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case status = "Status"
        case tour = "Tour"
        case tourName = "Tour_Name"
    }
}

// MARK: - MatchVenue
struct MatchVenue: Codable, Hashable {
    let id, name: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
    }
}

// MARK: - MatchTeam
struct MatchTeam: Codable, Hashable {
    let nameFull, nameShort: String
    let players: [String: MatchPlayer]

    enum CodingKeys: String, CodingKey {
        case nameFull = "Name_Full"
        case nameShort = "Name_Short"
        case players = "Players"
    }
}

// MARK: - MatchPlayer
struct MatchPlayer: Codable, Hashable {
    let position, nameFull: String
    let iskeeper: Bool?
    let batting: MatchBatting
    let bowling: MatchBowling
    let iscaptain: Bool?

    enum CodingKeys: String, CodingKey {
        case position = "Position"
        case nameFull = "Name_Full"
        case iskeeper = "Iskeeper"
        case batting = "Batting"
        case bowling = "Bowling"
        case iscaptain = "Iscaptain"
    }
}

// MARK: - MatchBatting
struct MatchBatting: Codable, Hashable {
    let style: MatchStyle
    let average, strikerate, runs: String

    enum CodingKeys: String, CodingKey {
        case style = "Style"
        case average = "Average"
        case strikerate = "Strikerate"
        case runs = "Runs"
    }
}

enum MatchStyle: String, Codable {
    case lhb = "LHB"
    case rhb = "RHB"
}

// MARK: - MatchBowling
struct MatchBowling: Codable, Hashable {
    let style, average, economyrate, wickets: String

    enum CodingKeys: String, CodingKey {
        case style = "Style"
        case average = "Average"
        case economyrate = "Economyrate"
        case wickets = "Wickets"
    }
}
