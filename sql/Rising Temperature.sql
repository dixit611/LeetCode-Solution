select a.Id from weather a, weather b
where a.Temperature>b.Temperature and  datediff(a.recorddate,b.recorddate)=1