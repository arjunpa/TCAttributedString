@import Foundation;
@import UIKit;

@interface NSMutableAttributedString (LocalizedHTMLString)

+ (NSMutableAttributedString *)attributedStringWithHTMLString:(NSString *)htmlString;
+ (NSMutableAttributedString *)attributedStringWithHTMLString:(NSString *)htmlString fontSize:(CGFloat)fontSize;
+ (NSMutableAttributedString *)attributedStringWithHTMLString:(NSString *)htmlString fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor;
+ (NSMutableAttributedString *)attributedStringWithHTMLString:(NSString *)htmlString fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment;

@end