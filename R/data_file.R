#! /usr/bin/env Rscript
# Copyright © 2010-2011 Abhishek Tiwari (abhishek@abhishek-tiwari.com)
#
# This file is part of ptsentropy.
#
# Files included in this package ptsentropy are copyrighted freeware
# distributed under the terms and conditions as specified in file LICENSE.

VarName <- function(extension, file.name)  {
  var.name <- CleanVarName(sub(extension, '', data.file, 
                                                   ignore.case = TRUE,
                                                   perl = TRUE))
  return (var.name)
}

                                               
CleanVarName <- function(var.name)  {
  var.name <- gsub('_', '.', var.name, perl = TRUE)
  var.name <- gsub('-', '.', var.name, perl = TRUE)
  var.name <- gsub('\\s+', '.', var.name, perl = TRUE)
  return(var.name)
}

IsExtension <- function(extension, file.name)  {
  if(grepl(extension, file.name, ignore.case = TRUE, perl = TRUE))  {
  	return (1)
  }
  else return (0)
}

