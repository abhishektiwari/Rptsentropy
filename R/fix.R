#! /usr/bin/env Rscript
# Copyright © 2010-2011 Abhishek Tiwari (abhishek@abhishek-tiwari.com)
#
# This file is part of ptsentropy.
#
# Files included in this package ptsentropy are copyrighted freeware
# distributed under the terms and conditions as specified in file LICENSE.
ReadFix <- function(file.name)  {
  tryCatch({
    mat <- as.matrix(read.delim(file.name, header = FALSE, skip = 1, sep = '\t'))
    return (mat)
  }, error = function(error) {
    stop("Problem with fix file! Hint: Assuming tab delimated")
  })
}
