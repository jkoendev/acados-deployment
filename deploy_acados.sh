set -e

ACADOS_COMMIT_ID=41d8e7df52f43ed20057a16df4c846be186c5fc6
ACADOS_SHORT_ID=41d8e7

git clone git@github.com:acados/acados.git
cd acados
git checkout 41d8e7df52f43ed20057a16df4c846be186c5fc6
git submodule init
git submodule update
cd ..

# linux
ACADOS_VERSION=${ACADOS_SHORT_ID}_linux
OUTPUT_DIR=output_tmp_$ACADOS_VERSION

cp -r acados $OUTPUT_DIR

mkdir $OUTPUT_DIR/lib

cp README.txt $OUTPUT_DIR
cp lib_linux/libacore.so $OUTPUT_DIR/lib
cp lib_linux/libacados.so $OUTPUT_DIR/lib
cp lib_linux/libblasfeo.so $OUTPUT_DIR/lib
cp lib_linux/libhpipm.so $OUTPUT_DIR/lib

cd $OUTPUT_DIR
zip -r -q acados-${ACADOS_VERSION}.zip .
cd ..
mv $OUTPUT_DIR/acados-${ACADOS_VERSION}.zip output/acados-${ACADOS_VERSION}.zip

rm -rf $OUTPUT_DIR

# windows
ACADOS_VERSION=${ACADOS_SHORT_ID}_win
OUTPUT_DIR=output_tmp_$ACADOS_VERSION

cp -r acados $OUTPUT_DIR

mkdir $OUTPUT_DIR/lib

cp README.txt $OUTPUT_DIR
cp lib_win/libacados.lib $OUTPUT_DIR/lib
cp lib_win/libblasfeo.lib $OUTPUT_DIR/lib
cp lib_win/libhpipm.lib $OUTPUT_DIR/lib

cd $OUTPUT_DIR
zip -r -q acados-${ACADOS_VERSION}.zip .
cd ..
mv $OUTPUT_DIR/acados-${ACADOS_VERSION}.zip output/acados-${ACADOS_VERSION}.zip

rm -rf $OUTPUT_DIR

# cleanup
rm -rf acados
