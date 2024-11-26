-- 1
SELECT S.first_name, S.surname, B.bill_date, COUNT(B.bill_no) AS bill_count
FROM restBill B
INNER JOIN restStaff S ON B.waiter_no = S.staff_no
GROUP BY S.first_name, S.surname, B.bill_date
HAVING COUNT(B.bill_no) >= 2;

-- 2
SELECT RT.room_name, COUNT(RT.table_no) AS table_count
FROM restRest_table RT
WHERE RT.no_of_seats > 6
GROUP BY RT.room_name;

-- 3
SELECT RM.room_name, SUM(B.bill_total) AS total_amount
FROM restBill B
INNER JOIN restRest_table RT ON B.table_no = RT.table_no
INNER JOIN restRoom_management RM ON RT.room_name = RM.room_name
GROUP BY RM.room_name;

-- 4
SELECT H.first_name, H.surname, SUM(B.bill_total) AS total_bill_amount
FROM restBill B
INNER JOIN restStaff W ON B.waiter_no = W.staff_no
INNER JOIN restStaff H ON W.headwaiter = H.staff_no
GROUP BY H.first_name, H.surname
ORDER BY total_bill_amount DESC;

-- 5
SELECT B.cust_name, AVG(B.bill_total) AS average_spent
FROM restBill B
GROUP BY B.cust_name
HAVING AVG(B.bill_total) > 400;

-- 6
SELECT S.first_name, S.surname, COUNT(B.bill_no) AS bill_count
FROM restBill B
INNER JOIN restStaff S ON B.waiter_no = S.staff_no
GROUP BY S.first_name, S.surname, B.bill_date
HAVING COUNT(B.bill_no) >= 3;