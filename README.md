
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggstamp

> ‘In God we trust, all others must bring data.’ - W. Edwards Deming.

<img src="docs/flipbook.gif" width="100%" />

<a href="https://evamaerey.github.io/ggstamp/flipbook.html" target="_blank">Open flipbook in a new tab</a>

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of ggstamp is to provide convenience functions for creating
annotation layers in the ggplot2 and grammar of graphics framework. It
is experimental and maybe is not such a good idea; but let’s see where
things lead.

In some ways, Deming’s quote parallels the experience of analysts using
ggplot2. Adding geom\_\* layers feels divine and godly (geom\_point() =
‘let there be points’, geom\_boxplot() ‘let there be boxplots’!), but
*annotation layers* are subject to Deming’s burden of *‘bringing data’*.

The geom\_\* calls feel lightweight and powerful because they refer to
the already specified data and aesthetic mappings. Recall the definition
of a data visualization

A data visualization is …

… is composed of geometric marks …

… that take on visual channels (aesthetics) …

… that represent variables in a data set …

In practice, the data is declared first and second the
aesthetic-variable encodings. Finally, with this groundwork laid which
geometric mark should take on these aesthetics – the code call to get
the layer feels light and nimble and quick!

The geom\_\* marks of course do rely on data, but that has already been
laid out; they don’t feel like you have to ‘bring data’. So using
geom\_tile() or geom\_point() or geom\_line() feels a bit supernaturally
– ink spring up through the page based the data that lies beneath.

<!-- Annotation layers in grammar of graphics frameworks feel different than adding geom_* layers.  This is because w/ the separation of visual concerns, data is often declared separately from the geom.  The data is foundational and sits below everything.  The ink on the page depends on this underlying data once goem_* layers are declared.   -->

Annotation layers are different. With annotation layers, but you’ve also
got to declare the data as you do this. You also have to declare the
geom to be used.

‘ggstamp’ thinks about removing some of the thinking and focus that’s
needed to create annotation layer. First, they use a stamp prefix and
then name the geom that’s desired, i.e. stamp\_point(), stamp\_text() -
good for auto-complete IDEs. A goal too, will be to include the
arguments and descriptions so adjustments can more easily be made from
IDE with function previews.

Also, the functions include default data. You will be able to check out
what stamp\_\* functions do without any input (then you can adjust away
from the defaults later) – the stamps come ‘pre-inked’ (they’ll
automatically bring generic data). They’ll ‘just work’ – maybe not as
needed in their final form – but getting something out-of-the box can be
a useful starting point for newcomers. That’s my thinking for now at
least!

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("EvaMaeRey/ggstamp")
```
