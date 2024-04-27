cd Compiler
ANDROID_BUILD_OPTION=android_Release_aarch64
HEXAGON_BUILD_OPTION=hexagon_Release_dynamic_toolv83_v65
#clean
make  tree clean V=${ANDROID_BUILD_OPTION} CDSP_FLAG=1
make  tree clean V=${HEXAGON_BUILD_OPTION}
#build
make  tree V=${ANDROID_BUILD_OPTION} CDSP_FLAG=1
make  tree V=${HEXAGON_BUILD_OPTION}
#sign
python2.7 $HEXAGON_SDK_ROOT/tools/elfsigner/elfsigner.py -i ${HEXAGON_BUILD_OPTION}/ship/*.so -o ${HEXAGON_BUILD_OPTION}/ship/signed/
#test
adb shell mkdir -p /data/local/tmp/EasyDSP/
adb push ${ANDROID_BUILD_OPTION}/ship/* /data/local/tmp/EasyDSP/
adb push ${HEXAGON_BUILD_OPTION}/ship/signed/*.so /data/local/tmp/EasyDSP/
adb shell "export LD_LIBRARY_PATH=/data/local/tmp/EasyDSP ADSP_LIBRARY_PATH=/data/local/tmp/EasyDSP; /data/local/tmp/EasyDSP/calculator 0 1000"
cd ..

