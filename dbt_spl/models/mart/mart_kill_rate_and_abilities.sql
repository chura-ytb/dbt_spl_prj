select
    a.*,
    b.ability_name,
    b.ability_value
from {{ ref('int_kill_rate') }} as a
left join {{ ref('int_abilities_log') }} as b
    on
        a.battle_id = b.battle_id
        and
        a.member_id = b.member_id
