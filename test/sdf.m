/* The SDF effects and layers: display names, default values, and the values of a fresh layer. Golden = the real QuartzCore. */
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "cacompat.h"
static NSString *fmt(id v)
{
	if (!v) return @"nil";
	if ([v isKindOfClass:[NSNumber class]]) return [NSString stringWithFormat:@"%.9g", [v doubleValue]];
	if ([v isKindOfClass:[NSString class]]) return [NSString stringWithFormat:@"\"%@\"", v];
	if (CAIsColor(v)) {
		CGColorRef c = (__bridge CGColorRef)v; size_t n = CGColorGetNumberOfComponents(c); const CGFloat *p = CGColorGetComponents(c);
		NSMutableString *s = [NSMutableString stringWithString:@"color("]; for (size_t i = 0; i < n; i++) [s appendFormat:@"%s%.6g", i ? "," : "", p[i]]; return [s stringByAppendingString:@")"];
	}
	if ([v isKindOfClass:[NSValue class]]) { double b[8] = {0}; [v getValue:b]; return [NSString stringWithFormat:@"<%.9g %.9g>", b[0], b[1]]; }
	return [v description];
}
int main(void)
{
	@autoreleasepool {
		for (NSString *cn in @[@"CASDFFillEffect", @"CASDFGradientEffect", @"CASDFGradientContourEffect", @"CASDFShadowEffect", @"CASDFKeyFillHighlightEffect", @"CASDFOutputEffect", @"CASDFGlassDisplacementEffect", @"CASDFGlassHighlightEffect"]) {
			Class c = NSClassFromString(cn); if (!c) { printf("## %s MISSING\n", cn.UTF8String); continue; }
			printf("## %s name=%s\n", cn.UTF8String, [[c performSelector:@selector(name)] UTF8String]);
			NSDictionary *d = [c performSelector:@selector(defaultValues)];
			for (NSString *k in [[d allKeys] sortedArrayUsingSelector:@selector(compare:)]) printf("  %s = %s\n", k.UTF8String, fmt(d[k]).UTF8String);
		}
		for (NSString *cn in @[@"CASDFLayer", @"CASDFElementLayer"]) {
			Class c = NSClassFromString(cn); if (!c) { printf("## %s MISSING\n", cn.UTF8String); continue; }
			id l = [[c alloc] init]; printf("## %s fresh layer\n", cn.UTF8String);
			NSArray *keys = [cn isEqual:@"CASDFLayer"] ? @[@"smoothness", @"gaussianRadius", @"effectOffset", @"mergeElements", @"effect"] : @[@"mode", @"operation", @"contentsZeroValueDistance", @"contentsOneValueDistance", @"gradientOvalization", @"hitTestsAsFill"];
			for (NSString *k in keys) printf("  %s = %s\n", k.UTF8String, fmt([l valueForKey:k]).UTF8String);
		}
	}
	return 0;
}
