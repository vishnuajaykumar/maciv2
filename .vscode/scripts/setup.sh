#!/bin/bash
set -e

if [ ! -f "apps/FreeCAD.AppImage" ]; then
    echo " ============ Downloading FreeCAD ===================="
    wget -O apps/FreeCAD.AppImage https://github.com/FreeCAD/FreeCAD/releases/download/0.21.2/FreeCAD-0.21.2-Linux-x86_64.AppImage
fi

vcs import < src/workspace.repos src
sudo apt-get update
rosdep update --rosdistro=humble
rosdep install --from-paths src --ignore-src -y --rosdistro=humble