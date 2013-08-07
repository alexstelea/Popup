#import "Panel.h"

@implementation Panel

@synthesize webview = _webview;

- (BOOL)canBecomeKeyWindow;
{
    return YES; // Allow Search field to become the first responder
}

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
//-(void)mouseDown:(NSEvent *)theEvent{
//    NSLog(@"%@", theEvent);
//    if ([theEvent type] == NSLeftMouseDown)
//    {
//        NSLog(@"YAY");
//        NSMenu *theMenu = [[NSMenu alloc] initWithTitle:@"Contextual Menu"];
//        [theMenu insertItemWithTitle:@"Beep" action:@selector(beep:) keyEquivalent:@"" atIndex:0];
//        [theMenu insertItemWithTitle:@"Honk" action:@selector(honk:) keyEquivalent:@"" atIndex:1];
//        [NSMenu popUpContextMenu:theMenu withEvent:theEvent forView:self.webview];
//    }
//}
//

@end
