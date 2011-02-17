#! /usr/bin/env Rscript
# Copyright © 2010-2011 Abhishek Tiwari (abhishek@abhishek-tiwari.com)
#
# This file is part of ptsentropy.
#
# Files included in this package ptsentropy are copyrighted freeware
# distributed under the terms and conditions as specified in file LICENSE.
pts3 <- function(x, ...) UseMethod("pts")

pts3.default <- function(x, ...)  {
  if(is.vector(x) && is.numeric(x))  {
    object <- list(concentration = x)
    class(object) <- "pts"
    return (object)
  }
  else  stop("input x is not numeric vector")
}

pts3.fix <- function(x, ...) {
  if(is.matrix(x))  {
    if(is.numeric(x))  {
      object <- list(conc = x[,1], prec = x[,2], time = x[,3], repl = x[,4])
      class(object) <- "pts"
      return (object)
    }
    else  stop("input x is not numeric type")
  }
  else  stop("input x is not a matrix")
}
