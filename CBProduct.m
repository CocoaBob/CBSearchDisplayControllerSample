//
//  Product.m
//  TableSearch
//
//  Created by CocoaBob on 07/13/09.
//  Copyright 2009 CocoaBob. All rights reserved.
//

#import "CBProduct.h"

@implementation CBProduct

+ (id)productWithType:(NSString *)type name:(NSString *)name {
	CBProduct *newProduct = [[[self alloc] init] autorelease];
	newProduct.type = type;
	newProduct.name = name;
	return newProduct;
}

- (void)dealloc {
	[self.type release];
	[self.name release];
	[super dealloc];
}

@end
