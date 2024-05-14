# This is a Water Hub example in R to fetch from the datstore with SQL query formatting and print the response. Made by the Water Hub Team.

# Use the httr library, which can be installed within R as: install.packages("httr")
library(httr)

# Define the base URL
waterhub_datastore_base_url <- "https://data.cbwaterhub.ca/api/3/action/datastore_search_sql?sql="

# SQL query to be encoded, based on a working resource ID as an example. In this example, the resource ID is from the Lake Blitz dataset
original_sql_query <- 'SELECT * FROM "0814c903-f907-41a0-8348-8fe3b48a3fac" LIMIT 20'

# Encode the SQL query
encoded_sql_query <- URLencode(original_sql_query)

# Concatenate base URL and encoded SQL query
full_url_to_query <- paste0(waterhub_datastore_base_url, encoded_sql_query)

# Fetch the URL
fetch_response <- GET(full_url_to_query)

# Check if the request was successful
if (http_status(fetch_response)$category == "Success") {
  # Print the response content
  print(content(fetch_response))
} else {
  # Print error message
  cat("Error:", http_status(fetch_response)$reason, "\n")
}
