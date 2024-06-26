select s.user_id , IFNULL(ROUND(SUM(action = 'confirmed')/count(*),2),0.00) As confirmation_rate
From Signups s
Left join confirmations c
on s.user_id = c.user_id
Group by s.user_id