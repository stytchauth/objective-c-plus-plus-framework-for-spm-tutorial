#!/bin/bash

# Set variables for the scheme, framework name, and output directory
SCHEME="StytchFoo"
FRAMEWORK_NAME="StytchFoo"
OUTPUT_DIR="$(pwd)/Products"
XCFRAMEWORK_OUTPUT="$OUTPUT_DIR/$FRAMEWORK_NAME.xcframework"

# Clean previous build
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

echo "Building for iOS Devices..."
xcodebuild archive \
  -scheme "$SCHEME" \
  -configuration Release \
  -destination 'generic/platform=iOS' \
  -archivePath "$OUTPUT_DIR/ios_device.xcarchive" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

echo "Building for iOS Simulators..."
xcodebuild archive \
  -scheme "$SCHEME" \
  -configuration Release \
  -destination 'generic/platform=iOS Simulator' \
  -archivePath "$OUTPUT_DIR/ios_simulator.xcarchive" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

echo "Creating XCFramework..."
xcodebuild -create-xcframework \
  -framework "$OUTPUT_DIR/ios_device.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
  -framework "$OUTPUT_DIR/ios_simulator.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
  -output "$XCFRAMEWORK_OUTPUT"

echo "XCFramework created at: $XCFRAMEWORK_OUTPUT"

rm -rf "$OUTPUT_DIR/ios_device.xcarchive"
rm -rf "$OUTPUT_DIR/ios_simulator.xcarchive"

