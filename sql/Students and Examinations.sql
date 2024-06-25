Select a.student_id as student_id, a.student_name as student_name, a.subject_name as subject_name, coalesce(attended_exams,0) as attended_exams
from(
select *
from students
cross join subjects
group by student_id, student_name, subject_name) a
left join 
(Select e.student_id, student_name, subject_name, count(*) as attended_exams
from examinations e join students s
on e.student_id = s.student_id
group by e.student_id, student_name, subject_name) b
on a.student_id = b.student_id and a.subject_name =b.subject_name
order by a.student_id asc, a.subject_name asc