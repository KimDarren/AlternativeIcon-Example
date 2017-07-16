# AlternativeIcon
Since iOS 10.3, it is possible to change the application's icon programmatically.
This repository contains simple application demo it.

## Requirements
* Xcode 8.3 or higher.
* iOS 10.3 or higher.

## How to build.
1. Install cocoapods _(if needed)_ .
2. Clone this project.
3. Redirect to [`/Project`](https://github.com/KimDarren/AlternativeIcon-Example/blob/master/Project)`directory.
4. `pod install`.
5. Open `AlternativeIconExample.xcworkspace` with Xcode.
6. Build and run on your device or simulator.

## Screenshot
![Demo](https://github.com/KimDarren/AlternativeIcon-Example/blob/master/Screenshots/demo.gif?raw=true)

## Alternate icon, step by step

* Import your alternative icon files to project file.
	- **IMPORTANT** I don't know why, but it doesn't support `.xcassets`.
* Open your project's `Info.plist` file.

	```plist
	<key>CFBundleIcons</key>
		<dict>
			<key>CFBundleAlternateIcons</key>
			<dict>
				<key>{alternate-icon-key}</key>
				<dict>
					<key>CFBundleIconFiles</key>
					<array>
						<string>{alternate-icon-file-name}</string>
					</array>
					<key>UIPrerenderedIcon</key>
					<false/>
				</dict>
			</dict>
			<key>CFBundlePrimaryIcon</key>
			<dict>
				<key>CFBundleIconFiles</key>
				<array>
					<string>{primary-icon-file-name}</string>
				</array>
				<key>UIPrerenderedIcon</key>
				<false/>
			</dict>
		</dict>
	```
* Write some code to set alternative icon.

	```swift
	UIApplication.shared.setAlternateIconName("alternative-icon-key") { error in
		// Handle error or do something.
	}
	```
	
## Before submit to App Store.
* The icon must to be user-choosable.
* The icon must to be related to your app.


## License

**AlternativeIcon-Example** is available under the MIT license. See the [LICENSE](LICENSE) file for more info.