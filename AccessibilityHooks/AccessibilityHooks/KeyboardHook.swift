//
//  KeyboardHook.swift
//  AccessibilityHooks
//
//  Created by Tomonori Shimomura on 2024-09-15.
//

import Foundation
import CoreGraphics

class KeyboardHook {
    
    func install() {
        print("KeyboardHook.Install()")

        let eventMask = (1 << CGEventType.keyDown.rawValue) | (1 << CGEventType.keyUp.rawValue) | (1 << CGEventType.flagsChanged.rawValue)
        
        func _callback(proxy: CGEventTapProxy, type: CGEventType, event: CGEvent, refcon: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
            let keyboard_hook = Unmanaged<KeyboardHook>.fromOpaque(refcon!).takeUnretainedValue()
            return keyboard_hook.callback(proxy: proxy, type: type, event: event)
        }

        self.eventTap = CGEvent.tapCreate(
            tap: CGEventTapLocation.cgSessionEventTap,
            place: CGEventTapPlacement.headInsertEventTap,
            options: CGEventTapOptions.defaultTap,
            eventsOfInterest: CGEventMask(eventMask),
            callback: _callback,
            userInfo: Unmanaged.passRetained(self).toOpaque()
        )
        
        if self.eventTap==nil {
            print("Failed to create event tap")
            return
        }
        
        self.runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, self.eventTap, 0)

        if self.runLoopSource==nil {
            print("Failed to create RunLoopSource")
            return
        }

        CFRunLoopAddSource(CFRunLoopGetCurrent(), self.runLoopSource, .commonModes)
        CGEvent.tapEnable(tap: self.eventTap!, enable: true)
    }
    
    func uninstall() {
        print("KeyboardHook.Uninstall()")
        
        if let eventTap = self.eventTap {
            CGEvent.tapEnable(tap: eventTap, enable: false)
        }

        if let runLoopSource = self.runLoopSource {
            CFRunLoopRemoveSource(CFRunLoopGetCurrent(), runLoopSource, CFRunLoopMode.commonModes)
        }

        self.runLoopSource = nil;
        self.eventTap = nil;
    }

    func callback(proxy: CGEventTapProxy, type: CGEventType, event: CGEvent) -> Unmanaged<CGEvent>? {
        
        if [CGEventType.keyDown, CGEventType.keyUp].contains(type) {
            
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

    var eventTap: CFMachPort? = nil;
    var runLoopSource: CFRunLoopSource? = nil;
}

