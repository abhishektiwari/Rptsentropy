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
  else  {
    # If want to remove the loop you can try rollapply from zoo package
    # which returns array with dim as no of subsequences and m. V SLOW!!
    # subseq <- rollapply(z, m,function(x)(x))
    subseq <- list()
    for( i in 1:length(conc.vec)) {
      if(i <= length(conc.vec)-m+1)  {
        subseq[[i]] <- conc.vec[i:(i+m-1)]
      } 
    }
    return (subseq)  	
  }
}

MatchSubSeq <- function(subseq1, subseq2, r)  {
  return (all(abs(subseq1-subseq2)<r))
}

CountMatchedSubSeq <- function(subseq, r, self)  {
  match.count <- numeric(length(subseq))
  nsubseq <- do.call(cbind,subseq)
  for(i in 1:length(subseq))  {
    for(j in 1:length(subseq))  {
      if(MatchSubSeq(nsubseq[,i], nsubseq[,j], r) && i!=j)  { 
        match.count[i] = match.count[i] + 1
      }
      if(MatchSubSeq(nsubseq[,i], nsubseq[,j], r) && self && i==j)  {
        match.count[i] = match.count[i] + 1
      }
    }
  }
  return (match.count)
}

Cmr <- function(conc.vec, m, r, self)  {
  sigma.cmir <- sum(CountMatchedSubSeq(MakeSubSeq(conc.vec, m), 
                    r, self))/(length(conc.vec)-m+1)
  cmr <- sigma.cmir/(length(conc.vec)-m+1)
  return (cmr)
}
