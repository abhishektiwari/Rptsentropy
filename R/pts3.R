#! /usr/bin/env Rscript
# Copyright © 2010-2011 Abhishek Tiwari (abhishek@abhishek-tiwari.com)
#
# This file is part of ptsentropy.
#
# Files included in this package ptsentropy are copyrighted freeware
# distributed under the terms and conditions as specified in file LICENSE.
pts3 <- function(file.name, ...) UseMethod("pts3")

pts3.default <- function(file.name, type = 'conc')  {
  if(type == 'conc' && IsExtension('.csv', file.name))  {
    pts3obj(ReadConc(file.name))
  }
  else if(type == 'fix' && IsExtension('.fix', file.name))  {
    pts3obj(ReadFix(file.name))
  }
  else stop("Input data file format is invalid!")
}

