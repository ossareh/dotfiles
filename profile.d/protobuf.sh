# protobuf
LOCAL_LIB=/usr/local/lib
if [ -d ${LOCAL_LIB} ]; then
    export LD_LIBRARY_PATH=${LOCAL_LIB}:$LD_LIBRARY_PATH
fi
