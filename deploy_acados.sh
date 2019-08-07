set -e

ACADOS_COMMIT_ID=1171fa9cc6e46703668075fa9ed99d62dceac6e7
ACADOS_SHORT_ID=1171fa

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

cp README.txt $OUTPUT_DIR
cp lib_linux/libacore.so $OUTPUT_DIR/lib
cp lib_linux/libacados.so $OUTPUT_DIR/lib
cp lib_linux/libblasfeo.so $OUTPUT_DIR/lib
cp lib_linux/libhpipm.so $OUTPUT_DIR/lib
cp lib_linux/blasfeo_target.h $OUTPUT_DIR/external/blasfeo/include/

cd $OUTPUT_DIR
zip -r -q acados-${ACADOS_VERSION}.zip .
cd ..
mv $OUTPUT_DIR/acados-${ACADOS_VERSION}.zip output/acados-${ACADOS_VERSION}.zip

rm -rf $OUTPUT_DIR

# windows
ACADOS_VERSION=${ACADOS_SHORT_ID}_win
OUTPUT_DIR=output_tmp_$ACADOS_VERSION

cd acados
rsync -a . ../$OUTPUT_DIR --exclude='.git*'
cd ..

mkdir $OUTPUT_DIR/lib

cp README.txt $OUTPUT_DIR
cp lib_win/libacados.lib $OUTPUT_DIR/lib
cp lib_win/libblasfeo.lib $OUTPUT_DIR/lib
cp lib_win/libhpipm.lib $OUTPUT_DIR/lib
cp lib_win/blasfeo_target.h $OUTPUT_DIR/external/blasfeo/include/

cd $OUTPUT_DIR
zip -r -q acados-${ACADOS_VERSION}.zip .
cd ..
mv $OUTPUT_DIR/acados-${ACADOS_VERSION}.zip output/acados-${ACADOS_VERSION}.zip

rm -rf $OUTPUT_DIR

# cleanup
rm -rf acados
