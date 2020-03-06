//
//  KPKTestNSData+KPKBase32.m
//  KeePassKitTests macOS
//
//  Created by Michael Starke on 01.11.19.
//  Copyright © 2019 HicknHack Software GmbH. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KeePassKit.h"
#import "KeePassKit_Private.h"

@interface KPKTestNSData_KPKBase32 : XCTestCase

@end

@implementation KPKTestNSData_KPKBase32


- (void)testBase32Decoding {  
  NSDictionary <NSString*, NSString *> *values = @{
    @""       : @"",
    @"f"      : @"MY======",
    @"fo"     : @"MZXQ====",
    @"foo"    : @"MZXW6===",
    @"foob"   : @"MZXW6YQ=",
    @"fooba"  : @"MZXW6YTB",
    @"foobar" : @"MZXW6YTBOI======"
  };
  
  for(NSString *key in values) {
    NSData *expected = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *actual = [NSData dataWithBase32EncodedString:values[key]];
    XCTAssertEqualObjects(expected, actual);
  }
}

@end
