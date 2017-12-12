//
//  testing_demoTests.swift
//  testing_demoTests
//
//  Created by jowkame on 10/2/17.
//  Copyright © 2017 jowkame. All rights reserved.
//

import XCTest
import Quick
import Nimble
import OHHTTPStubs
@testable import testing_demo

class FirstTestSpec: QuickSpec {
    override func setUp() {
        super.setUp()
        
        stub(condition: isHost("www.recipepuppy.com")) { _ in
            let stubPath = OHPathForFile("puppy_response.json", type(of: self))
            return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
        }
        
        OHHTTPStubs.setEnabled(true, for: URLSession.shared.configuration)
    }
    
    override func spec() {
        describe("Our first tests set") {
            it("check ContactRecord class structure") {
                let obj = ContactRecord()
                
                expect(obj.name).to(beAKindOf(String.self))
                expect(obj.phone).to(beAKindOf(Int.self))
                
                expect(obj.name.count).to(equal(0))
                expect(obj.phone).to(equal(0))
            }
        }
        
        describe("Network test") {
            it("perform simple request") {
                waitUntil { done in
                    ApiClient.loadRecepies(ingredients: "onions,garlic") { (result) in
                        expect(result.count).to(equal(10))
                        
                        done()
                    }
                }
            }
            
            afterEach {
                OHHTTPStubs.removeAllStubs()
            }
        }
        
        
    }
}


