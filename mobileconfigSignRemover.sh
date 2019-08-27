#!/bin/sh
#
# -----------------------------------------------------------------------------
# Purpose : remove sigunature from mobileconfig profile
# -----------------------------------------------------------------------------
# Description :
#  remove sign from mobileconfig profile
#
# 2019.08.27 created https://github.com/n-isoda
# -----------------------------------------------------------------------------

input_file=$1

if [ ! -e "${input_file}" ] ; then
    echo "${input_file} dose not exist!"
    ret=1
else
    openssl smime -inform DER -verify -in "${input_file}" -noverify 2>/dev/null \
        | plutil -convert xml1 -o - -- -
fi

exit ${ret}

