Multiples of 3 and 5
================
H. Cole Warren
September 22, 2019

If we list all the natural numbers below 10 that are multiples of 3 or
5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.

### Solution

``` r
# All natural numbers <1000
number_line <- 1:999

# Test if numbers are divisible by 3 or 5
logical_vector <- !(number_line %% 3) | !(number_line %% 5)

# Index number_line using logical_vector and sum the output
sum(number_line[logical_vector])
```

    ## [1] 233168

Further generalized; instead of the sum of all multiples of 3 or 5 below
1000, find the sum of all multiples of 4, 11, 13, or 25 below 10000. Or
the sum of any set of multiples below any number.

``` r
library(purrr)

# Generate a logical vector that is TRUE for each element in the set, S, that is
# divisible by m
divis_by <- function(m, S) {
  !(S %% m) # If remainder is zero, returns TRUE
}

sum_multiples_below <- function(multiples, below) {
  # Generate number line
  number_line <- 1:(below-1)
  
  # Map divis_by to each multiple and store each logical vector in a list
  logi_list <- map(multiples, divis_by, S = number_line)
  index <- reduce(logi_list, `|`) # Collapse the list into a single indexing vector,
  sum(number_line[index])         # index the number_line with it, and return the sum
}

sum_multiples_below(multiples = c(3, 5), below = 1000)
```

    ## [1] 233168

``` r
sum_multiples_below(multiples = c(4, 11, 13, 25), below = 10000)
```

    ## [1] 19795823
