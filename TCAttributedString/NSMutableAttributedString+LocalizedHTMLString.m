#import "NSMutableAttributedString+LocalizedHTMLString.h"

@implementation NSMutableAttributedString (LocalizedHTMLString)

+ (NSMutableAttributedString *)attributedStringWithHTMLString:(NSString *)htmlString
{
    NSMutableAttributedString *attributedString = [NSMutableAttributedString attributedStringWithString:htmlString fontSize:16.0f textColor:[UIColor darkGrayColor]];

    return attributedString;
}

+ (NSMutableAttributedString *)attributedStringWithHTMLString:(NSString *)htmlString fontSize:(CGFloat)fontSize
{
    NSMutableAttributedString *attributedString = [NSMutableAttributedString attributedStringWithString:htmlString fontSize:fontSize textColor:[UIColor blueColor]];
    
    return attributedString;
}

+ (NSMutableAttributedString *)attributedStringWithHTMLString:(NSString *)htmlString fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor
{
    NSMutableAttributedString *attributedString = [NSMutableAttributedString attributedStringWithString:htmlString fontSize:fontSize textColor:textColor];
    
    return attributedString;
}

+ (NSMutableAttributedString *)attributedStringWithHTMLString:(NSString *)htmlString fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment
{
    NSMutableAttributedString *attributedString = [NSMutableAttributedString attributedStringWithString:htmlString fontSize:fontSize textColor:textColor];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = textAlignment;
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedString.length)];
    
    return attributedString;
}

// Converting String to Attributed String

+ (NSMutableAttributedString *)attributedStringWithString:(NSString *)htmlString fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor
{
    NSData *data = [htmlString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithData:data options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];

    NSRange range = NSMakeRange(0, attributedString.length);
    [attributedString enumerateAttribute:NSFontAttributeName inRange:range options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(id value, NSRange range, BOOL *stop) {
        UIFont *currentFont = value;
        UIFont *replacementFont = nil;
                
        if ([currentFont.fontName rangeOfString:@"bold" options:NSCaseInsensitiveSearch].location != NSNotFound) {
            replacementFont = [UIFont boldSystemFontOfSize:fontSize];
        } else if ([currentFont.fontName rangeOfString:@"italic" options:NSCaseInsensitiveSearch].location != NSNotFound) {
            replacementFont = [UIFont italicSystemFontOfSize:fontSize];
        } else {
            replacementFont = [UIFont systemFontOfSize:fontSize];
        }
        [attributedString addAttributes:@{NSFontAttributeName:replacementFont, NSForegroundColorAttributeName:textColor} range:range];
    }];
    return attributedString;
}

@end