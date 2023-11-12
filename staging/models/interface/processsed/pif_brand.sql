{{
    config(
        materialized='view'
    )
}}

with source as (
    select
        id as brand_id,
        name as brand_name,
        created_at,
        updated_at,
        delete_flag,
        load_jst,
        rank() over(partition by id order by load_jst desc) as rank
    from {{ ref('str_brand') }}
)
select
    *
from source