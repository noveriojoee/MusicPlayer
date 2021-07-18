//
//  BCGMusicPlayyerUITest.m
//  BCGMusicPlayyerUITest
//
//  Created by Noverio Joe on 18/07/21.
//

#import <XCTest/XCTest.h>

@interface BCGMusicPlayyerUITest : XCTestCase

@end

@implementation BCGMusicPlayyerUITest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}


- (void)testExample {
    // UI tests must launch the application that they test.
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    XCUIElement* tfSearch = app/*@START_MENU_TOKEN@*/.textFields[@"tf_search"]/*[[".textFields[@\"Search\"]",".textFields[@\"tf_search\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/;
    XCUIElement* btnPlay = app.buttons[@"btn_play"];
    XCUIElement* btnPause = app.buttons[@"btn_pause"];
    XCUIElement* btnFF = app.buttons[@"btn_ff"];
    XCUIElement* btnBF = app.buttons[@"btn_bf"];
    
    [tfSearch tap];
    [tfSearch typeText:@"Adele Hello"];
    [app.toolbars[@"Toolbar"].buttons[@"Done"] tap];
    sleep(10);
    [btnPlay tap];
    sleep(50);
    [btnPause tap];
    sleep(5);
    [btnPlay tap];
    sleep(5);
    [btnPause tap];
    sleep(5);
    [btnPlay tap];
    sleep(10);
    [btnFF tap];
    sleep(25);
    [btnBF tap];
    sleep(25);
    
    XCUIElementQuery *tablesQuery = [[XCUIApplication alloc] init].tables;
    [tablesQuery/*@START_MENU_TOKEN@*/.staticTexts[@"Uncharted (Deluxe Edition)"]/*[[".cells.staticTexts[@\"Uncharted (Deluxe Edition)\"]",".staticTexts[@\"Uncharted (Deluxe Edition)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ swipeUp];
    [[[tablesQuery childrenMatchingType:XCUIElementTypeCell] elementBoundByIndex:4].staticTexts[@"Hello / Lacrimosa"] swipeDown];
    
    
    
    
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testLaunchPerformance {
    if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, *)) {
        // This measures how long it takes to launch your application.
        [self measureWithMetrics:@[[[XCTApplicationLaunchMetric alloc] init]] block:^{
            [[[XCUIApplication alloc] init] launch];
        }];
    }
}

@end
