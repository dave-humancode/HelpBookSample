#  HelpBookSample

This project shows how you can integrate a HelpBook with your Mac Catalyst app.
This app only works with Mac Catalyst builds; the iPad build is enabled because
Xcode requires it to be present to build for Mac Catalyst, but it doesn’t build.

The project defines a convenient class `HelpBook` that allows you to construct
[well-known URLs](https://developer.apple.com/library/archive/documentation/Carbon/Conceptual/ProvidingUserAssitAppleHelp/appendix_b/appendixb.html#//apple_ref/doc/uid/TP30000903-CH210-TPXREF101)
to navigate to anchors within the HelpBook.

Note the additional `Info.plist` keys in both the App and the AppHelp bundle
targets that enumerate the additional keys and values you need to connect the
HelpBook bundle to the main app.

