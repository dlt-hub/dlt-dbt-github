/* Table: pull_requests__reactions */
/* Parent: { parent }} */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}
-- depends_on: {{ ref('stg_pull_requests') }}

SELECT
/* select which columns will be available for table 'pull_requests__reactions' */
    user__login,
    user__avatar_url,
    user__url,
    content,
    created_at,
    _dlt_parent_id,
    _dlt_list_idx,
    _dlt_id,
FROM {{ source('raw_data', 'pull_requests__reactions') }}

/* we only load table items if the parent table has the parent item */
WHERE _dlt_parent_id IN ( SELECT _dlt_id FROM {{ ref('stg_pull_requests') }} )
