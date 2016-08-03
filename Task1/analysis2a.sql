-- amount spent by the customers with age >60 group by age and gender
drop table if exists RentTrans;

create table RentTrans (CUST_NO int,EPOCH date,CATEGORY varchar(100),SUBCATEGORY varchar(100),TRANS_AMOUNT varchar(100),TRANS_TYPE varchar(3),C_No int,AGE int,SEX_CDE varchar(3),COUNTY varchar(25))ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';

LOAD DATA LOCAL INPATH '/home/hduser/Downloads/subset_AIB/analysis/output3/output_join' into table RentTrans;

insert overwrite local directory '/home/hduser/Desktop/Hive/Analysis/Out3' row format delimited fields terminated by ',' select SEX_CDE,AGE, count(TRANS_AMOUNT) as Total from RentTrans where age>50 group by SEX_CDE,AGE;

