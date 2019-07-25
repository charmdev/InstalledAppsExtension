#include "Utils.h"

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

namespace installedappsextension {

	bool CanOpenURL(std::string url){
	    NSString * scheme = [NSString stringWithUTF8String:url.c_str()];
		NSURL *appUrlScheme = [NSURL URLWithString:scheme];
		if ([[UIApplication sharedApplication] canOpenURL: appUrlScheme]) {
			return true;
		}
		return false;
	}
	
}