with 

source as (

    select * from {{ source('retail_db', 'dim_products') }}

),

renamed as (

    select
        product_id,
        product_name,
        category AS product_category,
        price AS product_price

    from source

)

select * from renamed
