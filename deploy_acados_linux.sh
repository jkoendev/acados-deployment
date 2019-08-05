ACADOS_COMMIT_ID=41d8e7df52f43ed20057a16df4c846be186c5fc6
ACADOS_SHORT_ID=41d8e7
ACADOS_VERSION=${ACADOS_SHORT_ID}_linux
OUTPUT_DIR=output_tmp_$ACADOS_VERSION

mkdir $OUTPUT_DIR
mkdir $OUTPUT_DIR/lib

DOWNLOAD_URL=https://github.com/acados/acados/archive/$ACADOS_COMMIT_ID.zip
wget $DOWNLOAD_URL -O acados_src.zip

mv acados_src.zip $OUTPUT_DIR
cp README.txt $OUTPUT_DIR
cp lib_linux/libacore.so $OUTPUT_DIR/lib
cp lib_linux/libacados.so $OUTPUT_DIR/lib
cp lib_linux/libblasfeo.so $OUTPUT_DIR/lib
cp lib_linux/libhpipm.so $OUTPUT_DIR/lib

cd $OUTPUT_DIR
zip -r -q acados-${ACADOS_VERSION}.zip .
cd ..
