#! /usr/bin/env Rscript
# Copyright © 2010-2011 Abhishek Tiwari (abhishek@abhishek-tiwari.com)
#
# This file is part of ptsentropy.
#
# Files included in this package ptsentropy are copyrighted freeware
# distributed under the terms and conditions as specified in file LICENSE.

MakeSubSeq <- function(conc.vec, m)  {
  if (m > length(conc.vec))  {
    top("the block size m = ", m, 
        " is greater than length of time series (", 
        length(conc.vec), ")")
  }
  subseq <- list()
  for( i in 1:length(conc.vec)) {
    if(i <= length(conc.vec)-m+1)  {
      subseq[[i]] <- conc.vec[i:(i+m-1)]
    } 
  }
  return (subseq)
}

MatchSubSeq <- function(sseq1, sseq2, r)  {
  return (all(abs(sseq1-sseq2)<r))
}

CountMatchedSubSeq <- function(subseq, r)  {
  match.count <- numeric(length(subseq))
  nsubseq <- do.call(cbind,subseq)
  for(i in 1:length(subseq))  {
    for(j in 1:length(subseq))  {
      if(MatchSubSeq(nsubseq[,i], nsubseq[,j], r))  { 
        match.count[i] = match.count[i] + 1
      }
    }
  }
  return (match.count)
}

Cmr <- function(conc.vec, m, r)  {
  sigma.cmir <- sum(CountMatchedSubSeq(MakeSubSeq(conc.vec, m), r))/(length(conc.vec)-m+1)
  cmr <- sigma.cmir/(length(conc.vec)-m+1)
  return (cmr)
}

ApEn <- function(apen3)  {
    cmr <- Cmr(apen3[["conc"]], apen3[["m"]], apen3[["r"]])
    cmr1 <- Cmr(apen3[["conc"]], apen3[["m"]]+1, apen3[["r"]])
	return (log(cmr/cmr1))
}

apen3 <- function(pts3obj, ...) UseMethod("apen3")

apen3.default <- function(pts3obj, m, r)  {
  if(is.null(attr(pts3obj, "class")))  {
    stop('No class attribute! Method requires a pts3 object')
  }
  else if(class(pts3obj) == 'pts3')  {
    object <- list(conc = pts3obj[["conc"]], m = m, r = r)
    class(object) <- "apen3"
    return (object)
  }
  else stop('Invalid object! Method requires a pts3 object')
}

