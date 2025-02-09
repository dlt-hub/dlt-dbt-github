/* Table: issue_comment_event */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.type,
    t.actor__id,
    t.actor__login,
    t.actor__display_login,
    t.actor__gravatar_id,
    t.actor__url,
    t.actor__avatar_url,
    t.repo__id,
    t.repo__name,
    t.repo__url,
    t.payload__action,
    t.payload__issue__url,
    t.payload__issue__repository_url,
    t.payload__issue__labels_url,
    t.payload__issue__comments_url,
    t.payload__issue__events_url,
    t.payload__issue__html_url,
    t.payload__issue__id,
    t.payload__issue__node_id,
    t.payload__issue__number,
    t.payload__issue__title,
    t.payload__issue__user,
    t.payload__issue__labels,
    t.payload__issue__state,
    t.payload__issue__locked,
    t.payload__issue__assignee,
    t.payload__issue__assignees,
    t.payload__issue__comments,
    t.payload__issue__created_at,
    t.payload__issue__updated_at,
    t.payload__issue__author_association,
    t.payload__issue__sub_issues_summary,
    t.payload__issue__body,
    t.payload__issue__reactions,
    t.payload__issue__timeline_url,
    t.payload__comment__url,
    t.payload__comment__html_url,
    t.payload__comment__issue_url,
    t.payload__comment__id,
    t.payload__comment__node_id,
    t.payload__comment__user,
    t.payload__comment__created_at,
    t.payload__comment__updated_at,
    t.payload__comment__author_association,
    t.payload__comment__body,
    t.payload__comment__reactions,
    t.public,
    t.created_at,
    t.org__id,
    t.org__login,
    t.org__gravatar_id,
    t.org__url,
    t.org__avatar_url,
    t._dlt_load_id,
    t._dlt_id,
    t.payload__issue__draft,
    t.payload__issue__pull_request,
    t.payload__issue__closed_at,
    t.payload__comment__performed_via_github_app,
    t.payload__issue__state_reason,
    t.payload__issue__milestone,
FROM  {{ ref('stg_issue_comment_event') }} as t