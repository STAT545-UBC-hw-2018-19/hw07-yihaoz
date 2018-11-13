README for foofactors
================

This is the readme file for foofactors.

**NOTE: This is a toy package created for expository purposes. It is not
meant to actually be useful. If you want a package for factor handling,
please see [forcats](https://cran.r-project.org/package=forcats).**

### foofactors

Factors are a very useful type of variable in R, but they can also drive
you nuts. This package provides some helper functions for the care and
feeding of factors. The package was originally created by Jenny Brian
and can be accessed from [here](https://github.com/jennybc/foofactors).

### Installation

``` r
devtools::install_github("STAT545-UBC-students/hw07-yihaoz/foofactors")
```

### Quick demo

Binding two factors via `fbind()`:

``` r
library(foofactors)
a <- factor(c("character", "hits", "your", "eyeballs"))
b <- factor(c("but", "integer", "where it", "counts"))
```

Simply catenating two factors leads to a result that most don’t expect.

``` r
c(a, b)
```

    ## [1] 1 3 4 2 1 3 4 2

The `fbind()` function glues two factors together and returns
    factor.

``` r
fbind(a, b)
```

    ## [1] character hits      your      eyeballs  but       integer   where it 
    ## [8] counts   
    ## Levels: but character counts eyeballs hits integer where it your

Often we want a table of frequencies for the levels of a factor. The
base `table()` function returns an object of class `table`, which can be
inconvenient for downstream work. Processing with `as.data.frame()` can
be helpful but it’s a bit clunky.

``` r
set.seed(1234)
x <- factor(sample(letters[1:5], size = 100, replace = TRUE))
table(x)
```

    ## x
    ##  a  b  c  d  e 
    ## 25 26 17 17 15

``` r
as.data.frame(table(x))
```

    ##   x Freq
    ## 1 a   25
    ## 2 b   26
    ## 3 c   17
    ## 4 d   17
    ## 5 e   15

The `freq_out()` function returns a frequency table as a well-named
`tbl_df`:

``` r
freq_out(x)
```

    ## # A tibble: 5 x 2
    ##   x         n
    ##   <fct> <int>
    ## 1 a        25
    ## 2 b        26
    ## 3 c        17
    ## 4 d        17
    ## 5 e        15

## Detect factor that should be character using `fdetect()`

Detect factors that should be character because \# unique values =
length.

``` r
# For a non-character factor, it returns FALSE:
fdetect(factor(c("a", "b", "c","c")))
```

    ## [1] FALSE

``` r
# For a character factor, it returns `TRUE`:
fdetect(factor(c("a", "b","c","d")))
```

    ## [1] TRUE

## Reorder the factor that uses desc() a la (d)plyr

``` r
test_factor <- factor(c("a", "b", "c"))

# Before freorder
levels(test_factor)
```

    ## [1] "a" "b" "c"

``` r
# After freorder
levels(freorder(test_factor))
```

    ## [1] "c" "b" "a"

## Use `fset()` to set levels to the order in which they appear in the data

``` r
test_factor <- factor(c("a", "b", "c"))
fset(test_factor)
```

    ## [1] a b c
    ## Levels: a b c

## Use `df_write` and `df_read` to write and read data frames to plain text delimited files while retaining factor levels

``` r
library(gapminder)
library(tidyverse)
```

    ## ── Attaching packages ──────────────────────────────────────────────── tidyverse 1.2.1 ──

    ## ✔ ggplot2 3.0.0     ✔ purrr   0.2.5
    ## ✔ tibble  1.4.2     ✔ dplyr   0.7.6
    ## ✔ tidyr   0.8.1     ✔ stringr 1.3.1
    ## ✔ readr   1.1.1     ✔ forcats 0.3.0

    ## ── Conflicts ─────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
# First reorder the levels to be non-alphabetical for later comparison
gapminder_reordered <- gapminder %>%
  mutate(continent = fct_reorder(continent, lifeExp, sd)) %>%
  arrange(continent)
levels(gapminder_reordered$continent)
```

    ## [1] "Oceania"  "Europe"   "Africa"   "Americas" "Asia"

``` r
# Use df_write() to write the data frame into txt
df_write(gapminder_reordered, "sample.txt")

# use df_read() to read from the txt file
res_df <- df_read("sample.txt")
levels(res_df$continent)
```

    ## [1] "Oceania"  "Europe"   "Africa"   "Americas" "Asia"
