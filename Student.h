//
//  Student.h
//  mobilephonebank
//
//  Created by luwentao on 2018/8/23.
//  Copyright © 2018年 cmb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HouseKeeper.h"

@interface Student:NSObject
@property id<Service> delegete;
- (void) wrapperService;
@end



