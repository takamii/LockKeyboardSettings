#import <UIKit/UIKit.h>

#include <unistd.h>
#include <stdlib.h>
#include <ctype.h>
#include <notify.h>

// Required
extern "C" BOOL isCapable() {
	return YES;
}

// Required
extern "C" BOOL isEnabled() {
//	return YES;
	return [[NSFileManager defaultManager] fileExistsAtPath:@"/var/mobile/Library/Preferences/jp.takamii.LockKeyboardSettings.lock"];
}

// Optional
// Faster isEnabled. Remove this if it's not necessary. Keep it if isEnabled() is expensive and you can make it faster here.
extern "C" BOOL getStateFast() {
//	return YES;
	return isEnabled();
}

// Required
extern "C" void setState(BOOL enabled) {
	// Set State!
	if (enabled == YES) {
		notify_post("jp.takamii.LockKeyboardSettings.enable");
	}
	else if (enabled == NO) {
		notify_post("jp.takamii.LockKeyboardSettings.disable");
	}
}

// Required
// How long the toggle takes to toggle, in seconds.
extern "C" float getDelayTime() {
	return 0.1f;
}

// vim:ft=objc
