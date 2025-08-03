with 

source as (

    select * from {{ source('retail_db', 'dim_stores') }}

),

renamed as (

    select
        store_id,
        store_name,
        location AS store_location,
        manager_name AS store_manager_name

    from source

)

select * from renamed
