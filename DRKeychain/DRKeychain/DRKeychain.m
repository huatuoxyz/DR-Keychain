//
//  DRKeychain.m
//  DRKeychain
//
//  Created by Dongri Jin on 12/05/20.
//  Copyright (c) 2012年 @dongriab. All rights reserved.
//

#import <Security/Security.h>
#import "DRKeychain.h"

@implementation DRKeychain

+ (NSString*)getValueWithAccount:(NSString *)account service:(NSString *)service group:(NSString *)group{
	if (account == nil || service == nil) {
		return nil;
	}
	NSMutableDictionary *query = [NSMutableDictionary dictionary];
	[query setObject:(id)kSecClassGenericPassword forKey:(id)kSecClass];
	[query setObject:(id)service forKey:(id)kSecAttrService];
	[query setObject:(id)account forKey:(id)kSecAttrAccount];
	[query setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    if (group != nil) {
        [query setObject:(id)group forKey:(id)kSecAttrAccessGroup];
    }
	NSString *value = nil;
	NSData *valueData = nil;
	OSStatus err = SecItemCopyMatching((CFDictionaryRef)query,(CFTypeRef *)&valueData);
	if (err == noErr) {
		value = [[[NSString alloc] initWithData:valueData encoding:NSUTF8StringEncoding] autorelease];
		[valueData release];
	} else if(err == errSecItemNotFound) {
		[valueData release];
	} else {
		NSLog(@"SecItemCopyMatching: error(%ld)", err);
	}
	return value;
}

+ (BOOL)updateValue:(NSString *)value account:(NSString *)account service:(NSString *)service group:(NSString *)group{
    BOOL result = NO;
    if (account == nil || service == nil || value == nil) {
        return result;
    }
	NSMutableDictionary *attributes = nil;
	NSMutableDictionary *query = [NSMutableDictionary dictionary];
	NSData *valueData = [value dataUsingEncoding:NSUTF8StringEncoding];
	[query setObject:(id)kSecClassGenericPassword forKey:(id)kSecClass];
	[query setObject:(id)service forKey:(id)kSecAttrService];
	[query setObject:(id)account forKey:(id)kSecAttrAccount];
    if (group != nil) {
        [query setObject:(id)group forKey:(id)kSecAttrAccessGroup];
    }
	OSStatus err = SecItemCopyMatching((CFDictionaryRef)query, NULL);
	if (err == noErr) {
		//SecItemUpdate
		attributes = [NSMutableDictionary dictionary];
		[attributes setObject:valueData forKey:(id)kSecValueData];
		[attributes setObject:[NSDate date] forKey:(id)kSecAttrModificationDate];
        if (group != nil) {
            [attributes setObject:(id)group forKey:(id)kSecAttrAccessGroup];
        }
		err = SecItemUpdate((CFDictionaryRef)query, (CFDictionaryRef)attributes);
		if (err == noErr) {
			result = YES;
		} else {
			NSLog(@"SecItemUpdate: error(%ld)", err);
		}
	} else if (err == errSecItemNotFound) {
		//SecItemAdd
		attributes = [NSMutableDictionary dictionary];
		[attributes setObject:(id)kSecClassGenericPassword forKey:(id)kSecClass];
		[attributes setObject:(id)service forKey:(id)kSecAttrService];
		[attributes setObject:(id)account forKey:(id)kSecAttrAccount];
		[attributes setObject:valueData forKey:(id)kSecValueData];
		[attributes setObject:[NSDate date] forKey:(id)kSecAttrCreationDate];
		[attributes setObject:[NSDate date] forKey:(id)kSecAttrModificationDate];
        if (group != nil) {
            [attributes setObject:(id)group forKey:(id)kSecAttrAccessGroup];
        }
		err = SecItemAdd((CFDictionaryRef)attributes, NULL);
		if (err == noErr) {
			result = YES;
		} else {
			NSLog(@"SecItemAdd: error(%ld)", err);
		}
    } else {
		NSLog(@"SecItemCopyMatching: error(%ld)", err);
	}
    if (err == -25243) {
        NSLog(@"Please run real iOS machine");
    }
	return result;
}

+ (BOOL)deleteValueWithAccount:(NSString *)account service:(NSString *)service group:(NSString *)group{
    BOOL result = NO;
    if (account == nil || service == nil) {
        return result;
    }
	NSMutableDictionary *query = [NSMutableDictionary dictionary];
	[query setObject:(id)kSecClassGenericPassword forKey:(id)kSecClass];
	[query setObject:(id)service forKey:(id)kSecAttrService];
	[query setObject:(id)account forKey:(id)kSecAttrAccount];
    if (group != nil) {
        [query setObject:(id)group forKey:(id)kSecAttrAccessGroup];
    }
    OSStatus err = SecItemDelete((CFDictionaryRef)query);
    if (err == noErr) {
		result = YES;
	} else {
		NSLog(@"SecItemDelete: error(%ld)", err);
	}
	return result;
}

+ (NSArray*)getItemsWithService:(NSString*)service group:(NSString *)group {
	if (service == nil) {
        return nil;
	}
	NSMutableDictionary *query = [NSMutableDictionary dictionary];
	[query setObject:(id)kSecClassGenericPassword forKey:(id)kSecClass];
	[query setObject:(id)service forKey:(id)kSecAttrService];
	[query setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnAttributes];
	[query setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
	[query setObject:(id)kSecMatchLimitAll forKey:(id)kSecMatchLimit];
    if (group != nil) {
        [query setObject:(id)group forKey:(id)kSecAttrAccessGroup];
    }
	CFArrayRef result = nil;
	OSStatus err = SecItemCopyMatching((CFDictionaryRef)query,
									   (CFTypeRef *)&result);
    
	if (err == noErr) {
		return [(NSArray *)result autorelease];
	} else {
		NSLog(@"SecItemCopyMatching: error(%ld)", err);
		return nil;
	}
}

+ (NSString*)getValueWithAccount:(NSString *)account service:(NSString*)service {
	return [self getValueWithAccount:account service:service group:nil];
}

+ (BOOL)updateValue:(NSString*)value account:(NSString*)account service:(NSString*)service {
    return [self updateValue:value account:account service:service group:nil];
}

+ (BOOL)deleteValueWithAccount:(NSString *)account service:(NSString *)service {
	return [self deleteValueWithAccount:account service:service group:nil];
}

+ (NSArray*)getItemsWithService:(NSString*)service {
    return [self getItemsWithService:service group:nil];
}

@end
