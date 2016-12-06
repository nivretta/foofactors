<!-- README.md is generated from README.Rmd. Please edit that file -->
**NOTE: This is a toy package created for expository purposes by Jenny Bryan, and edited by Nivretta Thatra for Stat 545 2016. It is not meant to actually be useful. If you want a package for factor handling, please see [forcats](https://cran.r-project.org/package=forcats).**

### foofactors

Factors are a very useful type of variable in R, but they can also drive you nuts. This package provides some helper functions for the care and feeding of factors.

### Installation

``` r
library("devtools")
devtools::install_github("nivretta/foofactors")
```

### Quick demo

### Keeping order of levels via `givenorder()`:

``` r
library(foofactors)
#> 
#> Attaching package: 'foofactors'
#> The following object is masked from 'package:base':
#> 
#>     character
z <- factor(c("b", "c", "a", "e", "b"))
```

Normally the levels will be ordered alphabetically.

``` r
factor(z)
#> [1] b c a e b
#> Levels: a b c e
```

Sometimes you'd like to maintain the order levels in which they appear in the data.

``` r
givenorder(z)
#> [1] b c a e b
#> Levels: b c a e
```

### Change some factors to characters

Check for factors where number of unique values = length, and change to character.

``` r
m <- factor(c("a", "b", "c", "d"))
class(m)
#> [1] "factor"

m_character <- character(m)
class(m_character)
#> [1] "character"
```

Otherwise print nochange.

``` r
n <- factor(c("a", "b", "c", "d", "a"))
class(n)
#> [1] "factor"

character(n)
#> [1] "NOCHANGE"
```

Binding two factors via `fbind()`:

``` r
a <- factor(c("character", "hits", "your", "eyeballs"))
b <- factor(c("but", "integer", "where it", "counts"))
```

Simply catenating two factors leads to a result that most don't expect.

``` r
c(a, b)
#> [1] 1 3 4 2 1 3 4 2
```

The `fbind()` function glues two factors together and returns factor.

``` r
fbind(a, b)
#> [1] character hits      your      eyeballs  but       integer   where it 
#> [8] counts   
#> Levels: but character counts eyeballs hits integer where it your
```

Often we want a table of frequencies for the levels of a factor. The base `table()` function returns an object of class `table`, which can be inconvenient for downstream work. Processing with `as.data.frame()` can be helpful but it's a bit clunky.

``` r
set.seed(1234)
x <- factor(sample(letters[1:5], size = 100, replace = TRUE))
table(x)
#> x
#>  a  b  c  d  e 
#> 25 26 17 17 15
as.data.frame(table(x))
#>   x Freq
#> 1 a   25
#> 2 b   26
#> 3 c   17
#> 4 d   17
#> 5 e   15
```

The `freq_out()` function returns a frequency table as a well-named `tbl_df`:

``` r
freq_out(x)
#> # A tibble: 5 × 2
#>        x     n
#>   <fctr> <int>
#> 1      a    25
#> 2      b    26
#> 3      c    17
#> 4      d    17
#> 5      e    15
```
