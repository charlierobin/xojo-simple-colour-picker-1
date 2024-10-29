//
//  ScreenSampler.m
//  ScreenSampler
//
//  Created by charlie on 24/10/2024.
//

#import "ScreenSampler.h"

@implementation ScreenSampler

struct Colour
{
    CGFloat red;
    CGFloat green;
    CGFloat blue;
};

struct Colour ColourAtScreenCoordinate( NSInteger x, NSInteger y )
{
    CGDirectDisplayID displayID = CGMainDisplayID();
    
    
//    https://developer.apple.com/documentation/coregraphics/1454385-cggetdisplayswithpoint?language=objc
    
//    CGPoint mouseLoc = (struct CGPoint){ x, y };
//    uint32_t count = 0;
//    CGDirectDisplayID displayForPoint;
    
//    if (CGGetDisplaysWithPoint(mouseLoc, 1, &displayForPoint, &count) != kCGErrorSuccess)
//    {
//        return (struct Colour){ 255, 0, 0 };
//    }
    
//    displayID = displayForPoint;
    
    
    
    
    
    
    CGImageRef image = CGDisplayCreateImageForRect( displayID, CGRectMake( x, y, 1, 1 ) );
    
    //    CGColorSpaceRef colorspace = CGImageGetColorSpace( image );
    
    //    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    //    colorspace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
    
    //    image = CGImageCreateCopyWithColorSpace( image, colorspace );
    
    NSBitmapImageRep *bitmap = [[NSBitmapImageRep alloc] initWithCGImage: image ];
    
    CGImageRelease( image );
    
    NSColor *color = [bitmap colorAtX: 0 y: 0];
    
    //    color = [NSColor colorWithSRGBRed:color.redComponent green:color.greenComponent blue:color.blueComponent alpha:color.alphaComponent];
    
    
    
    //    CGColorSpaceRef colourSpace = CGDisplayCopyColorSpace(displayID);
    
    //    NSColorSpace * ns = [NSColorSpace extendedSRGBColorSpace];
    
    //    color = [color colorUsingColorSpace: ns];
    
    //    CGColorSpaceRelease(colourSpace);
    
    return (struct Colour){ color.redComponent * 255, color.greenComponent * 255, color.blueComponent * 255 };
}

@end
