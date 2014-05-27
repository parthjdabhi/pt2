//
//  VnImageFilter.m
//  Pastel2
//
//  Created by SSC on 2014/05/28.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnImageFilter.h"

@implementation VnImageFilter

NSString *const kVnImageFilterFragmentShaderString = SHADER_STRING
(
 
 uniform int blendingMode;
 uniform lowp float topLayerOpacity;
 
 // Normal
 lowp vec4 blendNormal(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(1.0, 1.0, 1.0, 1.0);
 }
 // Darken
 lowp vec4 blendDarken(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(min(top.rgb, bottom.rgb) * top.a + (1.0 - top.a) * bottom.rgb, 1.0);
 }
 // Multiply
 lowp vec4 blendMultiply(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(bottom.rgb * top.rgb * top.a + (1.0 - top.a) * bottom.rgb, 1.0);
 }
 // Screen
 lowp vec4 blendScreen(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(1.0, 1.0, 1.0, 1.0);
 }
 // SoftLight
 lowp vec4 blendSoftLight(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(1.0, 1.0, 1.0, 1.0);
 }
 // Lighten
 lowp vec4 blendLighten(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(1.0, 1.0, 1.0, 1.0);
 }
 // HardLight
 lowp vec4 blendHardLight(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(1.0, 1.0, 1.0, 1.0);
 }
 // VividLight
 lowp vec4 blendVividLight(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(1.0, 1.0, 1.0, 1.0);
 }
 // Overlay
 lowp vec4 blendOverlay(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(1.0, 1.0, 1.0, 1.0);
 }
 // ColorDodge
 lowp vec4 blendColorDodge(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(1.0, 1.0, 1.0, 1.0);
 }
 // Difference
 lowp vec4 blendDifference(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(1.0, 1.0, 1.0, 1.0);
 }
 // LinearDodge
 lowp vec4 blendLinearDodge(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(1.0, 1.0, 1.0, 1.0);
 }
 // LinearLight
 lowp vec4 blendLinearLight(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(1.0, 1.0, 1.0, 1.0);
 }
 // Color
 lowp vec4 blendColor(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(1.0, 1.0, 1.0, 1.0);
 }
 // DarkerColor
 lowp vec4 blendDarkerColor(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(1.0, 1.0, 1.0, 1.0);
 }
 // Exclusion
 lowp vec4 blendExclusion(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(1.0, 1.0, 1.0, 1.0);
 }
 // ColorBurn
 lowp vec4 blendColorBurn(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(1.0, 1.0, 1.0, 1.0);
 }
 // Hue
 lowp vec4 blendHue(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(1.0, 1.0, 1.0, 1.0);
 }
 // Saturation
 lowp vec4 blendSaturation(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(1.0, 1.0, 1.0, 1.0);
 }
 // Luminosity
 lowp vec4 blendLuminosity(const in lowp vec4 bottom, const in lowp vec4 top)
 {
     return lowp vec4(1.0, 1.0, 1.0, 1.0);
 }
 // Common
 lowp vec4 blendWithBlendingMode(const in lowp vec4 bottom, const in lowp vec4 top, int mode)
 {
     if(mode == 1){
         return blendNormal(bottom, top);
     }
     if(mode == 2){
         return blendDarken(bottom, top);
     }
     if(mode == 3){
         return blendScreen(bottom, top);
     }
     if(mode == 4){
         return blendMultiply(bottom, top);
     }
     if(mode == 5){
         return blendDarkerColor(bottom, top);
     }
     if(mode == 6){
         return blendLighten(bottom, top);
     }
     if(mode == 7){
         return blendSoftLight(bottom, top);
     }
     if(mode == 8){
         return blendHardLight(bottom, top);
     }
     if(mode == 9){
         return blendVividLight(bottom, top);
     }
     if(mode == 10){
         return blendOverlay(bottom, top);
     }
     if(mode == 11){
         return blendExclusion(bottom, top);
     }
     if(mode == 12){
         return blendColorBurn(bottom, top);
     }
     if(mode == 13){
         return blendColor(bottom, top);
     }
     if(mode == 14){
         return blendColorDodge(bottom, top);
     }
     if(mode == 15){
         return blendLinearDodge(bottom, top);
     }
     if(mode == 16){
         return blendLinearLight(bottom, top);
     }
     if(mode == 17){
         return blendHue(bottom, top);
     }
     if(mode == 18){
         return blendSaturation(bottom, top);
     }
     if(mode == 19){
         return blendLuminosity(bottom, top);
     }
     if(mode == 20){
         return blendDifference(bottom, top);
     }
 }
 );

- (id)initWithFragmentShaderFromString:(NSString *)fragmentShaderString
{
    NSString* shader = [NSString stringWithFormat:@"%@%@", kVnImageFilterFragmentShaderString, fragmentShaderString];
    self = [super initWithFragmentShaderFromString:shader];
    if (self) {
        self.blendingMode = VnBlendingModeNormal;
        self.topLayerOpacity = 1.0f;
    }
    return self;
}

- (void)setTopLayerOpacity:(float)topLayerOpacity
{
    [self setFloat:topLayerOpacity forUniformName:@"topLayerOpacity"];
}

- (void)setBlendingMode:(VnBlendingMode)blendingMode
{
    [self setInteger:(GLuint)blendingMode forUniformName:@"blendingMode"];
}

@end
