//
//  StumpHeroTests.swift
//  StumpHeroTests
//
//  Created by Milind Trivedi on 09/03/23.
//  © Copyright 2023 Milind Trivedi All rights reserved

import XCTest
import SwiftUI
@testable import StumpHero

final class StumpHeroTests: XCTestCase {
    
    // Test case for checking if getMatchData function is working as expected
    @MainActor func testGetMatchData() async throws {
        let viewModel = DashboardViewModel(getMatchCase: MockGetMatchCase())
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertTrue(viewModel.matches.isEmpty) //FOCUS HERE SEE ARRAY OF MATCHES IS EMPTY HERE
        XCTAssertFalse(viewModel.showErrorPopup)
        XCTAssertTrue(viewModel.error.isEmpty)
        
        // Call the function
        await viewModel.getMatchData()
        
        // Assert that the function correctly updates the view model properties
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertFalse(viewModel.matches.isEmpty) //ARRAY OF MATCHES IS FETCHED FROM SERVER HERE
        XCTAssertFalse(viewModel.showErrorPopup)
        XCTAssertTrue(viewModel.error.isEmpty)
    }
    
    // Test case for checking if getTeamName function returns correct team name
    @MainActor func testGetTeamName() {
        let viewModel = DashboardViewModel(getMatchCase: MockGetMatchCase())
        let matches : [MatchDatum] = [loadJson("52.json")]
        let teamName = viewModel.getTeamName(data: matches.first!, id: "7")
        XCTAssertEqual(teamName?.nameFull, "South Africa")
    }
    
    // Test case for checking if getDayOfWeek function returns correct weekday
    @MainActor func testGetDayOfWeek() {
        let viewModel = DashboardViewModel(getMatchCase: MockGetMatchCase())
        let dayOfWeek = viewModel.getDayOfWeek("04/13/2022")
        XCTAssertEqual(dayOfWeek, "Wed")
    }

    // Test case for checking if convertToAMPM function returns correct time in AM/PM format
    @MainActor func testConvertToAMPM() {
        let viewModel = DashboardViewModel(getMatchCase: MockGetMatchCase())
        let timeInAMPM = viewModel.convertToAMPM("20:00")
        XCTAssertEqual(timeInAMPM, "8:00 PM")
    }

    // Test case for checking if getSystemImage function returns correct system image
    @MainActor func testGetSystemImage() {
        let viewModel = DashboardViewModel(getMatchCase: MockGetMatchCase())
        let clearImage = viewModel.getSystemImage(for: "clear")
        XCTAssertEqual(clearImage, Image(systemName: "sun.max"))

        let sunnyImage = viewModel.getSystemImage(for: "sunny")
        XCTAssertEqual(sunnyImage, Image(systemName: "sun.min"))

        let cloudImage = viewModel.getSystemImage(for: "cloudy")
        XCTAssertEqual(cloudImage, Image(systemName: "cloud.sun"))
    }
}

// Mock implementation of getMatchCase protocol
class MockGetMatchCase: getMatchCase {
    func getMatchDetails() async throws -> MatchDatum {
        let data : [MatchDatum] = [loadJson("52.json")]
        return data.first!
    }
}

func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
