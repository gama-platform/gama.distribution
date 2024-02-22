#!/bin/bash
set -e -o pipefail

jekyll build 

cat __site/_headers.d/* > _site/_headers
echo "Generated headers!"

mv -v __site/_redirects _site/