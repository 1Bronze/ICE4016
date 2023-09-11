-- #1. ‘Corporate’ branch에 해당하는 모든 사원의 이름, 기존 급여, 10% 증가된 급여를 출력하라.
SELECT first_name, last_name, salary, salary * 1.1 AS increased_salary FROM employee JOIN branch ON employee.branch_id = branch.branch_id;

-- #2. 급여가 60,000에서 80,000 사이에 있는 모든 남자 사원의 이름, 급여를 출 력하라.
SELECT first_name, last_name, salary FROM employee WHERE sex = "M" AND salary BETWEEN 60000 AND 80000;

-- #3. 모든 사원을 1. branch_id(내림차순) 2. 급여(오름차순)으로 정렬하고, 이름, branch_id, 급여를 출력하라.
SELECT first_name, last_name, branch_id, salary FROM employee ORDER BY branch_id DESC, salary ASC;

-- #4. ‘FedEx’와 일하는 급여 60,000 이상의 모든 사원의 이름, total_sales를 출력하라.
SELECT first_name, last_name, total_sales FROM employee JOIN works_with ON employee.emp_id = works_with.emp_id JOIN client ON works_with.client_id = client.client_id WHERE employee.salary >= 60000 AND client_name = 'FedEx';

-- #5. 사원의 급여의 합, 최고 급여, 최저 급여, 평균 급여를 출력하라.
SELECT SUM(salary) AS total_salary, MAX(salary) AS max_salary, MIN(salary) AS min_salary, AVG(salary) AS avg_salary FROM employee;

-- #6. 회사의 총 사원수를 제시하라.
SELECT COUNT(emp_id) AS total_employees FROM employee;

-- #7. 각 branch별 근무하는 사원의 수를 검색하여 branch 이름과 소속 사원수 를 출력하라
SELECT branch_name, COUNT(emp_id) AS employees_in_branch FROM employee JOIN branch ON employee.branch_id = branch.branch_id GROUP BY branch.branch_id;