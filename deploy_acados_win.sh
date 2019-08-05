ACADOS_COMMIT_ID=41d8e7df52f43ed20057a16df4c846be186c5fc6
ACADOS_SHORT_ID=41d8e7
ACADOS_VERSION=${ACADOS_SHORT_ID}_win
OUTPUT_DIR=output_tmp_$ACADOS_VERSION

DOWNLOAD_URL=https://github.com/acados/acados/archive/$ACADOS_COMMIT_ID.zip
wget $DOWNLOAD_URL -O acados_src.zip

unzip -q acados_src.zip

mv acados-$ACADOS_COMMIT_ID $OUTPUT_DIR

mkdir $OUTPUT_DIR/lib

cp README.txt $OUTPUT_DIR
cp lib_win/libacados.lib $OUTPUT_DIR/lib
cp lib_win/libblasfeo.lib $OUTPUT_DIR/lib
cp lib_win/libhpipm.lib $OUTPUT_DIR/lib

cd $OUTPUT_DIR
zip -r -q acados-${ACADOS_VERSION}.zip .
cd ..
mv $OUTPUT_DIR/acados-${ACADOS_VERSION}.zip output

rm -rf $OUTPUT_DIR
