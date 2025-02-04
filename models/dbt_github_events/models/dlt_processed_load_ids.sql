{{
    config(
        materialized='incremental'
    )
}}
-- depends_on: {{ ref('dim__dlt_loads') }}
-- depends_on: {{ ref('dim_watch_event') }}
-- depends_on: {{ ref('dim_fork_event') }}
-- depends_on: {{ ref('dim_issues_event') }}
-- depends_on: {{ ref('dim_issue_comment_event') }}
-- depends_on: {{ ref('dim_pull_request_review_event') }}
-- depends_on: {{ ref('dim_push_event') }}
-- depends_on: {{ ref('dim_delete_event') }}
-- depends_on: {{ ref('dim_pull_request_event') }}
-- depends_on: {{ ref('dim_create_event') }}
-- depends_on: {{ ref('dim_pull_request_review_comment_event') }}
-- depends_on: {{ ref('dim_push_event__payload__commits') }}
/* we save all currently active load ids into the processed ids table */
select load_id, {{ current_timestamp() }} as inserted_at FROM {{ ref('dlt_active_load_ids') }}