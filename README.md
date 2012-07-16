DRKeychain
==========

Usage
-----

Add or Update

	[DRKeychain updateValue:@"1234567890ABCDEFG"
					account:@"dongri.jin@drecom.co.jp"
					service:@"sample"
					group:@"79UJGB84V7.share"];

Get Value

	NSString *value = [DRKeychain getValueWithAccount:@"dongri.jin@drecom.co.jp" 
					service:@"sample" 
					group:@"79UJGB84V7.share"];
	NSLog(@"%@", value);

Delete

	[DRKeychain deleteValueWithAccount:@"dongri.jin@drecom.co.jp"
					service:@"sample"
					group:@"79UJGB84V7.share"];

Dump items

	NSArray* items = [DRKeychain getItemsWithServices:@"sample" group:@"79UJGB84V7.share"];
	NSLog(@"%@", [NSString stringWithFormat:@"%@",items])


Image

![Example](http://farm9.staticflickr.com/8159/7582487408_87af5b403f_z_d.jpg "Optional title")

Installation
-----------
	DRKeychain/
 		DRKeychain.h
 		DRKeychain.m

License
-------
MIT

Copyright (c) 2012 Dongri Jin
