library(lipidr)
library(ggplot2)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")
source("RIO.R")

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }

}

run <- function() {}

output <- function(outputfile) {
	d = readRDS(paste(pfix, parameters["data", 2], sep="/"))
	d_qc = d[,d$group == parameters["group", 2]]
saveRDS(d_qc, outputfile)
}

