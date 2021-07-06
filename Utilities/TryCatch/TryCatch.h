//
//  TryCatch.h
//  TeacherAccessEmployer
//
//  Created by Abhishek Banerjee on 11/05/17.
//  Copyright © 2017 TechAhead Software Pvt. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TryCatch : NSObject

+ (void)try:(void(^)())try catch:(void(^)(NSException*exception))catch finally:(void(^)())finally;

@end
