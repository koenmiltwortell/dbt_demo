SELECT 
    sup.S_SUPPKEY           AS SUPPLIER_ID
,   sup.S_NAME              AS SUPPLIER_NAME
,   nat.n_name              AS SUPPLIER_NATION
,   reg.R_NAME              AS SUPPLIER_REGION
,   sup.S_ADDRESS           AS SUPPLIER_ADDRESS
,   sup.S_PHONE             AS SUPPLIER_PHONE
FROM {{ source( 'snowflake_sample', 'SUPPLIER' ) }} sup
LEFT JOIN {{ source( 'snowflake_sample', 'NATION' ) }} nat ON nat.N_NATIONKEY = sup.s_NATIONKEY
LEFT JOIN {{ source( 'snowflake_sample', 'REGION' ) }} reg ON reg.R_REGIONKEY = nat.N_REGIONKEY
