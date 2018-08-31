//
//  HouseKeeper.h
//  mobilephonebank
//
//  Created by luwentao on 2018/8/23.
//  Copyright © 2018年 cmb. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol Service<NSObject>
- (void) cleaning;
@end
@interface HouseKeeper : NSObject<Service>

@end
