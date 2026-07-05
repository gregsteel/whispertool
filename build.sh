#!/bin/bash
echo "============================================"
echo "  Building WisprTool executable..."
echo "============================================"
echo

pip3 install pyinstaller >/dev/null 2>&1
pip3 install -r requirements.txt >/dev/null 2>&1

# Build from WisprTool.spec, which is the single source of truth for the
# macOS bundle (onedir layout, menu-bar/LSUIElement + mic usage Info.plist
# keys). Keep spec changes there rather than duplicating flags here.
pyinstaller WisprTool.spec

echo
if [ -d "dist/WisprTool.app" ]; then
    echo "============================================"
    echo "  SUCCESS! Find your app at:"
    echo "  dist/WisprTool.app"
    echo "============================================"
    echo
    echo "  On Mac: grant Accessibility permissions"
    echo "  System Settings > Privacy & Security > Accessibility"
    echo
    echo "  WisprTool now runs as a menu-bar app (no Dock icon,"
    echo "  no window) - look for the mic icon in the menu bar."
else
    echo "  BUILD FAILED - check errors above."
fi
