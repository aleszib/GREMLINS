% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predictMBM.R
\name{predictMBM}
\alias{predictMBM}
\title{Predict NAs in a Collection of Networks from a fitted MBM}
\usage{
predictMBM(RESMBM, whichModel = 1)
}
\arguments{
\item{RESMBM}{a fitted multipartite blockmodel}

\item{whichModel}{The index corresponding to the model used for prediction (default is 1, the best model)}
}
\value{
the collection of matrices of predictions (probability for binary, intensity for weighted network) a
}
\description{
Predict NAs in a Collection of Networks from a fitted MBM
}
\examples{
namesFG <- c('A','B')
list_pi <- list(c(0.5,0.5),c(0.3,0.7)) # prop of blocks in each FG
E  <-  rbind(c(1,2),c(2,2)) # architecture of the multipartite net.
typeInter <- c( "inc","diradj")
v_distrib <- c('gaussian','bernoulli')
list_theta <- list()
list_theta[[1]] <- list()
list_theta[[1]]$mean  <- matrix(c(6.1, 8.9, 6.6, 3), 2, 2)
list_theta[[1]]$var  <-  matrix(c(1.6, 1.6, 1.8, 1.5),2, 2)
list_theta[[2]] <- matrix(c(0.7,1.0, 0.4, 0.6),2, 2)
list_Net <- rMBM(v_NQ = c(30,30),E , typeInter, v_distrib, list_pi,
                list_theta, namesFG = namesFG, seed = 2)$list_Net
res_MBMsimu <- multipartiteBM(list_Net, v_distrib,
                              namesFG = c('A','B'), v_Kinit = c(2,2),
                              nbCores = 2,initBM = FALSE)
pred <- predictMBM(res_MBMsimu)
}
