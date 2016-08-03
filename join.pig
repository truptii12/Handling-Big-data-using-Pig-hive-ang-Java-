--Join demographics and RentTrans for grouby by sex and  age analysis
rent = LOAD '/home/hduser/Downloads/AIB/RentTrans' USING PigStorage(',') as (CUST_NO:int,EPOCH:datetime,CATEGORY:chararray,SUBCATEGORY:chararray,TRANS_AMOUNT:int,TRANS_TYP:chararray);

demographics = LOAD '/home/hduser/Downloads/AIB/Demographics.csv' USING PigStorage(',') as (CUST_NO:int,AGE:int,
SEX_CDE:chararray,COUNTY:chararray);

outer_full = JOIN rent BY CUST_NO FULL OUTER, demographics BY CUST_NO;

--DUMP outer_full;
STORE outer_full INTO ' /home/hduser/Downloads/subset_AIB/analysis/out' USING PigStorage (',');
