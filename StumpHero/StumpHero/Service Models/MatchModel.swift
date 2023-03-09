//
//  MatchModel.swift
//  StumpHero
//
//  Created by Apple on 09/03/23.
//

import Foundation

// MARK: - MatchDatum
struct MatchDatum: Codable, Hashable, Identifiable {
    let id = UUID()
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
struct MatchInning: Codable, Hashable, Identifiable {
    let id = UUID()
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
struct MatchInningBatsman: Codable, Hashable, Identifiable {
    let id = UUID()
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
struct MatchBowler: Codable, Hashable, Identifiable {
    let id = UUID()
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
struct MatchThisOver: Codable, Hashable, Identifiable {
    let id = UUID()
    let t, b: String

    enum CodingKeys: String, CodingKey {
        case t = "T"
        case b = "B"
    }
}

// MARK: - MatchFallofWicket
struct MatchFallofWicket: Codable, Hashable, Identifiable {
    let id = UUID()
    let batsman, score, overs: String

    enum CodingKeys: String, CodingKey {
        case batsman = "Batsman"
        case score = "Score"
        case overs = "Overs"
    }
}

// MARK: - MatchPartnershipCurrent
struct MatchPartnershipCurrent: Codable, Hashable, Identifiable {
    let id = UUID()
    let runs, balls: String
    let batsmen: [MatchPartnershipCurrentBatsman]

    enum CodingKeys: String, CodingKey {
        case runs = "Runs"
        case balls = "Balls"
        case batsmen = "Batsmen"
    }
}

// MARK: - MatchPartnershipCurrentBatsman
struct MatchPartnershipCurrentBatsman: Codable, Hashable, Identifiable {
    let id = UUID()
    let batsman, runs, balls: String

    enum CodingKeys: String, CodingKey {
        case batsman = "Batsman"
        case runs = "Runs"
        case balls = "Balls"
    }
}

// MARK: - MatchPowerPlay
struct MatchPowerPlay: Codable, Hashable, Identifiable {
    let id = UUID()
    let pp1, pp2: String

    enum CodingKeys: String, CodingKey {
        case pp1 = "PP1"
        case pp2 = "PP2"
    }
}

// MARK: - Matchdetail
struct Matchdetail: Codable, Hashable,Identifiable {
    let id = UUID()
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
struct Match: Codable, Hashable, Identifiable {
    let id = UUID()
    let livecoverage, iid, code, league: String
    let number, type, date, time: String
    let offset, daynight: String

    enum CodingKeys: String, CodingKey {
        case livecoverage = "Livecoverage"
        case iid = "Id"
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
struct MatchOfficials: Codable, Hashable, Identifiable {
    let umpires, referee: String
    let id = UUID()

    enum CodingKeys: String, CodingKey {
        case umpires = "Umpires"
        case referee = "Referee"
    }
}

// MARK: - MatchSeries
struct MatchSeries: Codable, Hashable, Identifiable {
    let id = UUID()
    let IId, name, status, tour: String
    let tourName: String

    enum CodingKeys: String, CodingKey {
        case IId = "Id"
        case name = "Name"
        case status = "Status"
        case tour = "Tour"
        case tourName = "Tour_Name"
    }
}

// MARK: - MatchVenue
struct MatchVenue: Codable, Hashable, Identifiable {
    let id = UUID(), name: String
    let IId = UUID()

    enum CodingKeys: String, CodingKey {
        case IId = "Id"
        case name = "Name"
    }
}

// MARK: - MatchTeam
struct MatchTeam: Codable, Hashable, Identifiable {
    let id = UUID()
    let nameFull, nameShort: String
    let players: [String: MatchPlayer]

    enum CodingKeys: String, CodingKey {
        case nameFull = "Name_Full"
        case nameShort = "Name_Short"
        case players = "Players"
    }
}

// MARK: - MatchPlayer
struct MatchPlayer: Codable, Hashable, Identifiable {
    let id = UUID()
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
struct MatchBatting: Codable, Hashable, Identifiable {
    let id = UUID()
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
struct MatchBowling: Codable, Hashable, Identifiable {
    let id = UUID()
    let style, average, economyrate, wickets: String

    enum CodingKeys: String, CodingKey {
        case style = "Style"
        case average = "Average"
        case economyrate = "Economyrate"
        case wickets = "Wickets"
    }
}
