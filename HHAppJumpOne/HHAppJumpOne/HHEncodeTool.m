//
//  HHEncodeTool.m
//  HHAppJumpTow
//
//  Created by xoxo on 16/4/19.
//  Copyright © 2016年 caohuihui. All rights reserved.
//

#import "HHEncodeTool.h"

@implementation HHEncodeTool

/**
 *  字符串base64加密
 *
 *  @param string 待加密的字符串
 *
 *  @return 加密后的字符串
 */
+(NSString *)encodedBase64:(NSString *)string{
    NSData * data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

/**
 *  解密base64字符串
 *
 *  @param string 待解密的字符串
 *
 *  @return 解密后的字符串
 */
+(NSString *)decodeBase64:(NSString *)string{
    NSData * data = [[NSData alloc]
                     initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString * decodeString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    return  decodeString;
}

@end
