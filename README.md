Archway Health Dev Ops Challenge 
● After completion, publish your code to a git repository and send the link to blin@archwayha.com 
● We anticipate that this will take 4 hours or less to complete this test 
● If you have questions please let us know 
Create a shell script that appends and concatenates files. 
One of the most common tools of a devops engineer is writing shell scripts.  In this challenge you MUST write a shell script.  Please use shell or bash to write your script.  (We use sh or bash at Archway).  

Given a directory listing of CSV files below:
-rw-r--r--@ 1 benlin  staff  992 Feb 25 20:23 2094-001.csv
-rw-r--r--@ 1 benlin  staff  992 Feb 25 20:25 2111-001.csv
-rw-r--r--@ 1 benlin  staff  988 Feb 25 20:25 3094-001.csv
-rw-r--r--@ 1 benlin  staff  992 Feb 25 20:25 3333-001.csv
-rw-r--r--@ 1 benlin  staff  984 Feb 25 20:25 4444-001.csv
….
 
 
You can download the sample files here.  

Part 1: Concatenate all of the CSV.  Please make sure there’s only 1 header in your output.  Your script should be able to concatenate any # of files in the directory. The concatenated file should be named “all.csv”


Part 2: Append a new column at the end of the CSV file called “client_id”. The client_id should contain the value of the filename without the “.csv”.  For example, if the filename is 2094-001.csv, the column would contain “2094-001”.  

Part 3: Compress the file.

Part 4: Write a method to upload the file to an S3 bucket.  

Part 5: Write how you would schedule your script on a Linux machine to run every hour.
