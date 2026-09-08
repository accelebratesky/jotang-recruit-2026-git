#!/usr/bin/env bash

destination="$1"
shift

mkdir -p "$destination"

for file in "$@"
do
    cp -- "$file" "$destination/"
done
