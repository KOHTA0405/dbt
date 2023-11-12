{{
    config(
        materialized='view'
    )
}}

{%- set yaml_metadata -%}
source_model: 'pif_brand'
derived_columns:
    record_source: '!brand'
    effective_from: 'updated_at'
    loaded_at: 'load_jst'
hashed_columns:
    brand_hk: 'brand_id'
    brand_hashdiff:
        is_hashdiff: true
        columns:
            - 'brand_name'
            - 'delete_flag'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.stage(
    include_source_columns=true,
    source_model=metadata_dict["source_model"],
    derived_columns=metadata_dict["derived_columns"],
    hashed_columns=metadata_dict["hashed_columns"],
    null_columns=none,
    ranked_columns=none
)}}