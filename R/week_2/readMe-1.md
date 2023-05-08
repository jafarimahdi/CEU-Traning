-   <a href="#functions" id="toc-functions">Functions</a>
-   <a href="#loops" id="toc-loops">Loops</a>
-   <a href="#sapply-lapply" id="toc-sapply-lapply">Sapply, lapply</a>

# Functions

``` r
welcome <- function(name) {
  return(paste0('Warm welcome ', name))
}
welcome(name = 'Ceu')
```

    ## [1] "Warm welcome Ceu"

**Task**<br> Create a function called `multi` which will take argument
`a` and `b` and return with the `a * b - b`

``` r
multi(2,5)
```

    ## [1] 5

**Task**<br> Create a function named `bmi_calc` which will have two
inputs `weight`(kg) and `height`(cm) and calculate the BMI index
`weight/height(meter)^2`. Check your result
[here](https://www.nhlbi.nih.gov/health/educational/lose_wt/BMI/bmicalc.htm)

``` r
bmi_calc(weight = 75, height = 175)
```

    ## [1] 24.4898

# Loops

``` r
for (i in 1:10) {
  print(i)
}
```

    ## [1] 1
    ## [1] 2
    ## [1] 3
    ## [1] 4
    ## [1] 5
    ## [1] 6
    ## [1] 7
    ## [1] 8
    ## [1] 9
    ## [1] 10

``` r
j <-1
while (j<10) {
  t_url <- paste0('https://baseurl.com/page', j)
  print(t_url)
  j <- j+1
}
```

    ## [1] "https://baseurl.com/page1"
    ## [1] "https://baseurl.com/page2"
    ## [1] "https://baseurl.com/page3"
    ## [1] "https://baseurl.com/page4"
    ## [1] "https://baseurl.com/page5"
    ## [1] "https://baseurl.com/page6"
    ## [1] "https://baseurl.com/page7"
    ## [1] "https://baseurl.com/page8"
    ## [1] "https://baseurl.com/page9"

**Task**<br> Reproduce the following printing with a for loop. (Use
builtin vector called `letters`)

    ## [1] "The 1. letter is a"
    ## [1] "The 2. letter is b"
    ## [1] "The 3. letter is c"
    ## [1] "The 4. letter is d"
    ## [1] "The 5. letter is e"
    ## [1] "The 6. letter is f"
    ## [1] "The 7. letter is g"
    ## [1] "The 8. letter is h"
    ## [1] "The 9. letter is i"
    ## [1] "The 10. letter is j"
    ## [1] "The 11. letter is k"
    ## [1] "The 12. letter is l"
    ## [1] "The 13. letter is m"
    ## [1] "The 14. letter is n"
    ## [1] "The 15. letter is o"
    ## [1] "The 16. letter is p"
    ## [1] "The 17. letter is q"
    ## [1] "The 18. letter is r"
    ## [1] "The 19. letter is s"
    ## [1] "The 20. letter is t"
    ## [1] "The 21. letter is u"
    ## [1] "The 22. letter is v"
    ## [1] "The 23. letter is w"
    ## [1] "The 24. letter is x"
    ## [1] "The 25. letter is y"
    ## [1] "The 26. letter is z"

Create a function which will return the square of the input number.

``` r
my_square(11)
```

    ## [1] 121

# Sapply, lapply

Sapply and lapply takes two element, first a list and second a
function<br>

Sapply returns with a vector

``` r
sapply(1:10, my_square)
```

    ##  [1]   1   4   9  16  25  36  49  64  81 100

Lapply returns with a list

``` r
lapply(1:10, my_square)
```

    ## [[1]]
    ## [1] 1
    ## 
    ## [[2]]
    ## [1] 4
    ## 
    ## [[3]]
    ## [1] 9
    ## 
    ## [[4]]
    ## [1] 16
    ## 
    ## [[5]]
    ## [1] 25
    ## 
    ## [[6]]
    ## [1] 36
    ## 
    ## [[7]]
    ## [1] 49
    ## 
    ## [[8]]
    ## [1] 64
    ## 
    ## [[9]]
    ## [1] 81
    ## 
    ## [[10]]
    ## [1] 100

``` r
lapply(1:10, function(x){x^3})
```

    ## [[1]]
    ## [1] 1
    ## 
    ## [[2]]
    ## [1] 8
    ## 
    ## [[3]]
    ## [1] 27
    ## 
    ## [[4]]
    ## [1] 64
    ## 
    ## [[5]]
    ## [1] 125
    ## 
    ## [[6]]
    ## [1] 216
    ## 
    ## [[7]]
    ## [1] 343
    ## 
    ## [[8]]
    ## [1] 512
    ## 
    ## [[9]]
    ## [1] 729
    ## 
    ## [[10]]
    ## [1] 1000

unlist will flat the list into a vector

``` r
unlist(lapply(1:10, function(x){x^3}))
```

    ##  [1]    1    8   27   64  125  216  343  512  729 1000
