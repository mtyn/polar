# Changelog

## 2.0.0-beta.1

The theme has been updated to use a generator to keep it aligned with the Nord theme. This means a more consistent experience for those who are using this as a light version of the Nord theme. It also makes it easier to add new ports from the existing Nord implementations, which should hopefully allow me to maintain more Polar implementations with less work.

However, this did mean that some of the hand-written ports have changed slightly, as they used to use colors or designs that didn't match up with the original Nord theme. If you prefer those theme implementations instead, they will continue to exist in their pre-2.0.0 state in the `legacy/pre-generated` directory, but will not receive further updates (feel free to make Pull Requests for updates if you want to maintain them further).

Currently, the ports for XCode, VSCode and JetBrains IDEs have been moved to the generator. As this has reworked the entire theme file I'm keeping them in beta and not published to the relevant Marketplaces until I've test run them for a while to iron out the bugs. If you'd like to help with testing, I've included the builds on the release page to be installed manually.

### New

* Code Generated Themes for XCode, VSCode and JetBrains, for more consistency with Nord

