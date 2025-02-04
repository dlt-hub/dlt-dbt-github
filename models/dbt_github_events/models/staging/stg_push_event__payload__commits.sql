/* Table: push_event__payload__commits */
/* Parent: { parent }} */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}
-- depends_on: {{ ref('stg_push_event') }}

SELECT
/* select which columns will be available for table 'push_event__payload__commits' */
    sha,
    author__email,
    author__name,
    message,
    distinct,
    url,
    _dlt_parent_id,
    _dlt_list_idx,
    _dlt_id,
FROM {{ source('raw_data', 'push_event__payload__commits') }}

/* we only load table items if the parent table has the parent item */
WHERE _dlt_parent_id IN ( SELECT _dlt_id FROM {{ ref('stg_push_event') }} )
