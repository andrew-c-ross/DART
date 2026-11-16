#!/bin/bash

cd "$(git rev-parse --show-toplevel)"
for m in time_manager_mod ensemble_manager_mod; do 
  grep -rlE --include='*.f90' --include='*.F90' --include='*.nml' "\b$m\b" . \
  | xargs sed -E -i.bak "s/\b$m\b/dart_$m/g" 
  f=$(find . -name "$m.f90"); git mv "$f" "$(dirname $f)/dart_$m.f90"
done
find . -name '*.bak' -delete