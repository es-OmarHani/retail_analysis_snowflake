with 

source as (

    select * from {{ source('retail_db', 'fact_sales') }}

),

renamed as (

    select
        sale_id,
        customer_id,
        product_id,
        store_id,
        sale_date,
        quantity_sold,
        total_amount

    from source

)

select * from renamed
