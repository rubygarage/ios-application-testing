//
//  KifSwiftSupport.swift
//  testing_demoTests
//
//  Created by jowkame on 10/2/17.
//  Copyright © 2017 jowkame. All rights reserved.
//

import KIF
import XCTest

protocol TestableSupport {
    func tester(file : String, _ line : Int) -> KIFUITestActor
    func system(file : String, _ line : Int) -> KIFSystemTestActor
}

extension TestableSupport {
    func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self as! KIFTestActorDelegate)
    }
    
    func system(file : String = #file, _ line : Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self as! KIFTestActorDelegate)
    }
}

extension XCTestCase: TestableSupport {}

extension KIFTestActor: TestableSupport {}
