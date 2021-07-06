//
//  TryCatch.m
//  TeacherAccessEmployer
//
//  Created by Abhishek Banerjee on 11/05/17.
//  Copyright © 2017 TechAhead Software Pvt. Ltd. All rights reserved.
//

#import "TryCatch.h"

@implementation TryCatch

+(void)try:(void(^)())try catch:(void(^)(NSException*exception))catch finally:(void(^)())finally
{
    @try
    {
        try ? try() : nil;
    }
    @catch (NSException *exception)
    {
        catch ? catch(exception) : nil;
    }
    @finally
    {
        finally ? finally() : nil;
    }
}

@end
