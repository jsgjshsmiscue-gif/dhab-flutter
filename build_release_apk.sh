#!/bin/bash

# DHAB Release APK Build Script
# This script creates a signed APK ready for distribution

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}=== DHAB Release APK Build ===${NC}"
echo ""

# Check prerequisites
if [ ! -f "pubspec.yaml" ]; then
    echo -e "${RED}pubspec.yaml not found${NC}"
    exit 1
fi

# Check for keystore
if [ ! -f "dhab.jks" ]; then
    echo -e "${YELLOW}Keystore file not found. Creating new keystore...${NC}"
    keytool -genkey -v -keystore dhab.jks \
        -keyalg RSA \
        -keysize 2048 \
        -validity 10000 \
        -alias dhab_key \
        -storepass mater2024 \
        -keypass mater2024 \
        -dname "CN=DHAB,OU=Development,O=Mater Electric Cars,L=Amman,S=Amman,C=JO"
    echo -e "${GREEN}✓ Keystore created${NC}"
fi

# Build preparation
echo -e "${YELLOW}Preparing build environment...${NC}"
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

# Build signed APK
echo -e "${YELLOW}Building signed release APK...${NC}"
flutter build apk \
    --release \
    --target-platform android-arm64,android-arm \
    --split-per-abi

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Signed APKs built successfully${NC}"
    ls -lh build/app/outputs/flutter-apk/
else
    echo -e "${RED}✗ Build failed${NC}"
    exit 1
fi

# Build App Bundle
echo -e "${YELLOW}Building App Bundle for Play Store...${NC}"
flutter build appbundle --release

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ App Bundle created successfully${NC}"
    ls -lh build/app/outputs/bundle/release/
else
    echo -e "${RED}✗ Bundle build failed${NC}"
    exit 1
fi

# Create checksums
echo -e "${YELLOW}Creating checksums...${NC}"
cd build/app/outputs/flutter-apk/
sha256sum app-*-release.apk > checksums.txt
cd ../../../

echo ""
echo -e "${GREEN}=== Build Complete ===${NC}"
echo ""
echo "Release artifacts ready:"
echo "  • Build: build/app/outputs/flutter-apk/"
echo "  • Bundle: build/app/outputs/bundle/release/app-release.aab"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Test APK: flutter install"
echo "  2. Upload AAB to Play Store Console"
echo "  3. Monitor release metrics"
