SET GLOBAL local_infile = 1;


LOAD DATA LOCAL INFILE 'C:/Users/AVURA/Downloads/cleaned_big_data.csv' 
INTO TABLE cleaned_big_data 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;


