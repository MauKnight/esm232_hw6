#'  Forest growth
#' @param T period of growth
#' @param C size of the forest
#' @param parms$r - early exponential growth rate
#' @param parms$g - linear growth rate
#' @parms parms$f - canopy closure threshold
#' @parms parms$K - carrying capacity
#' @return change in population 
#'
forest_growth = function(time, C, parms) {
  
  # compute rate of change of forest
  dexfor = parms$r*C
  
  # set rate of change to 0 if C is greater than K 
  # else, set rate of change to g if C is greater than f
  # else, default rate of change is r*C
  
  dexfor =ifelse(C > parms$K, 0, ifelse(C > parms$f, parms$g, dexfor))
  return(list(dexfor))
}
