
#load the libraries for census and fred api access

library(econDataTasks)
library(data.table)
library(googleCloudStorageR)

# View list of all available Census API endpoints
apis <- listCensusApis()
View(apis)

# View fields in a selected Census API endpoint
getCensusInfo(name="zbp",year=2018)
info <- getCensusInfo(name="zbp",year=2018)
View(info[[2]])


# Search for a FRED dataset based on keyword
searchFred(key="UMICH")


# Download macro datasets
## Univ. of Michigan consumer sentiment datasets
getFred(d_id="UMCSENT",fred_df = "UMICH_Consumer_Sentiment")
getFred(d_id="MICH",fred_df = "UMICH_Inflation_Expectation")

## Find and download Marin County datasets from FRED
searchFred(key="Marin County")

getFred(d_id="CAMARI5URN",fred_df = "Marin_County_Monthly_Unemployment")

## Download historical acs/acs5 dataset for Marin County
concatCensusGroup(start_year=2010,end_year=2019,tablename="Marin_County_Households",group="B19080",fipstate='06')

# Save datasets to csv

fwrite(Marin_County_Unemployment_Rate, file="~/data/export/fred_marin_unemployment.csv", scipen = 999)
fwrite(Marin_County_GDP, file="~/data/export/fred_marin_gdp.csv", scipen = 999)
fwrite(Marin_County_Mean_Commute_Time, file="~/data/export/fred_marin_commute_time.csv", scipen = 999)
fwrite(Marin_County_Income_Per_Capita, file="~/data/export/fred_marin_income.csv", scipen = 999)
fwrite(Marin_County_Subrpime_Credit_Population, file="~/data/export/fred_marin_subprime_credit.csv", scipen = 999)
fwrite(Federal_Funds_Rate, file="~/data/export/fred_fed_funds_rate.csv", scipen = 999)
fwrite(San_Francisco_CBSA_CPI, file="~/data/export/fred_sf_cbsa_cpi.csv", scipen = 999)
fwrite(San_Francisco_CBSA_Electricity_Cost_per_KWH, file="~/data/export/fred_sf_cbsa_electricity.csv", scipen = 999)
fwrite(San_Francisco_CBSA_Gasoline_Cost_per_Gallon, file="~/data/export/fred_sf_cbsa_gas.csv", scipen = 999)
fwrite(vacancy, file="~/data/export/census_ca_vacancies.csv", scipen = 999)
fwrite(rent, file="~/data/export/census_ca_rent.csv", scipen = 999)
fwrite(population_by_age, file="~/data/export/census_ca_population_by_age.csv", scipen = 999)
fwrite(UMICH_Consumer_Sentiment, file="~/data/export/fred_umich_consumer_sentiment.csv", scipen = 999)
fwrite(UMICH_Inflation_Expectation, file="~/data/export/fred_umich_inflation_expectation.csv", scipen = 999)
fwrite(National_Financial_Conditions_Index, file="~/data/export/fred_adjusted_nfci.csv", scipen = 999)


# Upload csv's to Google Cloud Storage

files <- list.files(path="~/data/export", pattern="*.csv", full.names=TRUE, recursive=FALSE)
for (i in files){
  filename = basename(i)
  gcs_upload(file=i, name=paste("econData/",filename), predefinedAcl = "bucketLevel")
}

googleCloudStorageR::gcs_upload()

# See basic CensusAPI functions

https://www.hrecht.com/censusapi/articles/getting-started.html



## sources
# https://www.chicagofed.org/publications/nfci/index
