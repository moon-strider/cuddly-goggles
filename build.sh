cd build
rm -rf ./*
cmake ../
make -j12
./cback 5875
cd ..
