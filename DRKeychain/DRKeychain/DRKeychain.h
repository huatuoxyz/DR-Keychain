//
//  DRKeychain.h
//  DRKeychain
//
//  Created by Dongri Jin on 12/05/20.
//  Copyright (c) 2012年 @dongriab. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DRKeychain : NSObject {
    
}

+ (BOOL)updateValue:(NSString *)value account:(NSString *)account service:(NSString *)service group:(NSString *)group;
+ (NSString*)getValueWithAccount:(NSString *)account service:(NSString *)service group:(NSString *)group;
+ (BOOL)deleteValueWithAccount:(NSString *)account service:(NSString *)service group:(NSString *)group;

+ (BOOL)updateValue:(NSString *)value account:(NSString*)account service:(NSString*)service;
+ (NSString*)getValueWithAccount:(NSString *)account service:(NSString *)service;
+ (BOOL)deleteValueWithAccount:(NSString *)account service:(NSString *)service;

+ (NSArray*)getItemsWithService:(NSString*)service;
+ (NSArray*)getItemsWithService:(NSString*)service group:(NSString *)group;

@end
