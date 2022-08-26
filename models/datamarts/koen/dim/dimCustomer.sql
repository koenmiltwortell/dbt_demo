{{ config(alias='Customer') }}

SELECT 
    cus.C_CUSTKEY           AS CUSTOMER_ID
,   cus.C_NAME              AS CUSTOMER_NAME
,   cus.C_ADDRESS           AS CUSTOMER_ADDRESS
,   nat.N_NAME              AS CUSTOMER_NATION
,   reg.R_NAME              AS CUSTOMER_REGION
,   cus.C_PHONE             AS CUSTOMER_PHONE
FROM {{ source( 'snowflake_sample', 'CUSTOMER' ) }} cus
LEFT JOIN {{ source( 'snowflake_sample', 'NATION' ) }} nat ON nat.N_NATIONKEY = cus.C_NATIONKEY
LEFT JOIN {{ source( 'snowflake_sample', 'REGION' ) }} reg ON reg.R_REGIONKEY = nat.N_REGIONKEY