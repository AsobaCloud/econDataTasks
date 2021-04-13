# Econ Data Tasks

This is a growing library of helper tools for ingesting datasets from popular financial/economic sources via API

## Sources

- US Census
- Federal Research Economic Data (FRED)
- Quandl (will add next)

## Getting started

Request an API key from census.gov to access the census API (https://api.census.gov/data/key_signup.html).  Once you have your key, add CENSUS_KEY = <your key> to your .Renviron
  
Next, get your FRED API key to access Federal Research Economic Data API calls (https://fred.stlouisfed.org/docs/api/api_key.html).  Once you have your key, add FRED_KEY = <your key> to your .Renviron
  
Also recommended to load the fips.Rdata set, which contains a vector of fips
  
## Core functions

The US Census functions are designed to help with bulk download of multi-geographic census datasets.  The ```getCensusInfo``` function is defaulted to help you identify the available geographies for the acs/acs5 (American Community Survey, 5-year rolling) datasets.  Although, if you use the underlying ```censusapi``` package function ```listCensusMetadata```, you can find the other available census surveys that can be used.  Heavy emphasis on the fact that the batch processing functions ```concatCensusGroup``` and ```concatCensusVars``` are built based on the acs/acs5 dataset designs, and may not yet work with other survey types.

The ```concatCensusGroup``` allows you to grab all variables from a specified group (the census terminology for dataset).  Groups are given ID's like B24022 (which corresponds with a specific concept, in this example, Sex by Occupation among workers over 16 years old).  ```concatCensusVars``` on the other hand allows you to grab specific variables from the dataset that you can specify via input in comma separated fashion when prompted.

