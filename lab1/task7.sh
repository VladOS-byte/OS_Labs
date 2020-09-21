#!/bin/bash
resourse='\b[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b'
grep -E -o $resourse $(find /etc -maxdepth 1 -type f) | cut -d: -f2 > emails.lst
exit