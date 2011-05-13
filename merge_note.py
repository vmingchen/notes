#!/usr/bin/env python
'''
File: merge_note.py
Author: Ming Chen
Description: merge multiple notes to s single one 
Change Log:
  v0.1, 01/05/11 23:02:02, initial version
  v0.2, 08/05/11 21:27:22, fix bug of losing last line
'''
import sys

H_TOKEN="===="

notes = {}

for fnote in sys.argv[1:]:
    lastline = ""
    header = ""
    for line in open(fnote):
        if line.startswith(H_TOKEN):
            header = lastline
            notes.setdefault(header, "")
            lastline = ""
            continue
        if header:
            notes[header] += lastline
        lastline = line
    if lastline:
        notes[header] += lastline


for header, content in notes.items():
    sys.stdout.write(header)
    print H_TOKEN
    print content
