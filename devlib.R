#! /usr/bin/env Rscript
# Copyright © 2010-2011 Abhishek Tiwari (abhishek@abhishek-tiwari.com)
#
# This file is part of ptsentropy.
#
# Files included in this package ptsentropy are copyrighted freeware
# distributed under the terms and conditions as specified in file LICENSE.

# Adopted from http://goo.gl/2lO2q
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!@
# Delete this file when packge development is over
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!@

# Load all files with extension .R into the workspace
sapply(list.files("R", pattern="\\.R$", ignore.case=TRUE, full.names=TRUE), source)
invisible(NULL)