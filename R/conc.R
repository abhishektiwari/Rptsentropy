#! /usr/bin/env Rscript
# Copyright © 2010-2011 Abhishek Tiwari (abhishek@abhishek-tiwari.com)
#
# This file is part of ptsentropy.
#
# Files included in this package ptsentropy are copyrighted freeware
# distributed under the terms and conditions as specified in file LICENSE.
ReadConc <- function(file.name)  {
  tryCatch({
    vec <- as.matrix(read.csv(file.name, header = FALSE, sep = '\t'))[,1]
    return (vec)
  }, error = function(error) {
    stop("Problem with Conc file!")
  })
}
