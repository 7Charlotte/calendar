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

//每个月的天数
-(int) getMonDayWithYear:(int)y withMonth:(int)m
{
    int mday[12]={31,28,31,30,31,30,31,31,30,31,30,31};
    
    if (( y % 4 == 0 && y % 100 != 0 ) || 0 == y % 400) {
        
        mday[1]=29;
    }
    
    return mday[m-1];
}

//每个月的第一天是星期几
-(int) getFirstDateWithYear:(int)y withMonth:(int)m
{
    int pastDays = 0;
    for (int i=1;i<m ; i++) {
        if(m<=12&&m>=1)
        pastDays+=[self getMonDayWithYear:y withMonth:i];
    }
    //算出今天是公元第几天，对7取模得到星期几
    int Date=( y + (y-1)/4 - (y-1)/100  + (y-1)/400  + pastDays )%7;
    
    return Date;
}


//格式化打印每个月，用C实现的。
-(void)showCalWithYear:(int)y withMonth:(int)m
{
    const int calLen=28;
    
    char* months[]={"January","February","March","April","May","June","July","August","September","October","November","December"};
    
    //strlen 取得数组元素的长度。
    unsigned long n = calLen / 2 -(strlen(months[month])+5)/2-1;
                        
    for (int i=0; i<n; i++) {
        printf(" ");
    }
    
    printf("%s %4d\n",months[m-1],y);
    printf("Sun Mon Tue Wed Tur Fri Sat \n");
    
    //取模结果减一得到当月第一天是星期几。
    int d=[self getFirstDateWithYear:y withMonth:m];
    
    //d is the weekday
    for (int i=0; i<d; i++) {
        printf("    ");
    }
    
    for (int i=1; i<=[self getMonDayWithYear:y withMonth:m]; i++) {
        
        //空一个，占3个字符，左对齐打印
        printf(" %-3d",i);
        
        d++;
        
        //换行条件
        if (d==7) {
            printf("\n");
            d=0;
        }
    }
    printf("\n\n");
}

-(BOOL) inputCheckWithYear:(int)y withMonth:(int)m
{
    if ( month > 12 || month < 1 ) {
        NSLog(@"Invalid input.");
        return NO;
    }
    return YES;
}

@end
