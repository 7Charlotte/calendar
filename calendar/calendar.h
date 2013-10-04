//
//  calendar.h
//  calendar
//
//  Created by Charlotte on 13年10月4日.
//  Copyright (c) 2013年 Charlotte. All rights reserved.
//

#import "calendar.h"

@interface calendar : NSObject
@property int year,month;

-(int) getMonDayWithYear:(int) y withMonth:(int)m;
-(int) getFirstDateWithYear:(int)y withMonth:(int)m;

-(void) showCalWithYear:(int)y withMonth:(int) m;

-(BOOL) inputCheckWithYear:(int) y withMonth:(int) m;

@end
