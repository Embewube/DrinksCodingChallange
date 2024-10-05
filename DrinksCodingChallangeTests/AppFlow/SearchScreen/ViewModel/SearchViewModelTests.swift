//
//  SearchViewModelTests.swift
//  DrinksCodingChallangeTests
//
//  Created by Wiktor Biruk on 02/10/2024.
//

import XCTest
import Combine
@testable import DrinksCodingChallange

final class SearchViewModelTests: XCTestCase {
    var sut: SearchViewModel?
    var getSearchResultUseCaseMock: GetSearchResultUseCaseMock?
    var searchDrinksCoordinatorMock: SearchDrinksCoordinatorMock?
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        cancellables = []
    }

    override func tearDown() {
        cancellables = nil
        super.tearDown()
    }

    func test_search_asksGetSearchResultUseCase_toSearch_whenQueryHasAtLeast3Characters() throws {
        // Given
        let query = "Rum"

        prepareTestDoubles()
        let sut = try XCTUnwrap(sut)

        // When
        sut.search(query: query)

        // Then
        XCTAssertEqual(getSearchResultUseCaseMock?.history, [.get(query: query)])
    }

    func test_search_doesntAskGetSearchResultUseCase_toSearch_whenQueryHasLessThan3Characters() throws {
        // Given
        let query = "Ru"

        prepareTestDoubles()
        let sut = try XCTUnwrap(sut)

        // When
        sut.search(query: query)

        // Then
        XCTAssertEqual(getSearchResultUseCaseMock?.history, [])
    }

    func test_search_publishesNewItems_whenReceivesResultFromGetSearchResultUseCase() throws {
        // Given
        let simulatedResult = [SearchResultsItem(id: "id", title: "title", imageUrl: "imageUrl")]

        prepareTestDoubles(useCaseSimulatedResult: .success(simulatedResult))
        let sut = try XCTUnwrap(sut)

        // When
        sut.search(query: "Rum")

        // Then
        sut.items
            .sink { result in
                XCTAssertEqual(result, simulatedResult)
            }
            .store(in: &cancellables)
    }

    func test_showDetails_asksCoordinator_toShowDetails() throws {
        // Given
        let itemId = "id"
        let item = SearchResultsItem(id: itemId, title: "title", imageUrl: "imageUrl")
        prepareTestDoubles()
        let sut = try XCTUnwrap(sut)

        // When
        sut.showDetails(for: item)

        // Then
        XCTAssertEqual(searchDrinksCoordinatorMock?.history, [.showDetails(itemId: itemId)])
    }

}

extension SearchViewModelTests {
    private func prepareTestDoubles(
        useCaseSimulatedResult: Result<[SearchResultsItem], Error> = .success([])
    ) {
        let getSearchResultUseCaseMock = GetSearchResultUseCaseMock(simulatedResult: useCaseSimulatedResult)
        self.getSearchResultUseCaseMock = getSearchResultUseCaseMock

        let searchDrinksCoorindatorMock = SearchDrinksCoordinatorMock()
        self.searchDrinksCoordinatorMock = searchDrinksCoorindatorMock

        sut = SearchViewModel(
            getSearchResultsUseCase: getSearchResultUseCaseMock,
            coordinator: searchDrinksCoorindatorMock
        )
    }
}
