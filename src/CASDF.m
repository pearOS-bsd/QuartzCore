/* The SDF layers and effects. Defaults read from the real QuartzCore (macOS 26.7.2, +defaultValues); where the real class has no default for a property (global of the highlights, maskOffset, premultiplied, the arrays) the value is zero/nil. See Solarium docs/APPLE-DECISIONS.md. */
#import <QuartzCore/CASDF.h>

static CGColorRef CASDFGray(CGFloat g) { return CGColorCreateGenericGray(g, 1); }

@implementation CASDFEffect
+ (BOOL)supportsSecureCoding { return YES; }
+ (NSString *)name { return @"Effect"; }
+ (NSDictionary *)defaultValues { return @{}; }
+ (NSDictionary *)CA_attributes { return @{}; }
- (id)copyWithZone:(NSZone *)z { CASDFEffect *e = [[[self class] alloc] init]; [e _copyFrom:self]; return e; }
- (void)_copyFrom:(CASDFEffect *)o {}
- (void)encodeWithCoder:(NSCoder *)c {}
- (instancetype)initWithCoder:(NSCoder *)c { return [self init]; }
@end

@implementation CASDFFillEffect
{ CGColorRef _color; }
+ (NSString *)name { return @"Fill"; }
+ (NSDictionary *)defaultValues { return @{ @"color": (__bridge id)CASDFGray(1) }; }
- (instancetype)init { if ((self = [super init])) { _color = CASDFGray(1); } return self; }
- (CGColorRef)color { return _color; }
- (void)setColor:(CGColorRef)c { CGColorRef n = c ? CGColorRetain(c) : NULL; if (_color) CGColorRelease(_color); _color = n; }
- (void)_copyFrom:(CASDFFillEffect *)o { [self setColor:((CASDFFillEffect *)o)->_color]; }
- (void)dealloc { if (_color) CGColorRelease(_color); }
@end

@implementation CASDFGradientEffect
@synthesize colors=_colors, distances=_distances, interpolations=_interpolations, premultiplied=_premultiplied;
+ (NSString *)name { return @"Gradient"; }
+ (NSDictionary *)defaultValues { return @{}; }
- (instancetype)init { if ((self = [super init])) { _premultiplied = 0; } return self; }
- (void)_copyFrom:(CASDFGradientEffect *)o { self.colors = ((CASDFGradientEffect *)o).colors; self.distances = ((CASDFGradientEffect *)o).distances; self.interpolations = ((CASDFGradientEffect *)o).interpolations; self.premultiplied = ((CASDFGradientEffect *)o).premultiplied; }
- (void)dealloc {  }
@end

@implementation CASDFGradientContourEffect
{ CGColorRef _startColor; CGColorRef _endColor; }
@synthesize angle=_angle, radius=_radius, shadowEffectOffset=_shadowEffectOffset, shadowGradientStart=_shadowGradientStart, shadowGradientEnd=_shadowGradientEnd, shadowAlpha=_shadowAlpha, gradientOffset=_gradientOffset;
+ (NSString *)name { return @"Gradient Contour"; }
+ (NSDictionary *)defaultValues { return @{ @"startColor": (__bridge id)CASDFGray(1), @"endColor": (__bridge id)CASDFGray(0), @"angle": @(0), @"radius": @(10), @"shadowEffectOffset": @(3), @"shadowGradientStart": @(0), @"shadowGradientEnd": @(1), @"shadowAlpha": @(1), @"gradientOffset": @(0) }; }
- (instancetype)init { if ((self = [super init])) { _startColor = CASDFGray(1); _endColor = CASDFGray(0); _angle = 0; _radius = 10; _shadowEffectOffset = 3; _shadowGradientStart = 0; _shadowGradientEnd = 1; _shadowAlpha = 1; _gradientOffset = 0; } return self; }
- (CGColorRef)startColor { return _startColor; }
- (void)setStartColor:(CGColorRef)c { CGColorRef n = c ? CGColorRetain(c) : NULL; if (_startColor) CGColorRelease(_startColor); _startColor = n; }
- (CGColorRef)endColor { return _endColor; }
- (void)setEndColor:(CGColorRef)c { CGColorRef n = c ? CGColorRetain(c) : NULL; if (_endColor) CGColorRelease(_endColor); _endColor = n; }
- (void)_copyFrom:(CASDFGradientContourEffect *)o { [self setStartColor:((CASDFGradientContourEffect *)o)->_startColor]; [self setEndColor:((CASDFGradientContourEffect *)o)->_endColor]; self.angle = ((CASDFGradientContourEffect *)o).angle; self.radius = ((CASDFGradientContourEffect *)o).radius; self.shadowEffectOffset = ((CASDFGradientContourEffect *)o).shadowEffectOffset; self.shadowGradientStart = ((CASDFGradientContourEffect *)o).shadowGradientStart; self.shadowGradientEnd = ((CASDFGradientContourEffect *)o).shadowGradientEnd; self.shadowAlpha = ((CASDFGradientContourEffect *)o).shadowAlpha; self.gradientOffset = ((CASDFGradientContourEffect *)o).gradientOffset; }
- (void)dealloc { if (_startColor) CGColorRelease(_startColor); if (_endColor) CGColorRelease(_endColor); }
@end

@implementation CASDFShadowEffect
{ CGColorRef _color; }
@synthesize radius=_radius, offset=_offset, punchout=_punchout, invert=_invert;
+ (NSString *)name { return @"Shadow"; }
+ (NSDictionary *)defaultValues { return @{ @"color": (__bridge id)CASDFGray(0), @"radius": @(10), @"offset": [NSValue valueWithSize:NSMakeSize(0,-10)], @"punchout": @0, @"invert": @0 }; }
- (instancetype)init { if ((self = [super init])) { _color = CASDFGray(0); _radius = 10; _offset = CGSizeMake(0,-10); _punchout = 0; _invert = 0; } return self; }
- (CGColorRef)color { return _color; }
- (void)setColor:(CGColorRef)c { CGColorRef n = c ? CGColorRetain(c) : NULL; if (_color) CGColorRelease(_color); _color = n; }
- (void)_copyFrom:(CASDFShadowEffect *)o { [self setColor:((CASDFShadowEffect *)o)->_color]; self.radius = ((CASDFShadowEffect *)o).radius; self.offset = ((CASDFShadowEffect *)o).offset; self.punchout = ((CASDFShadowEffect *)o).punchout; self.invert = ((CASDFShadowEffect *)o).invert; }
- (void)dealloc { if (_color) CGColorRelease(_color); }
@end

@implementation CASDFKeyFillHighlightEffect
{ CGColorRef _keyColor; CGColorRef _fillColor; }
@synthesize keyHeightScale=_keyHeightScale, keyHeightOffset=_keyHeightOffset, keySpreadScale=_keySpreadScale, keySpreadOffset=_keySpreadOffset, fillHeightScale=_fillHeightScale, fillHeightOffset=_fillHeightOffset, fillSpreadScale=_fillSpreadScale, fillSpreadOffset=_fillSpreadOffset, keyHeight=_keyHeight, keyAngle=_keyAngle, keySpread=_keySpread, keyAmount=_keyAmount, fillHeight=_fillHeight, fillAngle=_fillAngle, fillSpread=_fillSpread, fillAmount=_fillAmount, curvature=_curvature, global=_global;
+ (NSString *)name { return @"Key Fill Highlight"; }
+ (NSDictionary *)defaultValues { return @{ @"keyColor": (__bridge id)CASDFGray(1), @"keyHeightScale": @(1), @"keyHeightOffset": @(0), @"keySpreadScale": @(1), @"keySpreadOffset": @(0), @"fillColor": (__bridge id)CASDFGray(1), @"fillHeightScale": @(1), @"fillHeightOffset": @(0), @"fillSpreadScale": @(1), @"fillSpreadOffset": @(0), @"keyHeight": @(20), @"keyAngle": @(M_PI_2), @"keySpread": @(M_PI), @"keyAmount": @(0.5), @"fillHeight": @(20), @"fillAngle": @(-M_PI_2), @"fillSpread": @(M_PI), @"fillAmount": @(0.5), @"curvature": @(1), @"global": @0}; }
- (instancetype)init { if ((self = [super init])) { _keyColor = CASDFGray(1); _keyHeightScale = 1; _keyHeightOffset = 0; _keySpreadScale = 1; _keySpreadOffset = 0; _fillColor = CASDFGray(1); _fillHeightScale = 1; _fillHeightOffset = 0; _fillSpreadScale = 1; _fillSpreadOffset = 0; _keyHeight = 20; _keyAngle = M_PI_2; _keySpread = M_PI; _keyAmount = 0.5; _fillHeight = 20; _fillAngle = -M_PI_2; _fillSpread = M_PI; _fillAmount = 0.5; _curvature = 1; _global = 0; } return self; }
- (CGColorRef)keyColor { return _keyColor; }
- (void)setKeyColor:(CGColorRef)c { CGColorRef n = c ? CGColorRetain(c) : NULL; if (_keyColor) CGColorRelease(_keyColor); _keyColor = n; }
- (CGColorRef)fillColor { return _fillColor; }
- (void)setFillColor:(CGColorRef)c { CGColorRef n = c ? CGColorRetain(c) : NULL; if (_fillColor) CGColorRelease(_fillColor); _fillColor = n; }
- (void)_copyFrom:(CASDFKeyFillHighlightEffect *)o { [self setKeyColor:((CASDFKeyFillHighlightEffect *)o)->_keyColor]; self.keyHeightScale = ((CASDFKeyFillHighlightEffect *)o).keyHeightScale; self.keyHeightOffset = ((CASDFKeyFillHighlightEffect *)o).keyHeightOffset; self.keySpreadScale = ((CASDFKeyFillHighlightEffect *)o).keySpreadScale; self.keySpreadOffset = ((CASDFKeyFillHighlightEffect *)o).keySpreadOffset; [self setFillColor:((CASDFKeyFillHighlightEffect *)o)->_fillColor]; self.fillHeightScale = ((CASDFKeyFillHighlightEffect *)o).fillHeightScale; self.fillHeightOffset = ((CASDFKeyFillHighlightEffect *)o).fillHeightOffset; self.fillSpreadScale = ((CASDFKeyFillHighlightEffect *)o).fillSpreadScale; self.fillSpreadOffset = ((CASDFKeyFillHighlightEffect *)o).fillSpreadOffset; self.keyHeight = ((CASDFKeyFillHighlightEffect *)o).keyHeight; self.keyAngle = ((CASDFKeyFillHighlightEffect *)o).keyAngle; self.keySpread = ((CASDFKeyFillHighlightEffect *)o).keySpread; self.keyAmount = ((CASDFKeyFillHighlightEffect *)o).keyAmount; self.fillHeight = ((CASDFKeyFillHighlightEffect *)o).fillHeight; self.fillAngle = ((CASDFKeyFillHighlightEffect *)o).fillAngle; self.fillSpread = ((CASDFKeyFillHighlightEffect *)o).fillSpread; self.fillAmount = ((CASDFKeyFillHighlightEffect *)o).fillAmount; self.curvature = ((CASDFKeyFillHighlightEffect *)o).curvature; self.global = ((CASDFKeyFillHighlightEffect *)o).global; }
- (void)dealloc { if (_keyColor) CGColorRelease(_keyColor); if (_fillColor) CGColorRelease(_fillColor); }
@end

@implementation CASDFOutputEffect
@synthesize minimum=_minimum, maximum=_maximum;
+ (NSString *)name { return @"Output"; }
+ (NSDictionary *)defaultValues { return @{ @"minimum": @(-10000), @"maximum": @(100) }; }
- (instancetype)init { if ((self = [super init])) { _minimum = -10000; _maximum = 100; } return self; }
- (void)_copyFrom:(CASDFOutputEffect *)o { self.minimum = ((CASDFOutputEffect *)o).minimum; self.maximum = ((CASDFOutputEffect *)o).maximum; }
- (void)dealloc {  }
@end

@implementation CASDFVisualizationEffect
+ (NSString *)name { return @"Visualization"; }
+ (NSDictionary *)defaultValues { return @{}; }
- (instancetype)init { if ((self = [super init])) {  } return self; }
- (void)_copyFrom:(CASDFVisualizationEffect *)o {  }
- (void)dealloc {  }
@end

@implementation CASDFGlassDisplacementEffect
@synthesize height=_height, curvature=_curvature, angle=_angle, maskOffset=_maskOffset;
+ (NSString *)name { return @"Glass Displacement"; }
+ (NSDictionary *)defaultValues { return @{ @"height": @(20), @"curvature": @(1), @"angle": @(0) }; }
- (instancetype)init { if ((self = [super init])) { _height = 20; _curvature = 1; _angle = 0; _maskOffset = 0; } return self; }
- (void)_copyFrom:(CASDFGlassDisplacementEffect *)o { self.height = ((CASDFGlassDisplacementEffect *)o).height; self.curvature = ((CASDFGlassDisplacementEffect *)o).curvature; self.angle = ((CASDFGlassDisplacementEffect *)o).angle; self.maskOffset = ((CASDFGlassDisplacementEffect *)o).maskOffset; }
- (void)dealloc {  }
@end

@implementation CASDFGlassHighlightEffect
{ CGColorRef _color; }
@synthesize height=_height, angle=_angle, spread=_spread, amount=_amount, curvature=_curvature, global=_global;
+ (NSString *)name { return @"Glass Highlight"; }
+ (NSDictionary *)defaultValues { return @{ @"color": (__bridge id)CASDFGray(1), @"height": @(20), @"angle": @(M_PI_2), @"spread": @(M_PI), @"amount": @(0.5), @"curvature": @(1) }; }
- (instancetype)init { if ((self = [super init])) { _color = CASDFGray(1); _height = 20; _angle = M_PI_2; _spread = M_PI; _amount = 0.5; _curvature = 1; _global = 0; } return self; }
- (CGColorRef)color { return _color; }
- (void)setColor:(CGColorRef)c { CGColorRef n = c ? CGColorRetain(c) : NULL; if (_color) CGColorRelease(_color); _color = n; }
- (void)_copyFrom:(CASDFGlassHighlightEffect *)o { [self setColor:((CASDFGlassHighlightEffect *)o)->_color]; self.height = ((CASDFGlassHighlightEffect *)o).height; self.angle = ((CASDFGlassHighlightEffect *)o).angle; self.spread = ((CASDFGlassHighlightEffect *)o).spread; self.amount = ((CASDFGlassHighlightEffect *)o).amount; self.curvature = ((CASDFGlassHighlightEffect *)o).curvature; self.global = ((CASDFGlassHighlightEffect *)o).global; }
- (void)dealloc { if (_color) CGColorRelease(_color); }
@end

@implementation CASDFLayer
@synthesize effect, smoothness, gaussianRadius, effectOffset, mergeElements;
+ (id)defaultValueForKey:(NSString *)k { return nil; }
@end

@implementation CASDFElementLayer
@synthesize mode, operation, contentsZeroValueDistance, contentsOneValueDistance, gradientOvalization, hitTestsAsFill;
- (instancetype)init { if ((self = [super init])) { mode = @"bounds"; operation = @"union"; contentsZeroValueDistance = 0; contentsOneValueDistance = 1; gradientOvalization = 0; hitTestsAsFill = NO; } return self; }
@end
