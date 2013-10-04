//
//  main.m
//  calendar
//
//  Created by Charlotte on 13年10月4日.
//  Copyright (c) 2013年 Charlotte. All rights reserved.
//

#import "calendar.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        calendar *cal=[[calendar alloc]init];
        cal.year=2013;
        cal.month=10;
        int days=[cal getFirstDateWithYear:[cal year] withMonth:[cal month]];
        NSLog(@"%d",days);
        
        [cal showCalWith:[cal year] withMonth:[cal month]];
        
        }
    return 0;
}

