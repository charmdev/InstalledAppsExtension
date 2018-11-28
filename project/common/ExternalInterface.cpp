#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include "Utils.h"

#define safe_val_string(str) str==NULL ? "" : std::string(val_string(str))


using namespace installedappsextension;



static value installedappsextension_sample_method (value inputValue) {
	
	int returnValue = SampleMethod(val_int(inputValue));
	return alloc_int(returnValue);
	
}
DEFINE_PRIM (installedappsextension_sample_method, 1);

static value installedappsextension_canOpenURL (value inputValue) {

	int returnValue = CanOpenURL(safe_val_string(inputValue));
	return alloc_bool(returnValue);

}
DEFINE_PRIM (installedappsextension_isPackageInstalled, 1);



extern "C" void installedappsextension_main () {
	
	val_int(0); // Fix Neko init
	
}
DEFINE_ENTRY_POINT (installedappsextension_main);



extern "C" int installedappsextension_register_prims () { return 0; }