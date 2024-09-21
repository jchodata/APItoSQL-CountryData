# Set up SQL Server connection details
$connectionString = "Server=DESKTOP-9I8CFUC\SQLEXPRESS;Database=SQLPowerShellAPI;Trusted_Connection=True;"

# Define the API URL (REST Countries API provides a lot of useful information about countries, including population, languages, currencies and more)
$apiUrl = "https://restcountries.com/v3.1/all"

# Extract data from the API
$response = Invoke-RestMethod -Uri $apiUrl -Method Get

# Display the data to check the structure

try {
    # Open the SQL Server connection
    $connection = New-Object System.Data.SqlClient.SqlConnection
    $connection.ConnectionString = $connectionString
    $connection.Open()

    # Loop through the response and transform the data
    foreach ($country in $response) {
        $countryName = $country.name.common
        $population = $country.population
        $area = if ($country.area) { $country.area } else { 0 }

        # Extract the currency codes (keys from the currencies object)
        if ($country.currencies -ne $null) {
            $currency = [string]::Join(', ', $country.currencies.PSObject.Properties.Name)
        } else {
            $currency = "Unknown"
        }

        # Prepare the SQL INSERT statement
        $query = @"
        INSERT INTO CountryData (CountryName, Population, Area, Currency)
        VALUES ('$countryName', $population, $area, '$currency')
"@

        # Execute the SQL command
        $command = $connection.CreateCommand()
        $command.CommandText = $query
        $command.ExecuteNonQuery()
        Write-Host "Inserted data for country: $countryName"
    }
}
catch {
    Write-Host "Error occurred: $_"
}
finally {
    # Step 7: Close the SQL Server connection
    if ($connection.State -eq 'Open') {
        $connection.Close()
        Write-Host "Connection to SQL Server closed."
    }
}

Write-Host "Data saved to SQL Server successfully!"