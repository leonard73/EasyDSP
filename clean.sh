cd Compiler
ANDROID_BUILD_OPTION=android_Release_aarch64
HEXAGON_BUILD_OPTION=hexagon_Release_dynamic_toolv83_v65
#clean
make  tree clean V=${ANDROID_BUILD_OPTION} CDSP_FLAG=1
make  tree clean V=${HEXAGON_BUILD_OPTION}

cd ..

