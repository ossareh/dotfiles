# GoLang
GOROOT=~/dev/go
if [ -d ${GOROOT} ]; then
    export GOROOT
    export PATH=${GOROOT}/bin:$PATH
fi

GOPATH=~/dev
if [ -d ${GOPATH} ]; then
    export GOPATH
    export PATH=${PATH}:${GOPATH}/bin
fi

