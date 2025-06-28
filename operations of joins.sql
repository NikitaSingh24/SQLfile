USE adventureworks;
create table tbl_trans_hop2_customers
( Customerkey int,
  Customer_Name varchar(50),
  birth_date date,
  Age int,
  Marital_Status varchar(10),
  gender varchar(20),
  Email_Address varchar(50),
  Annual_Income int,
  Total_Children int,
  Education_level varchar(20),
  Occupation varchar(15),
  Home_Owner varchar(5),
  customer_type varchar(10)
);
insert into tbl_trans_hop2_customers



select

  Customerkey,
  Customer_Name,
  birth_date,
  Age,
  Marital_Status,
  gender,
  Email_Address,
  Annual_Income,
  Total_Children,
  Education_level,
  Occupation,
  Home_Owner,
 
case when profit>4000 then "platinum"
     when profit>=2000 then "Gold"
     when profit>=1000 then "silver"
     else "bronze"
     end customer_type
     from


(SELECT 
  cus_final.Customerkey,
  cus_final.Customer_Name,
  cus_final.birth_date,
  cus_final.Age,
  cus_final.Marital_Status,
  cus_final.gender,
  cus_final.Email_Address,
  cus_final.Annual_Income,
  cus_final.Total_Children,
  cus_final.Education_level,
  cus_final.Occupation,
  cus_final.Home_Owner,
  tbl_fnl.TotalProfit AS Profit
FROM tbl_trans_hop1_customers cus_final
INNER JOIN (
  SELECT 
   cus.CustomerKey,
    SUM((prd.ProductPrice - prd.ProductCost) * sales.OrderQuantity) AS TotalProfit
  FROM tbl_trans_hop1_customers cus
  INNER JOIN tbl_trans_hop1_sales sales
    ON cus.CustomerKey = sales.CustomerKey
  INNER JOIN tbl_trans_hop_prd prd
    ON sales.ProductKey = prd.ProductKey
  GROUP BY CustomerKey
) AS tbl_fnl
  ON cus_final.CustomerKey = tbl_fnl.CustomerKey) tbl_custype;
  
  
