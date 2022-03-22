
/*
Write an SQL query to find employees who have the highest salary in each of the departments.
*/

/* Solution*/

select d.Name as Department, e.Name as Employee, e.Salary
from Employee as e
    join Department as d
    on e.DepartmentId = d.Id
    join (
        select max(Salary) as Salary, DepartmentId
        from Employee
        group by DepartmentId
    ) as target
    on e.Salary = target.Salary and e.DepartmentId = target.DepartmentId
    ;
