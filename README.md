
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggstamp

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

> ‘In God we trust, all others must bring data.’ - W. Edwards Deming.

The goal of ggstamp is to provide an alternative, quick API for
annotation layers in the ggplot2 and grammar of graphics framework. It
is experimental and maybe is not such a good idea; but let’s see where
things lead.

In some ways, *annotation layers* are subject Deming’s burden of
*‘bringing data’*.

Annotation layers in grammar of graphics frameworks feel different than
adding geom\_\* layers. This is because w/ the separation of visual
concerns, data is often declared separately from the geom. The data is
foundational and sits below everything. The ink on the page depends on
this underlying data once goem\_\* layers are declared.

But with annotion layers, not only are you declaring the geom to be
used, but you’ve also got to declare the data as you do this.

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("EvaMaeRey/ggstamp")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ggstamp)
## basic example code
```

There are different approaches to getting this done currently…

[See the flipbook](https://evamaerey.github.io/ggstamp/flipbook.html)

<iframe src="https://evamaerey.github.io/ggstamp/flipbook.html" title="ggstamp flipbook">
</iframe>
