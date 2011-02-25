#! /usr/bin/env Rscript
# Copyright © 2010-2011 Abhishek Tiwari (abhishek@abhishek-tiwari.com)
#
# This file is part of ptsentropy.
#
# Files included in this package ptsentropy are copyrighted freeware
# distributed under the terms and conditions as specified in file LICENSE.
pts3obj <- function(data.stream, ...) UseMethod("pts3obj")

pts3obj.default <- function(data.stream, ...)  {
  if(is.vector(data.stream) || is.matrix(data.stream))  {
    if(is.vector(data.stream))  {
      if(is.numeric(data.stream))  {
        object <- list(conc = data.stream)
        class(object) <- "pts3"
        return (object)
      }
      else  stop("Input vector data.stream is not numeric vector")
    }
    else if(is.matrix(data.stream))  {
      if(is.numeric(data.stream))  {
        tryCatch({
          object <- list(conc = data.stream[,1], prec = data.stream[,2],
                         time = data.stream[,3], repl = data.stream[,4])
          class(object) <- "pts3"
          return (object)
        }, error = function(error) {
          stop("Invalid matrix object, expecting 4 numeric vectors. Hint: cbind(v1,v2,v3,v4)")
        })
      }
      else  stop("Input data.stream is not numeric type")
    }   
  }
  else stop("Input data.stream neither a vector nor a matrix")
}
