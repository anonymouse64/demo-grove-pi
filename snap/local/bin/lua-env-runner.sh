#!/bin/bash -e

# figure out the snap architecture lib name
case $SNAP_ARCH in
    amd64)
        archLibName="x86_64-linux-gnu"
        ;;
    armhf)
        archLibName="arm-linux-gnueabihf"
        ;;
    arm64)
        archLibName="aarch64-linux-gnu"
        ;;
    i386)
        archLibName="i386-linux-gnu"
        ;;
    *)
        # unsupported or unknown architecture
        exit 1
        ;;
esac

# lua paths so that lua can load all libraries from $SNAP
export LUA_VERSION=5.1
export LUA_PATH="$SNAP/lualib/?.lua;$SNAP/lualib/?/init.lua;$SNAP/usr/share/lua/$LUA_VERSION/?.lua;$SNAP/usr/share/lua/$LUA_VERSION/?/init.lua;$SNAP/lib/lua/$LUA_VERSION/?.lua;$SNAP/lib/lua/$LUA_VERSION/?/init.lua;$SNAP/share/lua/$LUA_VERSION/?.lua;$SNAP/share/lua/$LUA_VERSION/?/init.lua;;"
export LUA_CPATH="$SNAP/lualib/?.so;$SNAP/lib/lua/$LUA_VERSION/?.so;$SNAP/lib/$archLibName/lua/$LUA_VERSION/?.so;$SNAP/usr/lib/$archLibName/lua/$LUA_VERSION/?.so;"

# run the commands
exec "$@"
