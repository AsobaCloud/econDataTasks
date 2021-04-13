## Search FRED Database

#' Get Look from Looker instance without row limits
#' @param key (character) the search term to lookup FRED datasets
#' @param search_df (character) the desired name of the search results dataframe
#' @export
#' 

searchFred = function(key, search_df="results") {
  fredr_set_key(Sys.getenv("FRED_KEY"))
  search_results2 = fredr_series_search_text(search_text = key)
  assign(paste(search_df), data.frame(search_results2), envir = .GlobalEnv)
  return(search_results2)
}


## Store FRED dataset

#' Download a FRED dataset and store it as a dataframe
#' @param d_id (character) the FRED dataset ID
#' @param fred_df (character) the desired name of the FRED data dataframe
#' @export
#'
getFred = function(d_id, fred_df="fred_data") {
  fredr_set_key(Sys.getenv("FRED_KEY"))
  df=fredr(series_id = d_id)
  assign(paste(fred_df), data.frame(df), envir = .GlobalEnv)
  return(df)
}
