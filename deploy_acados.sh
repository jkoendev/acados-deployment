set -e

ACADOS_COMMIT_ID=53b661f99e526d1bf5be166a9b552641df361219
ACADOS_SHORT_ID=53b661

git clone https://github.com/acados/acados.git
cd acados
git checkout $ACADOS_COMMIT_ID
git submodule init
git submodule update
cd ..

# linux
ACADOS_VERSION=${ACADOS_SHORT_ID}_linux
OUTPUT_DIR=output_tmp_$ACADOS_VERSION

cd acados
rsync -a . ../$OUTPUT_DIR --exclude='.git*'
cd ..

mkdir $OUTPUT_DIR/lib

# compile for linux
mkdir acados_build
cd acados_build
cmake -D BLASFEO_TARGET=GENERIC -D HPIPM_TARGET=GENERIC -D ACADOS_INSTALL_DIR=../acados_install -DBUILD_SHARED_LIBS=ON ../$OUTPUT_DIR
make
make install
cd ..

cp README.txt $OUTPUT_DIR
cp acados_install/lib/libacados.so $OUTPUT_DIR/lib
cp acados_install/lib/libblasfeo.so $OUTPUT_DIR/lib
cp acados_install/lib/libhpipm.so $OUTPUT_DIR/lib
cp acados_install/include/blasfeo/include/blasfeo_target.h $OUTPUT_DIR/external/blasfeo/include/

cd $OUTPUT_DIR
zip -r -q acados-${ACADOS_VERSION}.zip .
cd ..
mv $OUTPUT_DIR/acados-${ACADOS_VERSION}.zip output/acados-${ACADOS_VERSION}.zip

rm -rf $OUTPUT_DIR
rm -rf acados_build
rm -rf acados_install

# windows
ACADOS_VERSION=${ACADOS_SHORT_ID}_win
OUTPUT_DIR=output_tmp_$ACADOS_VERSION

cd acados
rsync -a . ../$OUTPUT_DIR --exclude='.git*'
cd ..

mkdir $OUTPUT_DIR/lib

# compile for windows
mkdir acados_build
cd acados_build
cmake.exe -G "MinGW Makefiles" -D BLASFEO_TARGET=GENERIC -D HPIPM_TARGET=GENERIC -D ACADOS_INSTALL_DIR=../acados_install -DBUILD_SHARED_LIBS=OFF ../$OUTPUT_DIR
mingw32-make.exe
mingw32-make.exe install
cd ..

cp README.txt $OUTPUT_DIR
cp acados_install/lib/libacados.lib $OUTPUT_DIR/lib
cp acados_install/lib/libblasfeo.lib $OUTPUT_DIR/lib
cp acados_install/lib/libhpipm.lib $OUTPUT_DIR/lib
cp acados_install/include/blasfeo/include/blasfeo_target.h $OUTPUT_DIR/external/blasfeo/include/

cd $OUTPUT_DIR
zip -r -q acados-${ACADOS_VERSION}.zip .
cd ..
mv $OUTPUT_DIR/acados-${ACADOS_VERSION}.zip output/acados-${ACADOS_VERSION}.zip

rm -rf $OUTPUT_DIR
rm -rf acados_build
rm -rf acados_install

# cleanup
rm -rf acados
