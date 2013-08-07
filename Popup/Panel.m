#import "Panel.h"

@implementation Panel

@synthesize webview = _webview;

- (void)awakeFromNib {
    
    NSURL *url = [NSURL URLWithString:@"http://youtube.com/"] ;
    request = [NSURLRequest requestWithURL:url];
    [self.webview setCustomUserAgent: @"Mozilla/5.0 (iPad; CPU OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3"];
    [[[self webview] mainFrame]loadRequest:request];


}
-(IBAction)openInChrome:(id)sender {
    NSString *str = self.webview.mainFrameURL;
    NSString *newStr;
    
    newStr = [str substringWithRange:NSMakeRange(9, [str length]-9)];
    
    NSString *combi = [NSString stringWithFormat:@"http://www.%@", newStr];
    NSLog(@"%@", combi);
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:combi]];
}


@end
