//
//  PlayoCodingTestTests.swift
//  PlayoCodingTestTests
//
//  Created by sabaz shereef on 30/11/21.
//

import XCTest
@testable import PlayoCodingTest

class PlayoCodingTestTests: XCTestCase {
    
    var articles = [Article]()
    let viewModel = HeadlinesViewModel()
    private var tableVC: HeadlinesViewController!

    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        tableVC = storyboard.instantiateViewController(withIdentifier: "HeadlinesViewController") as? HeadlinesViewController
        // Trigger view load and viewDidLoad()
        _ = tableVC.view
    }
    
    func testHasATable() {
        XCTAssertNotNil(tableVC.headlinesTableView)

    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(tableVC.headlinesTableView.delegate)
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(tableVC.headlinesTableView.dataSource)
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(tableVC.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(tableVC.responds(to: #selector(tableVC.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(tableVC.responds(to: #selector(tableVC.tableView(_:cellForRowAt:))))
    }
    
//    func testTableViewCellHasReuseIdentifier() {
//        let cell = tableVC.tableView(tableVC.headlinesTableView, cellForRowAt: IndexPath(row: 1, section: 0)) as? HeadlinesTableViewCell
//        let actualReuseIdentifer = cell?.reuseIdentifier
//        let expectedReuseIdentifier = "cell"
//        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
//    }
    
    func testHeadlinesData(){
        let exp = expectation(description: "Waiting for Api to complete.")
        MockApi.shared.getHedalinesData( expecting: Headlines.self) {  result in
            switch result{
                
            case .success(let result):
                XCTAssertNotNil(result)
                self.articles = result.articles
                exp.fulfill()
            case .failure(let error):
                XCTAssertNil(error)
                XCTFail()
                
            }
        }
        wait(for: [exp], timeout: 10.0)
    }
    
    func testresultCount(){
        let count = viewModel.resultCount()
        XCTAssertNotNil(count)
        
        
    }
    
}
