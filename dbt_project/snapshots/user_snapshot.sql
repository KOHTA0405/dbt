{% snapshot user_snapshot %}

{{
    config(
        target_schema='staging',
        unique_key='id',
        strategy='check',
        check_cols="all",
        invalidate_hard_deletes=True
    )
}}

select * from {{ source('raw', 'user') }}

{% endsnapshot %}