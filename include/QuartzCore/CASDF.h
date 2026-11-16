/* <QuartzCore/CASDF.h> - the signed distance field layers and effects (private on macOS, used by AppKit/SwiftUI for Liquid Glass).
   A CASDFLayer draws the union of its CASDFElementLayer shapes as a distance field and runs one effect on it; the glass body itself is the glassBackground CAFilter (see CAFilter.h). */
#ifndef WSBSD_CASDF_H
#define WSBSD_CASDF_H
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/CALayer.h>

@interface CASDFEffect : NSObject <NSSecureCoding, NSCopying>
+ (NSString *)name;                 /* the display name ("Glass Displacement") */
+ (NSDictionary *)defaultValues;    /* property name -> default */
+ (NSDictionary *)CA_attributes;    /* property name -> type / slider range, as the real class reports */
@end
@interface CASDFFillEffect : CASDFEffect
@property CGColorRef color;
@end
@interface CASDFGradientEffect : CASDFEffect
@property(copy) NSArray *colors, *distances, *interpolations; @property BOOL premultiplied;
@end
@interface CASDFGradientContourEffect : CASDFEffect
@property CGColorRef startColor, endColor; @property double angle, radius, shadowEffectOffset, shadowGradientStart, shadowGradientEnd, shadowAlpha, gradientOffset;
@end
@interface CASDFShadowEffect : CASDFEffect
@property CGColorRef color; @property double radius; @property CGSize offset; @property BOOL punchout, invert;
@end
@interface CASDFKeyFillHighlightEffect : CASDFEffect
@property CGColorRef keyColor, fillColor;
@property double keyHeightScale, keyHeightOffset, keySpreadScale, keySpreadOffset, fillHeightScale, fillHeightOffset, fillSpreadScale, fillSpreadOffset;
@property double keyHeight, keyAngle, keySpread, keyAmount, fillHeight, fillAngle, fillSpread, fillAmount, curvature; @property BOOL global;
@end
@interface CASDFOutputEffect : CASDFEffect
@property double minimum, maximum;
@end
@interface CASDFVisualizationEffect : CASDFEffect
@end
@interface CASDFGlassDisplacementEffect : CASDFEffect
@property double height, curvature, angle, maskOffset;
@end
@interface CASDFGlassHighlightEffect : CASDFEffect
@property CGColorRef color; @property double height, angle, spread, amount, curvature; @property BOOL global;
@end

@interface CASDFLayer : CALayer
@property(strong) CASDFEffect *effect;
@property double smoothness, gaussianRadius, effectOffset; @property BOOL mergeElements;
@end
@interface CASDFElementLayer : CALayer
@property(copy) NSString *mode, *operation;     /* "bounds" / "union" by default */
@property double contentsZeroValueDistance, contentsOneValueDistance, gradientOvalization; @property BOOL hitTestsAsFill;
@end
#endif
