//
//  MainPresentTest.swift
//  MVP_002Tests
//
//  Created by Nikita Shestakov on 18.11.2023.
//

import XCTest
@testable import MVP_002
// чтобы 2 таргета видели друг друга

class MockView: MainViewProtocol {
    var titleTest: String?
    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
    // cmd + U - прогонка всех тестов
    
    
}

final class MainPresentTest: XCTestCase {
    var view: MockView!
    var person: Comment!
    var presenter: MainPresenter!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        view = MockView()
        person = Comment(firstname: "Baz", lastName: "Bar")
        presenter = MainPresenter(view: view, person: person)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        view = nil
        person = nil
        presenter = nil
    }


    func testModuleIsNotNill() {  // ключевое слово test перед название ф-ции
        XCTAssertNotNil(view, "View is not nill")
        XCTAssertNotNil(person, "person is not nill")
        XCTAssertNotNil(presenter, "presenter is not nill")
    }
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.titleTest, "Baz uuuuBar")
    }
    func testModel() {
        XCTAssertEqual(person.firstname, "Baz")
        XCTAssertEqual(person.lastName, "Barrrrr")

    }

}
