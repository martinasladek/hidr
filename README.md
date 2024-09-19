
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hidR

<!-- badges: start -->
<!-- badges: end -->

Hide callout boxes based on an ID tag.

## Installation

You can install the development version of hidr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("martinasladek/hidr")
```

## Example

First generate the button in a codechunk using the `generate_button()`
function.

``` r
my_awesome_button <- hidr::generate_button()
```

Then add the button to your Quarto file by calling the object in an
inline code:

\`r my_awesome_button\`

This will generate a button that can hide callouts tagged with a
specific ID. The default ID is “hide”. So the callout below will be
hidden after clicking the button:

``` r
::: {#hide .callout-note} 
### Callout box 1
This callout should hide when told to do so.
:::
```

but this one will stay visible

``` r
::: .callout-note
### Callout box 1
This callout will stay visible
:::
```
