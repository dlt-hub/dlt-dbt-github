/* Table: issues__comments */
/* Parent: { parent }} */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}
-- depends_on: {{ ref('stg_issues') }}

SELECT
/* select which columns will be available for table 'issues__comments' */
    id,
    url,
    body,
    author__avatar_url,
    author__login,
    author__url,
    author_association,
    created_at,
    _dlt_parent_id,
    _dlt_list_idx,
    _dlt_id,
    reactions_total_count,
FROM {{ source('raw_data', 'issues__comments') }}

/* we only load table items if the parent table has the parent item */
WHERE _dlt_parent_id IN ( SELECT _dlt_id FROM {{ ref('stg_issues') }} )
