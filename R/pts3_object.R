#! /usr/bin/env Rscript
# Copyright © 2010-2011 Abhishek Tiwari (abhishek@abhishek-tiwari.com)
#
# This file is part of ptsentropy.
#
# Files included in this package ptsentropy are copyrighted freeware
# distributed under the terms and conditions as specified in file LICENSE.
pts3obj <- function(x, ...) UseMethod("pts3obj")

pts3obj.default <- function(x, ...)  {
  if(is.vector(x) || is.matrix(x))  {
    if(is.vector(x))  {
      if(is.numeric(x))  {
        object <- list(conc = x)
        class(object) <- "pts3"
        return (object)
      }
      else  stop("Input vector x is not numeric vector")
    }
    else if(is.matrix(x))  {
      if(is.numeric(x))  {
        tryCatch({
          object <- list(conc = x[,1], prec = x[,2], time = x[,3], repl = x[,4])
          class(object) <- "pts3"
          return (object)
        }, error = function(error) {
          stop("Invalid matrix object, expecting 4 numeric vectors. Hint: cbind(v1,v2,v3,v4)")
        })
      }
      else  stop("Input x is not numeric type")
    }   
  }
  else stop("Input x neither a vector nor a matrix")
}
