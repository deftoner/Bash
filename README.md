# Bash
Bash Tools

## Files descriptions

[Clean-CSV.sh](Clean-CSV.sh): Little basic linux bash script to process geo location IPv4 database file geolocationDatabaseIPv4.csv from **ipapi.is** (https://ipapi.is/geolocation.html), to separate the csv file into smaller pieces by country. Also it delets the column "IP Version" (first columns) since all ips on that DB are IPv4. This is for the "little" open database. In case you are new: "chmod +x Clean-CSV.sh" and then "./Clean-CSV.sh". Dont forget to edit the file, to change the input file name, or rename the CSV file to "input.csv". The CSV file must be on same directory as the script. 
