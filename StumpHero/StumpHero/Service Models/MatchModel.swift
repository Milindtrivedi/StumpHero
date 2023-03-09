//
//  MatchModel.swift
//  StumpHero
//
//  Created by Apple on 09/03/23.
//

import Foundation

// MARK: - MatchDatum
struct MatchDatum: Hashable,Codable {
    var matchdetail: Matchdetail?
    var nuggets: [String]?
    var innings: [MatchInning]?
    var teams: [String: MatchTeam]?
    var notes: [String: [String]]?
}

// MARK: - MatchInning
struct MatchInning: Hashable,Codable {
    var number: String?
    var battingteam: String?
    var total: String?
    var wickets: String?
    var overs: String?
    var runrate: String?
    var byes: String?
    var legbyes: String?
    var wides: String?
    var noballs: String?
    var penalty: String?
    var allottedOvers: String?
    var batsmen: [MatchInningBatsman]?
    var partnershipCurrent: MatchPartnershipCurrent?
    var bowlers: [MatchBowler]?
    var fallofWickets: [MatchFallofWicket]?
    var powerPlay: MatchPowerPlay?
    var target: String?
}

// MARK: - MatchInningBatsman
struct MatchInningBatsman: Hashable,Codable {
    var batsman: String?
    var runs: String?
    var balls: String?
    var fours: String?
    var sixes: String?
    var dots: String?
    var strikerate: String?
    var dismissal: MatchDismissal?
    var howout: String?
    var bowler: String?
    var fielder: String?
    var isonstrike: Bool?
}

enum MatchDismissal: Hashable,Codable {
    case bowled
    case caught
    case empty
    case lbw
    case notOut
    case stumped
}

// MARK: - MatchBowler
struct MatchBowler: Hashable,Codable {
    var bowler: String?
    var overs: String?
    var maidens: String?
    var runs: String?
    var wickets: String?
    var economyrate: String?
    var noballs: String?
    var wides: String?
    var dots: String?
    var isbowlingtandem: Bool?
    var isbowlingnow: Bool?
    var thisOver: [MatchThisOver]?
}

// MARK: - MatchThisOver
struct MatchThisOver: Hashable,Codable {
    var t: MatchT?
    var b: String?
}

enum MatchT: Hashable,Codable {
    case empty
    case lb
    case wd
}

// MARK: - MatchFallofWicket
struct MatchFallofWicket: Hashable,Codable {
    var batsman: String?
    var score: String?
    var overs: String?
}

// MARK: - MatchPartnershipCurrent
struct MatchPartnershipCurrent: Hashable,Codable {
    var runs: String?
    var balls: String?
    var batsmen: [MatchPartnershipCurrentBatsman]?
}

// MARK: - MatchPartnershipCurrentBatsman
struct MatchPartnershipCurrentBatsman: Hashable,Codable {
    var batsman: String?
    var runs: String?
    var balls: String?
}

// MARK: - MatchPowerPlay
struct MatchPowerPlay: Hashable,Codable {
    var pp1: String?
    var pp2: String?
}

// MARK: - Matchdetail
struct Matchdetail: Hashable,Codable {
    var teamHome: String?
    var teamAway: String?
    var match: Match?
    var series: MatchSeries?
    var venue: MatchVenue?
    var officials: MatchOfficials?
    var weather: String?
    var tosswonby: String?
    var status: String?
    var statusID: String?
    var playerMatch: String?
    var result: String?
    var winningteam: String?
    var winmargin: String?
    var equation: String?
}

// MARK: - Match
struct Match: Hashable,Codable {
    var livecoverage: String?
    var id: String?
    var code: String?
    var league: String?
    var number: String?
    var type: String?
    var date: String?
    var time: String?
    var offset: String?
    var daynight: String?
}

// MARK: - MatchOfficials
struct MatchOfficials: Hashable,Codable {
    var umpires: String?
    var referee: String?
}

// MARK: - MatchSeries
struct MatchSeries: Hashable,Codable {
    var id: String?
    var name: String?
    var status: String?
    var tour: String?
    var tourName: String?
}

// MARK: - MatchVenue
struct MatchVenue: Hashable,Codable {
    var id: String?
    var name: String?
}

// MARK: - MatchTeam
struct MatchTeam: Hashable,Codable {
    var nameFull: String?
    var nameShort: String?
    var players: [String: MatchPlayer]?
}

// MARK: - MatchPlayer
struct MatchPlayer: Hashable,Codable {
    var position: String?
    var nameFull: String?
    var iskeeper: Bool?
    var batting: MatchBatting?
    var bowling: MatchBowling?
    var iscaptain: Bool?
}

// MARK: - MatchBatting
struct MatchBatting: Hashable,Codable {
    var style: MatchStyle?
    var average: String?
    var strikerate: String?
    var runs: String?
}

enum MatchStyle: Hashable,Codable {
    case lhb
    case rhb
}

// MARK: - MatchBowling
struct MatchBowling: Hashable,Codable {
    var style: String?
    var average: String?
    var economyrate: String?
    var wickets: String?
}
