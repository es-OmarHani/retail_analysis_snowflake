with 

source as (

    select * from {{ source('retail_db', 'dim_employees') }}

),

renamed as (

    select
        employee_id,
        employee_name,
        department AS employee_department,
        employment_type,
        hire_date AS employee_hire_date,
        store_id

    from source

)

select * from renamed
