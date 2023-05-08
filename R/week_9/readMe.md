
-   <a href="#html-structure" id="toc-html-structure">HTML structure</a>
-   <a href="#rvest" id="toc-rvest">Rvest</a>


# HTML structure

-   [elements](https://developer.mozilla.org/en-US/docs/Web/HTML/Element)
-   [div](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/div)
-   [id](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id)

Load any site, press F12<br> In the console you can select elements with
`document.querySelector('')`. <br> You can get the text of any div,
element or id with `innerText` attribute
`document.querySelector('h1').innerText`. <br> You can also overwrite
the text of the selected element
`document.querySelector('h1').innerText=='hello'` It will change the
first h1 text to hello. <br>

Try out with elements, id, and div.

**Task**<br> Change two element on
[this](https://www.guinnessworldrecords.com/world-records/most-lasso-texas-skips-in-one-minute)
site

-   who should contain your name
-   where should contain your country
-   take a screenshoot

`div` use `.` <br> `id` use `#` <br> `tag` use just the name of the tag.

# Rvest

Install and load the rvest library

``` r
#install.packages("rvest")
library(rvest)
# load the index.html page
t <- read_html('index.html')
# tags
t %>% html_node('h1') %>% html_text()
```

    ## [1] "Hello Class"

``` r
t %>% html_nodes('h1') %>% html_text()
```

    ## [1] "Hello Class" "this is h1"  "also h1"

``` r
t %>% html_node('.demo-class') %>% html_text()
```

    ## [1] "\n      also h1\n      that is smaller h2\n        that is a paragraph within h2\n      \n    "

``` r
t %>% html_nodes('#select-with-id') %>% html_text()
```

    ## [1] "\n      This text within an id called select-with-id, in this class you can find a link as well.\n      to my  github page\n    "

``` r
library(rvest)
t <- read_html('https://www.boats.com/boats/prestige/420-8040261/')
t %>% html_nodes('#specifications .oem-page__title') %>% html_text()
t %>% html_nodes('.description-list__term') %>% html_text()
t %>% html_nodes('.description-list__description') %>% html_text()
```