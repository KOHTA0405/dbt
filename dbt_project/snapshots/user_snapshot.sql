{% snapshot user_snapshot %}

{{
    config(
        target_schema='staging',
        unique_key='id',
        strategy='check',
        check_cols="all"
    )
}}

select * from {{ source('raw', 'user') }}

{% endsnapshot %}