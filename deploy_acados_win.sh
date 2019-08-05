ACADOS_COMMIT_ID=41d8e7df52f43ed20057a16df4c846be186c5fc6
ACADOS_VERSION=41d8e7_win
OUTPUT_DIR=output_tmp_$ACADOS_VERSION



DOWNLOAD_URL=https://github.com/acados/acados/archive/$ACADOS_COMMIT_ID.zip
wget $DOWNLOAD_URL -O acados_src.zip

mkdir $OUTPUT_DIR
mkdir $OUTPUT_DIR/lib

mv acados_src.zip $OUTPUT_DIR
cp README.txt $OUTPUT_DIR
cp lib/libacados.lib $OUTPUT_DIR/lib
cp lib/libblasfeo.lib $OUTPUT_DIR/lib
cp lib/libhpipm.lib $OUTPUT_DIR/lib

cd $OUTPUT_DIR
zip -r ../acados-${ACADOS_VERSION}.zip .
cd ..
mv $OUTPUT_DIR/acados-${ACADOS_VERSION}.zip .

rm -r $OUTPUT_DIR
