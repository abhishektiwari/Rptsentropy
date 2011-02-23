#! /usr/bin/env Rscript
# Copyright © 2010-2011 Abhishek Tiwari (abhishek@abhishek-tiwari.com)
#
# This file is part of ptsentropy.
#
# Files included in this package ptsentropy are copyrighted freeware
# distributed under the terms and conditions as specified in file LICENSE.
# Supported file extensions:
#
# .csv: Single column CSV files.
# .fix: CSV files that use a tab separator.

# Current data reader functions.
CSVReader <- function(data.file, file.name, var.name) {
  assign(var.name,
         pts3obj(as.matrix(read.csv(file.name, header = FALSE, sep = '\t'))[,1]),
         envir = .GlobalEnv)
}

# Current data reader functions.
FIXReader <- function(data.file, file.name, var.name)
{
  assign(var.name,
         pts3obj(as.matrix(read.delim(file.name, header = FALSE, skip = 1, sep = '\t'))),
         envir = .GlobalEnv)
}


# Use a list to map file extension detection regular expressions to the
# appropriate reader functions.
extensions.dispatch.table <- list("\\.csv$" = CSVReader,
                                  "\\.fix$" = FIXReader)

data.files <- dir('data')

for (data.file in data.files)
{
  for (extension in names(extensions.dispatch.table))
  {
    file.name <- file.path('data', data.file)
        
    if (grepl(extension, data.file, ignore.case = TRUE, perl = TRUE))
    {
      var.name <- CleanVarName(sub(extension, '', data.file,
                                                  ignore.case = TRUE,
                                                  perl = TRUE))

      cat(paste("Loading Time Series Object: ", var.name, '\n', sep = ''))
      
      do.call(extensions.dispatch.table[[extension]],
              list(data.file,
                   file.name,
                   var.name))
      
      break()
    }
  }
}
