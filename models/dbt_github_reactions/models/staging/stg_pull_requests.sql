/* Table: pull_requests */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'pull_requests' */
    number,
    url,
    title,
    body,
    author__login,
    author__avatar_url,
    author__url,
    author_association,
    closed,
    closed_at,
    created_at,
    state,
    updated_at,
    reactions_total_count,
    comments_total_count,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'pull_requests') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )