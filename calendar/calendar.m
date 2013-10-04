//
//  calendar.m
//  calendar
//
//  Created by Charlotte on 13年10月4日.
//  Copyright (c) 2013年 Charlotte. All rights reserved.
//

#import "calendar.h"

@implementation calendar
@synthesize year,month;


-(int) getMonDayWithYear:(int)y withMonth:(int)m
{
    int mday[12]={31,28,31,30,31,30,31,31,30,31,30,31};
    
    if (( y % 4 == 0 && y % 100 != 0 ) || 0 == y % 400) {
        mday[1]=29;
    }
    
    return mday[m-1];
}

-(int) getFirstDateWithYear:(int)y withMonth:(int)m
{
    int pastDays = 0;
    for (int i=0;i<m ; i++) {
        if(m<=12&&m>=1)
        pastDays+=[self getMonDayWithYear:y withMonth:m];
    }
    
    int Date=( y-1 + (y-1)/4 - (y-1)/100  + (y-1)/400  + pastDays )%7;
    
    return Date;
}

-(void)showCalWith:(int)y withMonth:(int)m
{
    //const int calLen=28;
    
    NSArray *months=[NSArray arrayWithObjects:@"January",@"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December", nil];
    
    /*unsigned long n = calLen / 2 -([[months objectAtIndex:month] length]+5)/2-1;
                          
    for (int i=0; i<n; i++) {
        NSLog(@" ");
    }*/
    
    NSLog(@"%@ %4d\n",[months objectAtIndex:month],y);
    NSLog(@"Sun Mon Tue Wed Tur Fri Sat ");
    

}
@end
