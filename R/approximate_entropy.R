#! /usr/bin/env Rscript
# Copyright © 2010-2011 Abhishek Tiwari (abhishek@abhishek-tiwari.com)
#
# This file is part of ptsentropy.
#
# Files included in this package ptsentropy are copyrighted freeware
# distributed under the terms and conditions as specified in file LICENSE.
ApEn <- function(entropy3)  {
  cmr <- Cmr(entropy3[["conc"]], entropy3[["m"]], entropy3[["r"]], TRUE)
  cmr1 <- Cmr(entropy3[["conc"]], entropy3[["m"]]+1, entropy3[["r"]], TRUE)
  return (log(cmr/cmr1))
}



