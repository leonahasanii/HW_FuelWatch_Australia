# Fuel Watch

In this homework you will explore **fuel prices over time in Western Australia**. 

**Create a quarto document** `report.qmd` and write your solutions into that document such that the rendered html-file is **"human-readable"**. That means meaningful headlines, well-prepared graphics, code folded, no clutter of code output, and some short text introducing and concluding the different exercises. 

Find the first exercises below.   

**Watch out:** More exercises will appear here later in new README-files! You will extend your analysis in the same quarto document. 
Finally, you have one html-file with all analyses. 

# Programming Language 

The description and hints are provided in R. You can use Python as well but you have to translate the hints yourself.

# Data

[Fuel Watch](https://www.fuelwatch.wa.gov.au) is a fuel monitoring service created by the Government of Western Australia. It provides information about fuel prices at the various petrol stations in Western Australia.
Historical fuel prices are provided in monthly chunks on the website https://www.fuelwatch.wa.gov.au/retail/historic. On this site you find links to csv-files with the data (hint use the right-click menu to copy the link address). That way you can find out that data files are stored at URLs of the following form `https://warsydprdstafuelwatch.blob.core.windows.net/historical-reports/FuelWatchRetail-MM-YYYY.csv`. 

Part of the exercise is the systematic download of the data! 

# Exercises

1. **Data Download and Preparation:** Creates a download script that downloads the data for the last 12 months and creates one data file in csv-format which you can read in your quarto report. The script should include
    1. A function `download_FuelWatch_file_if_not_exists` which takes one input `filename`. The function should download the file from a URL which you have to create within the function and save it to a file `filename` in this repository.  
    2. A command that reads in data frames from the csv-files you downloaded, binds them together into one data frame, and save this data frame to a csv-file `FuelWatch.csv` in your local project folder.
    3. A command that reads in the data frame from the csv-file `FuelWatch.csv` and saves it to a variable `FuelWatch` in your R session.
    Hints for R: Use `download.file` to download the files. Use the function `file.exists` to check if a file already exists. Use the function `read_csv` to read the csv-files and `write_csv` to write the data frame to a csv-file. Construct a vector of strings with the filenames. Use `paste0` and a vector of dates which you may produce in similar to this  `seq(as.Date("2022-09-01"), as.Date("2023-09-01"), by="months") |> format("%m-%Y")`. Then `map` over this vector to read the data frames from the files into a list of data frames. Finally, use `reduce` and `bind_rows` to bind the data frames together.
2. **Important: update .gitignore** All the downloaded files and also the file `FuelWatch.csv` should not be tracked by git and should not appear on GitHub! You already have the file `.gitignore` in this repository. git will ignore all filename listed here in a line. Add all the file names here. (In RStudio: Observe that the files vanish in the Git tab and you cannot add them there anymore.)
3. **Visual Data Exploration**: In your report, load your file `FuelWatch.csv` into a data frame and filter for the product "ULC" only. Now, produce the following visualizations, each visual in a different chunk. Create human readable labels and write 1-2 sentences before the chunk about what will be shown, and 1-2 sentences after the chunk what is the most imporant insight from the visualization. 
    1. Brands 
        1. Make a barplot which shows the number of data points for all brands. (Put the labels on the y-axis and order by the number of data points.)
        2. Summarize the data by computing the mean price by brand and date and make a line plot which shows the average price for each brand over time. 
    2. Regions
        1. Make a barplot which shows the number of data points for all regions. (Put the labels on the y-axis and order by the number of data points.)
        2. Summarize the data by computing the mean price by region and date and make a line plot which shows the average price for each region over time.
    3. Areas in the region "Peel". Filter the data by the region "Peel" and 
        1. Make a barplot which shows the number of data points for all areas in Peel. (Put the labels on the y-axis and order by the number of data points.)
        2. Summarize the data by computing the mean price by area and date and make a line plot which shows the average price for each region over time.    
    4. Petrol stations in the area "Murray" (in Peel). Filter the data by the area "Murray" and make a line plot which shows the price for each petrol station (TRADING_NAME) over time.
4. There are at least three different patterns of price dynamics. Describe them. 
4. (BONUS) How could you analyze further where different patterns occur? Why do they occur? 