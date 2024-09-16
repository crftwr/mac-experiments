//
//  KeyboardHook.swift
//  AccessibilityHooks
//
//  Created by Tomonori Shimomura on 2024-09-15.
//

import Foundation
import CoreGraphics
import Cocoa

func _KeyHookCallback(proxy: CGEventTapProxy, type: CGEventType, event: CGEvent, refcon: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
    
    if [.keyDown, .keyUp].contains(type) {
        
        var keyCode = event.getIntegerValueField(.keyboardEventKeycode)
        print( "EventType \(type), KeyCode \(keyCode)" )

        // Test swap A and B
        if keyCode == 0 {
            keyCode = 11
        } else if keyCode == 11 {
            keyCode = 0
        }
        event.setIntegerValueField(.keyboardEventKeycode, value: keyCode)
    }
    return Unmanaged.passUnretained(event)
}

struct KeyboardHook {
    
    mutating func Install() {
        print("KeyboardHook.Install()")
        
        let eventMask = (1 << CGEventType.keyDown.rawValue) | (1 << CGEventType.keyUp.rawValue) | (1 << CGEventType.flagsChanged.rawValue)
        
        eventTap = CGEvent.tapCreate(
            tap: CGEventTapLocation.cgSessionEventTap,
            place: CGEventTapPlacement.headInsertEventTap,
            options: CGEventTapOptions.defaultTap,
            eventsOfInterest: CGEventMask(eventMask),
            callback: _KeyHookCallback,
            userInfo: nil
        )
        
        if eventTap==nil {
            print("Failed to create event tap")
            return
        }
        
        runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0)
        CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, .commonModes)
        CGEvent.tapEnable(tap: eventTap!, enable: true)
    }
    
    mutating func Uninstall() {
        print("KeyboardHook.Uninstall()")
                
        CGEvent.tapEnable(tap: eventTap!, enable: false)
        CFRunLoopRemoveSource(CFRunLoopGetCurrent(), runLoopSource, .commonModes)

        runLoopSource = nil;
        eventTap = nil;
    }
    
    var eventTap: CFMachPort? = nil;
    var runLoopSource: CFRunLoopSource? = nil;
}

