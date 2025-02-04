/* Table: pull_requests */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.number,
    t.url,
    t.title,
    t.body,
    t.author__login,
    t.author__avatar_url,
    t.author__url,
    t.author_association,
    t.closed,
    t.closed_at,
    t.created_at,
    t.state,
    t.updated_at,
    t.reactions_total_count,
    t.comments_total_count,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_pull_requests') }} as t