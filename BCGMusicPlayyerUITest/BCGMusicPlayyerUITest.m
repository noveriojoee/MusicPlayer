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
//
//    XCUIApplication *app = [[XCUIApplication alloc] init];
//    [app.textFields[@"Search"] tap];
//    [app.toolbars[@"Toolbar"].buttons[@"Done"] tap];
    
    XCUIElement *searchTextField = app.textFields[@"tf_search"];
    XCUIElement *btnPlay = app.textFields[@"btn_play"];
    XCUIElement *btnPause = app.textFields[@"btn_pause"];
    XCUIElement *btnFF = app.textFields[@"btn_ff"];
    XCUIElement *btnBF = app.textFields[@"btn_bf"];
    
    
    sleep(1);
    [searchTextField tap];
    [searchTextField typeText:@"Adele Hello"];
    XCUIElement *doneButton = app.toolbars[@"Toolbar"].buttons[@"Done"];
    [doneButton tap];
    sleep(10);
    [btnPlay tap];
    sleep(5);
    [btnPause tap];
    sleep(10);
    [btnFF tap];
    sleep(10);
    [btnBF tap];
    sleep(10);
    
    [searchTextField tap];
    while([searchTextField.value count] > 0){
        [app.keys[@"Delete"] tap];
    }
    [searchTextField typeText:@"Ariel Noah"];
    [doneButton tap];
    sleep(10);
    [app.tables/*@START_MENU_TOKEN@*/.staticTexts[@"Bintang Di Surga"]/*[[".cells.staticTexts[@\"Bintang Di Surga\"]",".staticTexts[@\"Bintang Di Surga\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    sleep(10);
    [app.buttons[@"pause"] tap];
    
    

    
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
