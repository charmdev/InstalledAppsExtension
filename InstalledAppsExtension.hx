package;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

#if (android && openfl)
import openfl.utils.JNI;
#end


class InstalledAppsExtension {

	public static function isPackageInstalled(packageName:String):Bool {

		#if (android)

		var result:Bool = isPackageInstalledJNI(packageName);
		return result;

		#elseif (ios)

		var result:Bool = canOpenURLIOS(packageName);
		return result;

		#else

		return false;

		#end

	}

	#if (android)
	private static var installedappsextension_sample_method_jni = JNI.createStaticMethod ("org.haxe.extension.InstalledAppsExtension", "sampleMethod", "(I)I");
	private static var isPackageInstalledJNI = JNI.createStaticMethod ("org.haxe.extension.InstalledAppsExtension", "isPackageInstalled", "(Ljava/lang/String;)Z");
	#elseif (ios)
	private static var canOpenURLIOS = Lib.load("installedappsextension", "installedappsextension_canOpenURL", 1);
	#end

}