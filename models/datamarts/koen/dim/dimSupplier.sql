select 
    sup.S_SUPPKEY           AS SUPPLIER_ID
,   sup.S_NAME              AS SUPPLIER_NAME
,   nat.n_name              AS SUPPLIER_NATION
,   reg.R_NAME              AS SUPPLIER_REGION
,   sup.S_ADDRESS           AS SUPPLIER_ADDRESS
,   sup.S_PHONE             AS SUPPLIER_PHONE
from {{ source( 'snowflake_sample', 'SUPPLIER' ) }} sup
left join {{ source( 'snowflake_sample', 'NATION' ) }} nat on nat.N_NATIONKEY = sup.s_NATIONKEY
left join {{ source( 'snowflake_sample', 'REGION' ) }} reg on reg.R_REGIONKEY = nat.N_REGIONKEY
