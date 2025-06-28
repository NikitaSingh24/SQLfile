 insert into tbl_trans_hop1_customers
 select  distinct
Customerkey,
concat(prefix," ",firstname," ",lastname)  as customer_name,

Birthdate,
 datediff(current_date(),birthdate)/365,
case when MaritalStatus='S' then 'Single'
else 'Married'
end maritalstatus,

case when Gender= 'M' then 'MALE'
     when gender='F' then 'Female'
     else 'Do Not Disclose'
end gender,
EmailAddress,
AnnualIncome,
TotalChildren,
EducationLevel,
Occupation,
case when HomeOwner='Y' then 'Yes'
else 'No'
end homeowner
from tbl_stg_aw_data;

SELECT COUNT(*) 
FROM (
    SELECT DISTINCT CustomerKey 
    FROM tbl_stg_aw_data
) AS tbl;
select* from tbl_stg_aw_data;


Select  count(*) from tbl_trans_hop1_customers;
delete from tbl_trans_hop1_customers;
select * from tbl_trans_hop1_customers;
SET SQL_SAFE_UPDATES = 0;
