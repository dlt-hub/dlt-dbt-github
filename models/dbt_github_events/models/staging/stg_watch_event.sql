/* Table: watch_event */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'watch_event' */
    id,
    type,
    actor__id,
    actor__login,
    actor__display_login,
    actor__gravatar_id,
    actor__url,
    actor__avatar_url,
    repo__id,
    repo__name,
    repo__url,
    payload__action,
    public,
    created_at,
    org__id,
    org__login,
    org__gravatar_id,
    org__url,
    org__avatar_url,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'watch_event') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )