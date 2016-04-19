//
//  ViewController.m
//  HHAppJumpTow
//
//  Created by xoxo on 16/4/19.
//  Copyright © 2016年 caohuihui. All rights reserved.
//

#import "ViewController.h"
#import "HHEncodeTool.h"

@interface ViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

#pragma mark - 父类方法 -
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _textView.delegate = self;
    [self addNotification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [self removeNotification];
}

#pragma mark - 通知管理 -
#pragma mark - 添加通知
-(void)addNotification{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(appOpenWithUrlNotification:) name:HHApplicationOpenWithUrlNotification object:nil];
}

#pragma mark - 移除通知
-(void)removeNotification{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:HHApplicationOpenWithUrlNotification object:nil];
}

#pragma mark - 协议 UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if([text isEqualToString:@"\n"]){
        [textView resignFirstResponder];
        return  NO;
    }
    return  YES;
}

#pragma mark - 跳转App按钮 -
- (IBAction)clickJumpAppButton:(id)sender {
    NSString * param = _textView.text;
    param = [HHEncodeTool encodedBase64:param];
    NSString * urlString  = [NSString stringWithFormat:@"HHAppJumpOne-Tow://%@",param];
    [self openApp:urlString];
    
}

-(void)openApp:(NSString *)string{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:string]];
}

#pragma mark - 其他方法 -
-(void)appOpenWithUrlNotification:(NSNotification *)notification{
    NSString * param = notification.object;
    param =  [HHEncodeTool decodeBase64:param];
    _textView.text = [NSString stringWithFormat:@"接收到参数:%@",param];
    NSLog(@"object:%@",param);
    
}
@end
