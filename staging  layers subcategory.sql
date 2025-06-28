create table tbl_trans_hop_prd
(ProductKey int,
ProductSubcategoryKey int,
ProductSKU varchar(10),
ProductName varchar(35),
ModelName varchar(30),
ProductDescription varchar(200),
ProductColor varchar(10),
ProductSize varchar(5),
ProductStyle char(1),
ProductCost decimal(6,2),
ProductPrice decimal(6,2)


);
insert into tbl_trans_hop_prd
select distinct  ProductKey ,
ProductSubcategoryKey ,
ProductSKU ,
ProductName ,
ModelName ,
ProductDescription ,
ProductColor ,
ProductSize ,
ProductStyle ,
ProductCost ,
ProductPrice 
from tbl_stg_aw_data;

select * from tbl_trans_hop_prd;












create table tbl_trans_hop1_prdcat
( productcategorykey int,
categoryname varchar(15)
);
select * from tbl_trans_hop1_prdcat;

insert into tbl_trans_hop1_prdcat
select distinct productcategorykey,categoryname from  tbl_stg_aw_data;

create table tbl_trans_hop1_prdsubcat
(productsubcategorykey int,
subcategoryname varchar(20),
productcategorykey  int);
insert into tbl_trans_hop1_territory
 select distinct territoryKey,
Region,
Country,
Continent
from  tbl_stg_aw_data;



create table tbl_trans_hop1_territory
(SalesterritoryKey int,
Region varchar(15),
Country varchar(15),
Continent varchar(15)
);
select count(*) from (
select distinct 
ProductKey,
CustomerKey,
TerritoryKey

from tbl_stg_aw_data) tbl;


select orderdate, ProductKey,
CustomerKey,
TerritoryKey,count(*)
from tbl_stg_aw_data
group by  orderdate,ProductKey,
CustomerKey,
TerritoryKey;
 create table tbl_trans_hop1_sales
( OrderDate date,
StockDate date,
ProductKey int,
CustomerKey int,
TerritoryKey int,
OrderLineItem int,
OrderQuantity int
);
insert into tbl_trans_hop1_sales
select 
OrderDate ,
StockDate ,
ProductKey ,
CustomerKey ,
TerritoryKey ,
OrderLineItem ,
OrderQuantity 
from  tbl_stg_aw_data;


select count(*) from tbl_trans_hop1_customers;
select count(*) from tbl_trans_hop_prd;

