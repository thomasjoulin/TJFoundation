//
//  UIWebView+Youtube.m
//  TJFoundation
//
//  Created by Thomas Joulin on 3/20/13.
//
//

#import "UIWebView+Youtube.h"

@implementation UIWebView (Youtube)

- (void)loadYouTubeVideoWithId:(NSString *)videoId inRect:(CGRect)frame
{
    NSString *urlString = [NSString stringWithFormat:@"https://www.youtube.com/v/%@?version=3&f=user_uploads&app=youtube_gdata", videoId];
    NSString *embedHTML = @"\
                            <html>\
                            <head>\
                            <meta name=\"viewport\" content=\"initial-scale=1.0, user-scalable=no, width=%0.0f\"/>\
                            </head>\
                            <body style=\"background:#fff;margin:0px;padding:0px\">\
                            <div><object width=\"%0.0f\" height=\"%0.0f\">\
                            <param name=\"movie\" value=\"%@\"></param><param name=\"wmode\"\
                            value=\"transparent\"></param>\
                            <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\"\
                            wmode=\"transparent\" width=\"%0.0f\" height=\"%0.0f\"></embed>\
                            </object></div>\
                            </body>\
                            </html>";
    
    NSString *html = [NSString stringWithFormat:embedHTML, frame.size.width, frame.size.width, frame.size.height, urlString, urlString, frame.size.width, frame.size.height];

    [self loadHTMLString:html baseURL:nil];
}

@end
