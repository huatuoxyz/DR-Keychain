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


Image

![Example](http://s2.i1.picplzthumbs.com/upload/img/4e/88/eb/4e88eb76c3269e6d68d533786648e56e78f6ab3d_400r.jpg "Optional title")

Installation
-----------
	DRKeychain/
 		DRKeychain.h
 		DRKeychain.m

License
-------
MIT

Copyright (c) 2011 Dongri Jin
