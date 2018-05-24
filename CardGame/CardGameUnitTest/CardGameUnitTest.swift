//
//  CardGameUnitTest.swift
//  CardGameUnitTest
//
//  Created by Jung seoung Yeo on 2018. 5. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class CardGameUnitTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Make_Suits() {
        let suit = Suits.spade
        XCTAssertNotNil(suit)
    }
    
    func test_Make_Rank() {
        let rank = Rank.Ace
        XCTAssertNotNil(rank)
    }
    
    func test_Make_Card() {
        let suit = Suits.spade
        let rank = Rank.Ace
        let card = Card(suit, rank)
        XCTAssertNotNil(card)
    }
    
    func test_Make_DecK() {
        let deck = Deck()
        XCTAssertNotNil(deck)
    }
    
    func test_countOfDeck() {
        let deck = Deck()
        let expected = deck.count()
        XCTAssertEqual(52, expected)
    }
    
    func test_equaltDeck() {
        let firstDeck = Deck()
        let secondeDeck = Deck()
        XCTAssertEqual(firstDeck, secondeDeck)
    }
    
    func test_DeckShuffle() {
        let firstDeck = Deck()
        var secondDeck = Deck()
        secondDeck.shuffle()
        XCTAssertNotEqual(firstDeck, secondDeck)
    }
    
    func test_drawDeckAfterDownCount() {
        var deck = Deck()
        let originCount = deck.count()
        let _ = deck.removeOne()
        let afterCount = deck.count()
        XCTAssertNotEqual(originCount, afterCount)
    }
    
    func test_deckReset() {
        var deck = Deck()
        let originCount = deck.count()
        let _ = deck.removeOne()
        deck.reset()
        XCTAssertEqual(originCount, deck.count())
    }
    
    func test_Make_Deeler() {
        let deck = Deck()
        let deeler = Deeler(deck)
        XCTAssertNotNil(deeler)
    }
    
    func test_Deeler_recievedOrderReset() throws {
        let deck = Deck()
        var deeler = Deeler(deck)
     
        let expectedOrderReset = Order.init(rawValue: "1")
        try deeler.receivedOrder(expectedOrderReset)
        
        XCTAssertEqual(deck, deeler.deck)
        
    }
    
    func test_DeelerRecievedOderShuffle() throws {
        let deck = Deck()
        var deeler = Deeler(deck)
        
        let expectedOrderShuffle = Order.init(rawValue: "2")
        try deeler.receivedOrder(expectedOrderShuffle)
        
        XCTAssertNotEqual(deck, deeler.deck)
    }
    
    func test_DeelerRecivedOderDraw() throws {
        let deck = Deck()
        var deeler = Deeler(deck)
        
        let expectedOrderDraw = Order.init(rawValue: "3")
        try deeler.receivedOrder(expectedOrderDraw)
        
        XCTAssertNotEqual(deck.count(), deeler.deck.count())
    }
}
