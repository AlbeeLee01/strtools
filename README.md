# strtools.RPackage
strtools is an R Package I made for my R-Programming course containing three functions designed for string cleaning, frequency analysis and other text-based preprocessing workflows.

The package supports both standard atomic string vectors and multi-label string entries through optional separator-based parsing. 

---

## Multi-Label String Support

All functions in strtools now support datasets where multiple categorical values are stored within a single string entry.

For example datasets with this structure:
```r
c(
  "Chase, KKR",
  "BofA, Nvidia",
  "UBS"
)
```
Functions such as `str_freq()` and `str_find()` can separate and process these values using the `str.sep` argument.

### Example: Frequency Analysis

```r
str_freq(
  invest.df$cleaned,
  str.sep = ","
)
```

---
### Datasets

Provided in this package are custom-made datasets: LETTERS.df, animals.df and invest.df used to showcase the range of use cases each function has. 

Please refer to the `data` folder for the datasets and `data-raw` to see how the structure and methodology behind each dataset. 










