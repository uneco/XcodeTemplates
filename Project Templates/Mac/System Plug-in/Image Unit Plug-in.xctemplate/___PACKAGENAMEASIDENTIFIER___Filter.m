//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___PACKAGENAMEASIDENTIFIER___Filter.h"
#import <Foundation/Foundation.h>
#import <ApplicationServices/ApplicationServices.h>

@implementation ___PACKAGENAMEASIDENTIFIER___Filter

static CIKernel *____PACKAGENAMEASIDENTIFIER___FilterKernel = nil;

- (instancetype)init
{
    if(!____PACKAGENAMEASIDENTIFIER___FilterKernel) {
		NSBundle    *bundle = [NSBundle bundleForClass:NSClassFromString(@"___PACKAGENAMEASIDENTIFIER___Filter")];
		NSStringEncoding encoding = NSUTF8StringEncoding;
		NSError     *error = nil;
		NSString    *code = [NSString stringWithContentsOfFile:[bundle pathForResource:@"___PACKAGENAMEASIDENTIFIER___FilterKernel" ofType:@"cikernel"] encoding:encoding error:&error];
		NSArray     *kernels = [CIKernel kernelsWithString:code];

		____PACKAGENAMEASIDENTIFIER___FilterKernel = kernels[0];
    }
    return [super init];
}

- (CGRect)regionOf:(int)sampler  destRect:(CGRect)rect  userInfo:(NSNumber *)radius
{
    return CGRectInset(rect, -[radius floatValue], 0);
}

- (NSDictionary *)customAttributes
{
    return @{
        @"inputCenter":@{
            kCIAttributeDefault:[CIVector vectorWithX:200.0 Y:200.0],
            kCIAttributeType:kCIAttributeTypePosition,
        },
        @"inputWidth":@{
            kCIAttributeMin:@1.00,
            kCIAttributeSliderMin:@1.00,
            kCIAttributeSliderMax:@1000.00,
            kCIAttributeDefault:@400.00,
            kCIAttributeIdentity:@400.00,
            kCIAttributeType:kCIAttributeTypeDistance,
        },
        @"inputAmount":@{
            kCIAttributeMin:@0.00,
            kCIAttributeSliderMin:@0.00,
            kCIAttributeSliderMax:@2.00,
            kCIAttributeDefault:@0.50,
            kCIAttributeIdentity:@0.00,
            kCIAttributeType:kCIAttributeTypeDistance,
        },
    };
}

// called when setting up for fragment program and also calls fragment program
- (CIImage *)outputImage
{
    float radius;
    CISampler *src;
    
    src = [CISampler samplerWithImage:inputImage];
    radius = [inputWidth floatValue] * 0.5;
    return [self apply:____PACKAGENAMEASIDENTIFIER___FilterKernel, src,
        [NSNumber numberWithFloat:[inputCenter X]],
        [NSNumber numberWithFloat:1.0 / radius],
        [NSNumber numberWithFloat:radius],
        [NSNumber numberWithFloat:1.0 / pow(10.0, [inputAmount floatValue])],
	    kCIApplyOptionDefinition, [[src definition] insetByX:-radius Y:-radius],
	    kCIApplyOptionUserInfo, [NSNumber numberWithFloat:radius], nil];
}

@end
