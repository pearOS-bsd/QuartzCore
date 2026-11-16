/* The glass filters: the type names, the input keys in order and their atoms. Golden = the real QuartzCore (macOS 26.7.2). */
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#include <dlfcn.h>
#ifdef REAL_CA
@interface CAFilter : NSObject
+ (instancetype)filterWithType:(NSString *)t; - (NSArray *)inputKeys;
@end
static unsigned atom(NSString *k) { static unsigned (*f)(CFStringRef, int); if (!f) f = dlsym(RTLD_DEFAULT, "CAInternAtom"); return f((__bridge CFStringRef)k, 0); }
#else
extern unsigned CAFilterGlassKeyAtom(NSString *key, float *def);
static unsigned atom(NSString *k) { return CAFilterGlassKeyAtom(k, NULL); }
#endif
int main(void)
{
	@autoreleasepool {
		for (NSString *t in @[@"glassBackground", @"glassForeground"]) {
			CAFilter *f = [CAFilter filterWithType:t]; NSArray *ks = [f inputKeys];
			printf("## %s %lu\n", t.UTF8String, (unsigned long)ks.count);
			for (NSString *k in ks) printf("0x%x %s\n", atom(k), k.UTF8String);
		}
	}
	return 0;
}
