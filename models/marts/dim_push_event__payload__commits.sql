/* Table: push_event__payload__commits */
/* Parent: push_event */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.sha,
    t.author__email,
    t.author__name,
    t.message,
    t.distinct,
    t.url,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  {{ ref('stg_push_event__payload__commits') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_push_event') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)