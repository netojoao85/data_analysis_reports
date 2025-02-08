# Function to classify the skewness magnitude:

magnitude_skewness_classification <- function(skewness_value){
  if(abs(skewness_value) < 0.5) {
    return("fairly symmetrical")
  }
  
  if(between(abs(skewness_value), 0.5, 1.0)) {
    return("moderately skewed")
  }
  
  if(abs(skewness_value) > 1.0) {
    return("highly skewed")
  }
}