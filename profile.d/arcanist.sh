# arcanist
ARC_PATH=~/dev/src/github.com/phacility/arcanist
if [ -d ${ARC_PATH} ]; then
    export PATH=${ARC_PATH}/bin:${PATH}
    source ${ARC_PATH}/resources/shell/bash-completion
fi

