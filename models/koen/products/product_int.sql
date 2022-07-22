select * 
from {{ source( 'product_data', 'awesome_piechart' ) }}