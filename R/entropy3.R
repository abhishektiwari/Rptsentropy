#! /usr/bin/env Rscript
# Copyright © 2010-2011 Abhishek Tiwari (abhishek@abhishek-tiwari.com)
#
# This file is part of ptsentropy.
#
# Files included in this package ptsentropy are copyrighted freeware
# distributed under the terms and conditions as specified in file LICENSE.
entropy3 <- function(pts3obj, ...) UseMethod("entropy3")

entropy3.default <- function(pts3obj, m = 2, r = 0.2)  {
  if(is.null(attr(pts3obj, "class")))  {
    stop('No class attribute! Method requires a pts3 object')
  }
  else if(class(pts3obj) == 'pts3')  {
    object <- list(conc = pts3obj[["conc"]], m = m, r = r)
    class(object) <- "entropy3"
    return (object)
  }
  else stop('Invalid object! Method requires a pts3 object')
}
