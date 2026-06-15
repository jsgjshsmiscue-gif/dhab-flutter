#!/bin/bash

# DHAB APK Build Script
# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}=== DHAB APK Build Script ===${NC}"
echo ""

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}Flutter is not installed. Please install Flutter first.${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Flutter found${NC}"

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    echo -e "${RED}pubspec.yaml not found. Please run this script from the project root.${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Project directory verified${NC}"
echo ""

# Clean previous builds
echo -e "${YELLOW}Cleaning previous builds...${NC}"
flutter clean
rm -rf build/

# Get dependencies
echo -e "${YELLOW}Getting dependencies...${NC}"
flutter pub get

# Run code generation
echo -e "${YELLOW}Running code generation...${NC}"
flutter pub run build_runner build --delete-conflicting-outputs

# Build debug APK
echo -e "${YELLOW}Building debug APK...${NC}"
flutter build apk --debug --target-platform android-arm64

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Debug APK built successfully${NC}"
    echo -e "${GREEN}Location: build/app/outputs/flutter-apk/app-debug.apk${NC}"
else
    echo -e "${RED}✗ Debug APK build failed${NC}"
    exit 1
fi

# Build release APK
echo -e "${YELLOW}Building release APK...${NC}"
flutter build apk --release --target-platform android-arm64,android-arm

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Release APK built successfully${NC}"
    echo -e "${GREEN}Location: build/app/outputs/flutter-apk/app-release.apk${NC}"
else
    echo -e "${RED}✗ Release APK build failed${NC}"
    exit 1
fi

# Build App Bundle
echo -e "${YELLOW}Building App Bundle...${NC}"
flutter build appbundle --release

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ App Bundle built successfully${NC}"
    echo -e "${GREEN}Location: build/app/outputs/bundle/release/app-release.aab${NC}"
else
    echo -e "${RED}✗ App Bundle build failed${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}=== Build Complete ===${NC}"
echo ""
echo "Built artifacts:"
echo "  • Debug APK: build/app/outputs/flutter-apk/app-debug.apk"
echo "  • Release APK: build/app/outputs/flutter-apk/app-release.apk"
echo "  • App Bundle: build/app/outputs/bundle/release/app-release.aab"
echo ""
echo "Next steps:"
echo "  • Install on device: flutter install"
echo "  • Upload AAB to Play Store"
