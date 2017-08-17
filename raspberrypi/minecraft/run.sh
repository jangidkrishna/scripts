#!/bin/sh


# #### YOU MUST PERSONALIZE ALL OF THIS INFO ####
# your personal login/password.
MINECRAFT_LOGIN=aaa@bbb.ccc
MINECRAFT_USERNAME=abcdefghi
MINECRAFT_PASSWORD=xxxxxxxx
MINECRAFT_NATIVE_PATH=~/Minecraft/Natives
MINECRAFT_CLIENTTOKEN=b61fb8e9-97bf-435f-8354-1feaba0ce734
MINECRAFT_UUID=12345678-1234-1234-1234-123456789abc
MINECRAFT_VERSION=1.8

CP=/home/pi/.minecraft/libraries/oshi-project/oshi-core/1.1/oshi-core-1.1.jar:/home/pi/.minecraft/libraries/net/java/dev/jna/jna/3.4.0/jna-3.4.0.jar:/home/pi/.minecraft/libraries/net/java/dev/jna/platform/3.4.0/platform-3.4.0.jar:/home/pi/.minecraft/libraries/com/ibm/icu/icu4j-core-mojang/51.2/icu4j-core-mojang-51.2.jar:/home/pi/.minecraft/libraries/net/sf/jopt-simple/jopt-simple/4.6/jopt-simple-4.6.jar:/home/pi/.minecraft/libraries/com/paulscode/codecjorbis/20101023/codecjorbis-20101023.jar:/home/pi/.minecraft/libraries/com/paulscode/codecwav/20101023/codecwav-20101023.jar:/home/pi/.minecraft/libraries/com/paulscode/libraryjavasound/20101123/libraryjavasound-20101123.jar:/home/pi/.minecraft/libraries/com/paulscode/librarylwjglopenal/20100824/librarylwjglopenal-20100824.jar:/home/pi/.minecraft/libraries/com/paulscode/soundsystem/20120107/soundsystem-20120107.jar:/home/pi/.minecraft/libraries/io/netty/netty-all/4.0.23.Final/netty-all-4.0.23.Final.jar:/home/pi/.minecraft/libraries/com/google/guava/guava/17.0/guava-17.0.jar:/home/pi/.minecraft/libraries/org/apache/commons/commons-lang3/3.3.2/commons-lang3-3.3.2.jar:/home/pi/.minecraft/libraries/commons-io/commons-io/2.4/commons-io-2.4.jar:/home/pi/.minecraft/libraries/commons-codec/commons-codec/1.9/commons-codec-1.9.jar:/home/pi/.minecraft/libraries/net/java/jinput/jinput/2.0.5/jinput-2.0.5.jar:/home/pi/.minecraft/libraries/net/java/jutils/jutils/1.0.0/jutils-1.0.0.jar:/home/pi/.minecraft/libraries/com/google/code/gson/gson/2.2.4/gson-2.2.4.jar:/home/pi/.minecraft/libraries/com/mojang/authlib/1.5.21/authlib-1.5.21.jar:/home/pi/.minecraft/libraries/com/mojang/realms/1.7.59/realms-1.7.59.jar:/home/pi/.minecraft/libraries/org/apache/commons/commons-compress/1.8.1/commons-compress-1.8.1.jar:/home/pi/.minecraft/libraries/org/apache/httpcomponents/httpclient/4.3.3/httpclient-4.3.3.jar:/home/pi/.minecraft/libraries/commons-logging/commons-logging/1.1.3/commons-logging-1.1.3.jar:/home/pi/.minecraft/libraries/org/apache/httpcomponents/httpcore/4.3.2/httpcore-4.3.2.jar:/home/pi/.minecraft/libraries/org/apache/logging/log4j/log4j-api/2.0-beta9/log4j-api-2.0-beta9.jar:/home/pi/.minecraft/libraries/org/apache/logging/log4j/log4j-core/2.0-beta9/log4j-core-2.0-beta9.jar:/home/pi/.minecraft/libraries/org/lwjgl/lwjgl/lwjgl/2.9.4-nightly-20150209/lwjgl-2.9.4-nightly-20150209.jar:/home/pi/.minecraft/libraries/org/lwjgl/lwjgl/lwjgl_util/2.9.4-nightly-20150209/lwjgl_util-2.9.4-nightly-20150209.jar:/home/pi/.minecraft/libraries/tv/twitch/twitch/6.5/twitch-6.5.jar:/home/pi/.minecraft/versions/1.8.9/1.8.9.jar

MINECRAFT_ATOKEN="$(\
curl -i \
  -H "Accept:application/json" \
  -H "content-Type:application/json" \
  https://authserver.mojang.com/authenticate \
  -X POST \
  --data '{"agent": {"name": "Minecraft","version": 1}, "username": "'$MINECRAFT_LOGIN'", "password": "'$MINECRAFT_PASSWORD'",  "clientToken": "'$MINECRAFT_CLIENTTOKEN'" }' \
  | sed '/accessToken":"/!d;s//&\n/;s/.*\n//;:a;/",/bb;$!{n;ba};:b;s//\n&/;P;D' \
)"
# '

echo "todays access token = "$MINECRAFT_ATOKEN

/usr/lib/jvm/jdk-8-oracle-arm32-vfp-hflt/jre/bin/java \
    -Xmn128M -Xmx1024M \
    -XX:+UseConcMarkSweepGC \
    -XX:+CMSIncrementalMode \
    -XX:-UseAdaptiveSizePolicy \
    -Djava.library.path=$MINECRAFT_NATIVE_PATH \
    -cp $CP \
  net.minecraft.client.main.Main \
    --username $MINECRAFT_USERNAME \
    --accessToken "$MINECRAFT_ATOKEN" \
    --uuid "$MINECRAFT_UUID" \
    --version $MINECRAFT_VERSION \
    --userProperties {} \
    --gameDir ~/.minecraft \
    --assetsDir ~/.minecraft/assets \
    --assetIndex $MINECRAFT_VERSION

