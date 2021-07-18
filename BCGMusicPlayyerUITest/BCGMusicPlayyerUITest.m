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


-(void)testButtons{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];
    
    XCUIElement* btnPlay = app.buttons[@"btn_play"];
    XCUIElement* btnPause = app.buttons[@"btn_pause"];
    XCUIElement* btnFF = app.buttons[@"btn_ff"];
    XCUIElement* btnBF = app.buttons[@"btn_bf"];
    sleep(5);
    [btnPlay tap];
    //Wait for download songs and play
    sleep(15);
    [btnPause tap];
    sleep(5);
    [btnPlay tap];
    sleep(5);
    [btnFF tap];
    //Wait for download songs and play
    sleep(15);
    [btnBF tap];
    //Wait for download songs and play
    sleep(15);
    
    XCUIElement *element = [[[[[[XCUIApplication alloc] init].tables childrenMatchingType:XCUIElementTypeCell] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:0];
    [element swipeUp];
    [element swipeDown];
        
}

- (void)testPlayAndSwipe {
    // UI tests must launch the application that they test.
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    XCUIElementQuery *tablesQuery = app.tables;
    [tablesQuery/*@START_MENU_TOKEN@*/.staticTexts[@"Trunk Music: Harry Bosch Series, Book 5 (Unabridged)"]/*[[".cells.staticTexts[@\"Trunk Music: Harry Bosch Series, Book 5 (Unabridged)\"]",".staticTexts[@\"Trunk Music: Harry Bosch Series, Book 5 (Unabridged)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ swipeUp];
    [tablesQuery/*@START_MENU_TOKEN@*/.staticTexts[@"Hello"]/*[[".cells.staticTexts[@\"Hello\"]",".staticTexts[@\"Hello\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    
    XCUIElement *btnBfButton = app/*@START_MENU_TOKEN@*/.buttons[@"btn_bf"]/*[[".buttons[@\"backward.end\"]",".buttons[@\"btn_bf\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/;
    [btnBfButton tap];
    sleep(5);
    [btnBfButton tap];
    sleep(5);
    [app/*@START_MENU_TOKEN@*/.textFields[@"tf_search"]/*[[".textFields[@\"Search\"]",".textFields[@\"tf_search\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    sleep(5);
    [app/*@START_MENU_TOKEN@*/.textFields[@"tf_search"]/*[[".textFields[@\"Search\"]",".textFields[@\"tf_search\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ typeText:@"ariel noah"];
    sleep(5);
    [app.toolbars[@"Toolbar"].buttons[@"Done"] tap];
    sleep(5);
    [/*@START_MENU_TOKEN@*/[tablesQuery.cells containingType:XCUIElementTypeStaticText identifier:@"One for All"].element/*[["tablesQuery","[",".cells containingType:XCUIElementTypeStaticText identifier:@\"ZOMBIES 2 (Original TV Movie Soundtrack)\"].element",".cells containingType:XCUIElementTypeStaticText identifier:@\"Milo Manheim, Meg Donnelly, Kylee Russell, Trevor Tordjman, Carla Jeffery, Chandler Kinney, Pearce Joza, Baby Ariel, Emilia McCarthy, Jasmine Renee Thomas & Noah Zulfikar\"].element",".cells containingType:XCUIElementTypeStaticText identifier:@\"One for All\"].element"],[[[-1,0,1]],[[1,4],[1,3],[1,2]]],[0,0]]@END_MENU_TOKEN@*/ tap];
    sleep(5);
    [[tablesQuery.cells containingType:XCUIElementTypeStaticText identifier:@"Bintang Di Surga"].staticTexts[@"peterpan"] tap];
    sleep(5);
    [app/*@START_MENU_TOKEN@*/.buttons[@"btn_pause"]/*[[".buttons[@\"pause\"]",".buttons[@\"btn_pause\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    sleep(10);
   
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
