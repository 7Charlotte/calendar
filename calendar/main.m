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
        /*--s--*/
        //输入calendar时 ，打印当年日历。
        if (argc == 1) {
            //获得当前年份
            NSDate *today=[NSDate date];
            NSCalendar *gregorian=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
            NSDateComponents *yearComponents=[gregorian components:NSYearCalendarUnit fromDate:today];
            NSInteger _year = [yearComponents year];
            
            //传入当前年份,遍历月份
            for (int i=1; i<=12; i++) {
                
                [cal showCalWithYear:_year withMonth:i];
                
                int count=1;
                
                count++;
                
                if(count%3 == 0)
                {
                    printf("\n");
                }
                
            }

        }
        /*--e--*/
        //要求用户按照yyyyMM格式输入，否则提示出错。
        else if(strlen(argv[1]) == 6){
            [cal setYear:1000 * (argv[1][0] - '0') + 100 * (argv[1][1] - '0')
             + 10 * (argv[1][2] - '0') + (argv[1][3] - '0')];
            
            [cal setMonth:10 * (argv[1][4] - '0') + (argv[1][5] - '0')];
            [cal showCalWithYear:[cal year] withMonth:[cal month]];
        }
        else
        {
            NSLog(@"喵~");
        }
    }
    return 0;
}