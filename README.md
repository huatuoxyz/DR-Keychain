DRKeychain
==========

Usage
-----

Add or Update

	[DRKeychain updateValue:@"1234567890ABCDEFG"
					account:@"dongri.jin@drecom.co.jp"
					service:@"sample"
					group:@"79UJGB84V7.share"];

Delete

	[DRKeychain deleteValueWithAccount:@"dongri.jin@drecom.co.jp"
					service:@"sample"
					group:@"79UJGB84V7.share"];

Dump items

	NSArray* items = [DRKeychain getItemsWithServices:@"sample" group:@"79UJGB84V7.share"];
	NSLog(@"%@", [NSString stringWithFormat:@"%@",items])

Installation
-----------
	DRKeychain/
 		DRKeychain.h
 		DRKeychain.m

License
-------
MIT

Copyright (c) 2011 Dongri Jin
