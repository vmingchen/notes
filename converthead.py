#!/usr/bin/env python
import sys

preline = sys.stdin.readline()
for curline in sys.stdin:
    if curline.startswith("===="):
        sys.stdout.write("# ")
    if not preline.startswith("===="):
        sys.stdout.write(preline)
    preline = curline

if preline:
    sys.stdout.write(preline)
