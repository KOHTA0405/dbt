{{
    config(
        materialized='incremental'
    )
}}

select
    *,
    current_datetime('Asia/Tokyo') as load_jst
from
    {{ source('structured', 'raw_order_detail')}}

{% if is_incremental() %}

where updated_at > (select max(updated_at) from {{this}} )

{% endif %}