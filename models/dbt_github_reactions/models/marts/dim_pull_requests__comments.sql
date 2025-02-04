/* Table: pull_requests__comments */
/* Parent: pull_requests */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.url,
    t.body,
    t.author__avatar_url,
    t.author__login,
    t.author__url,
    t.author_association,
    t.created_at,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
    t.reactions_total_count,
FROM  {{ ref('stg_pull_requests__comments') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_pull_requests') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)