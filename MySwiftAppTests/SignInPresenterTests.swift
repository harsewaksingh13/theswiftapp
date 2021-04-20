//
//  SignInPresenterTests.swift
//  MySwiftAppTests
//
//  Created by Harsewak Singh on 17/04/2021.
//  Copyright © 2021 Harsewak Singh. All rights reserved.
//

import XCTest
@testable import MySwiftApp

class MockSignInView: SignInView {
    var onEmptyEmailCalled: Bool = false
    func getEmail() -> String {
       return ""//test@gmail.com"
    }
    
    func getPassword() -> String {
        return "113242"
    }
    
    func onEmptyEmail() {
         //"Email is required"
        onEmptyEmailCalled = true
    }
    
    func onEmptyPassword() {
        // "Password is required"
    }
    
    func onInvalidEmail() {
        //"Email is invalid"
    }
    
    func onWeakPassword() {
        //"Passwrod is too weak"
    }
    
    func setBackgroundColor(color: UIColor) {
        
    }
    
    func onError(error: String) {
        //
    }
    
    func viewController() -> UIViewController {
        return SignInViewController()
    }
    
    
}

class SignInPresenterTests: XCTestCase {
    
    let view = MockSignInView()
     lazy var sut: SignInPresenter = {
        return  SignInPresenterImpl(view: self.view)
    }()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sut.signIn()
        XCTAssertTrue(view.onEmptyEmailCalled)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
