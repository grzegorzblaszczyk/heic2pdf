#!/bin/bash

# heic2pdf v1.0

if [ "x$1" == "x" ] || [ "x$2" == "x" ]; then 
  echo "Usage:"
  echo "$0 [input_file] [outputfile]"
  exit 1;
fi

CONVERT=`which convert`
RM=`which rm`
INPUT_FILE="$1"
OUTPUT_FILE="$2"
TEMP_FILE="${INPUT_FILE%.*}.jpg"

if [ "x${CONVERT}" == "x" ]; then
  echo "Please install ImageMagick first!"
  exit 1;
fi

COLORSPACE="sRGB"
UNITS="PixelsPerInch"
RESAMPLE_VALUE="100"

echo "Converting ${INPUT_FILE} to ${OUTPUT_FILE} using ${TEMP_FILE}.."

${CONVERT} "${INPUT_FILE}" -colorspace "${COLORSPACE}" -units "${UNITS}" -resample "${RESAMPLE_VALUE}" "${TEMP_FILE}" && ${CONVERT} "${TEMP_FILE}" "${OUTPUT_FILE}" && ${RM} "${TEMP_FILE}"
