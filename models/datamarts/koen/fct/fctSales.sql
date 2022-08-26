{{ config(alias='Sales' ) }}

select 
  ord.O_ORDERKEY  
, ite.L_LINENUMBER
, cus.CUSTOMER_NAME
, sup.SUPPLIER_NAME
, par.P_NAME
, ord.O_ORDERDATE
, ite.L_QUANTITY
, ite.L_EXTENDEDPRICE
, ite.L_DISCOUNT
, ite.L_TAX
, ite.L_QUANTITY * ite.L_EXTENDEDPRICE AS lineamount
, ord.O_TOTALPRICE
from {{ source( 'snowflake_sample', 'ORDERS' ) }}  ord
left join {{ source( 'snowflake_sample', 'LINEITEM' ) }} ite   ON ite.L_ORDERKEY = ord.O_ORDERKEY
left join {{ source( 'snowflake_sample', 'PART' ) }} par       ON par.P_PARTKEY = ite.L_PARTKEY
left join {{ ref( 'dimCustomer' ) }} cus   ON ord.O_CUSTKEY = cus.CUSTOMER_ID
left join {{ ref( 'dimSupplier' ) }} sup   ON ite.L_SUPPKEY = sup.SUPPLIER_ID
--order by 1,2
