with 

source as (

    select * from {{ source('retail_db', 'dim_customers') }}

),

renamed as (

    select
        customer_id,
        customer_name,
        email AS customer_email,
        region AS customer_region,
        signup_date AS customer_signup_date

    from source

)

select * from renamed
