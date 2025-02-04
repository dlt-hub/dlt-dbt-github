{{
    config(
        materialized='incremental'
    )
}}
-- depends_on: {{ ref('dim__dlt_loads') }}
-- depends_on: {{ ref('dim_pull_requests') }}
-- depends_on: {{ ref('dim_issues') }}
-- depends_on: {{ ref('dim_pull_requests__comments') }}
-- depends_on: {{ ref('dim_pull_requests__comments__reactions') }}
-- depends_on: {{ ref('dim_pull_requests__reactions') }}
-- depends_on: {{ ref('dim_issues__comments') }}
-- depends_on: {{ ref('dim_issues__comments__reactions') }}
-- depends_on: {{ ref('dim_issues__reactions') }}
/* we save all currently active load ids into the processed ids table */
select load_id, {{ current_timestamp() }} as inserted_at FROM {{ ref('dlt_active_load_ids') }}