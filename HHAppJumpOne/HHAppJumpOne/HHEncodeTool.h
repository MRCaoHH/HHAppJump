//
//  HHEncodeTool.h
//  HHAppJumpTow
//
//  Created by xoxo on 16/4/19.
//  Copyright © 2016年 caohuihui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHEncodeTool : NSObject
/**
 *  字符串base64加密
 *
 *  @param string 待加密的字符串
 *
 *  @return 加密后的字符串
 */
+(NSString *)encodedBase64:(NSString *)string;

/**
 *  解密base64字符串
 *
 *  @param string 待解密的字符串
 *
 *  @return 解密后的字符串
 */
+(NSString *)decodeBase64:(NSString *)string;

@end
