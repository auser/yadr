export LLVM_DIR=/usr/local/Cellar/llvm/6.0.1/lib/cmake
export LDFLAGS="-L/usr/local/opt/llvm@4/lib -Wl,-rpath,/usr/local/opt/llvm@4/lib"
export PATH="/usr/local/opt/llvm@4/bin:$PATH"

alias antlr='java -jar ~/.yadr/bin/antlr-4.7-complete.jar'
