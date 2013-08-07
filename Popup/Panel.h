#import <WebKit/WebKit.h>

@class WebView;
@interface Panel : NSPanel{
    WebView* webview;
    NSURLRequest* request;
}
@property (assign) IBOutlet WebView *webview;
@end
