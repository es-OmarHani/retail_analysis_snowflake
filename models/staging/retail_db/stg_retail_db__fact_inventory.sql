with 

source as (

    select * from {{ source('retail_db', 'fact_inventory') }}

),

renamed as (

    select
        inventory_id,
        product_id,
        store_id,
        stock_date,
        stock_level

    from source

)

select * from renamed
