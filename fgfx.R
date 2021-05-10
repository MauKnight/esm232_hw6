#'  Forest growth
#' @param T period of growth
#' @param C size of the forest
#' @param parms$r - early exponential growth rate
#' @param parms$g - linear growth rate
#' @parms parms$f - canopy closure threshold
#' @parms parms$K - carrying capacity
#' @return change in population 
#' Authors: David Segan, Mauricio Collado, Simone Alburqueque and Siya Qiu
forest_growth = function(time, C, parms) {
  
  # compute rate of change of forest
  dexfor = parms$r*C
  
  
  # establish the conditionals between carrying capacity and canopy closure
  dexfor =ifelse(C > parms$K, 0, # set rate of change to 0 if C > K 
                 ifelse(C > parms$f, parms$g, # else, set rate of change to g if C > f
                        dexfor)) # else, default rate of change is r*C
  
  return(list(dexfor))
}
