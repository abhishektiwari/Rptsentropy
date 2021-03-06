#! /usr/bin/env Rscript
# Copyright © 2010-2011 Abhishek Tiwari (abhishek@abhishek-tiwari.com)
#
# This file is part of ptsentropy.
#
# Files included in this package ptsentropy are copyrighted freeware
# distributed under the terms and conditions as specified in file LICENSE.
SampEn <- function(entropy3)  {
  cmr <- Cmr(entropy3[["conc"]], entropy3[["m"]], entropy3[["r"]], FALSE)
  cmr1 <- Cmr(entropy3[["conc"]], entropy3[["m"]]+1, entropy3[["r"]], FALSE)
  if(cmr1>0 && cmr!=0)  {
    return (-log(cmr1/cmr))
  }
  else return ("Undefined")
}
