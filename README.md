<h1>Country Data Extraction and Insertion Script</h1>

<h2>Description</h2>
This PowerShell script extracts country data from the REST Countries API and inserts it into a SQL Server database. The script fetches details such as the country name, population, area, and currency, transforming and loading the data into a database table. This is useful for analyzing country-related statistics and storing them in a structured format for further querying or reporting.
<br />

<h2>Languages and Utilities Used</h2>

- <b>PowerShell</b>
- <b>SQL Server</b>

<h2>Environments Used</h2>

- <b>Windows 10</b>

<h2>Program walk-through:</h2>

<p align="center">
Launch the script: <br/>
<img src="https://i.imgur.com/oz4g0Mt.png" height="80%" width="80%" alt="Launch Script"/>
<br />
<br />
Retrieve the country data from the API: <br/>
<img src="https://i.imgur.com/xWzkUNk.png" height="80%" width="80%" alt="Fetch API Data"/>
<br />
<br />
Date got inserted into SQL Server: <br/>
<img src="https://i.imgur.com/iNU08rR.png" height="80%" width="80%" alt="SQL Insert"/>
<br />
<br />
</p>

<!--
 ```diff
- PowerShell script to extract data
+ Data inserted into SQL successfully
! API data handling
# SQL Server connection steps
@@ Error handling and SQL closing in bold @@