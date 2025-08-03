with 

source as (

    select * from {{ source('retail_db', 'dim_time') }}

),

renamed as (

    select
        date_id,
        year,
        quarter,
        month,
        day,
        day_of_week

    from source

)

select * from renamed
