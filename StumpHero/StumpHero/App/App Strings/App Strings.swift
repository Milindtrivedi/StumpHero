//
//  App Strings.swift
//  StumpHero
//
//  Created by Milind Trivedi on 09/03/23.
//  © Copyright 2023 Milind Trivedi All rights reserved

import SwiftUI

/// This file contains all strings that are being used in app for the convinience of changes as it's centralized
/// This will also help with localization i.e changing app Languages

final class AppStrings {
    static let loginTitle = "Sign in"
    static let Username = "Username"
    static let Password = "Password"
    static let DashboardLivetxt = "Live"
    static let DashboardHeaderTitle = "Fixtures"
    static let DashboardNoDataTxt = "No Data Available at the moment"
    static let versustxt = "V/S"
    static let venue = "Venue: "
    static let PlayerNoDataTxt = "No Player of this name exists in squad"
    static let SquadScreentitle = "Squad Information"
    static let LogoutTitle = "Logout?"
    static let LogoutSubTitle = "Are you sure you want to logout from this account?"
    static let LogoutYes = "Yes"
    static let LogoutNo = "No"
    static let UserName = "Milind Trivedi"
    static let PermissionTitleTxt = "Permissions"
    static let UsersTitleTxt = "Users"
    static let SignOutTitleTxt = "Sign Out"
    static let SearchPlaceHolder = "Search"
    static let ToolBarButtonTitle = "Done"
    static let CustomPlayerFilterButtonAllTitle = "All"
    static let ok = "OK"
    static let filterLiveTitle = "Live"
    static let filterUpcomingTitle = "Upcoming"
    static let filterNewsTitle = "News"
    static let BattingTitle = "Batting"
    static let BattingStyle = "Style"
    static let BattingAverage = "Average"
    static let BattingStrikerate = "Strikerate"
    static let BattingRuns = "Runs"
    static let BowlingTitle = "Bowling"
    static let BowlingStyle = "Style"
    static let BowlingAverage = "Average"
    static let BowlingEconomyrate = "Economyrate"
    static let BowlingWickets = "Wickets"
    static let viewButtonTitle = "VIEW"
}


final class ErrorMessages {
    static let IncorrectLoginInput = "Username and Password is incorrect"
    static let InternetErr = "You are not connected with the internet please check your connectivity"
    static let InvalidURL = "URL is Invalid"
}
