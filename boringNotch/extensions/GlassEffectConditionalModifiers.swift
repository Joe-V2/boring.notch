//
//  GlassEffectModifiers.swift
//  boringNotch
//
//  Created by Joe Greaney on 23/03/2026.
//
import SwiftUI

struct ConditionalGlassBackground: ViewModifier {
    var shape : any Shape
    var apply : Bool = false
    func body(content: Content) -> some View {
        if #available (macOS 26, *), apply == true
        {
            content
                .glassEffect(.regular, in: shape)
        } else {
        content
        }
    }
}

struct ConditionalGlassControl: ViewModifier {
    var shape : any Shape
    var styleEnum : LiquidGlassStyleEnum
    var tint : Color? = nil
    
    func body(content: Content) -> some View {
        if #available (macOS 26, *)
        {
            content
                .glassEffect(ConvertedLiquidGlassStyleEnum(style: styleEnum).tint(tint?.opacity(0.1)), in: shape)
        } else {
        content
        }
    }
}

@available(macOS 26, *)
func ConvertedLiquidGlassStyleEnum(style : LiquidGlassStyleEnum) -> Glass
    {
        switch style {
        case LiquidGlassStyleEnum.clear: return Glass.clear;
        case LiquidGlassStyleEnum.regular: return Glass.regular;
        case LiquidGlassStyleEnum.none: return Glass.identity;
        }
    }



