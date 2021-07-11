//
//  ViewController.m
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 11/07/21.
//

#import "MainViewController.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)viewDidAppear:(BOOL)animated{
    
}


#pragma tableview delegates
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
        CardListTableViewCell *cell = [self.tblView dequeueReusableCellWithIdentifier:@"card_item_template" forIndexPath:indexPath];
        return cell;
    }else{
        return nil;
    }
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.viewModel.selectedCard = (CardModel*)[self.viewModel.listCard objectAtIndex:indexPath.row];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 125;
}

#pragma end


@end
