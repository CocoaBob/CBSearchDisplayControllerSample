//
//  Product.h
//  TableSearch
//
//  Created by CocoaBob on 07/13/09.
//  Copyright 2009 CocoaBob. All rights reserved.
//

@interface CBProduct : NSObject

@property (nonatomic, copy) NSString *type, *name;

+ (id)productWithType:(NSString *)type name:(NSString *)name;

@end
