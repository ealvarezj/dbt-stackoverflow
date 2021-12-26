
{{ config(materialized='table') }}

with users as (

    select 
        owner_display_name as OP_name,
        owner_user_id as id,
        post_type_id,
        score

    from `stackoverflow_elias`.my_first_dbt_model

)

select 
    coalesce(OP_name, "No Username") as OP_name,
    sum(score) as total_score
from users
group by 1
order by 2 desc


