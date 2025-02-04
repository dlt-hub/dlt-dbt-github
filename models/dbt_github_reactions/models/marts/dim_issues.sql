/* Table: issues */
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
    t.created_at,
    t.state,
    t.updated_at,
    t.reactions_total_count,
    t.comments_total_count,
    t._dlt_load_id,
    t._dlt_id,
    t.closed_at,
FROM  {{ ref('stg_issues') }} as t