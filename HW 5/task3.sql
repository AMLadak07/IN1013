-- 1
SELECT S.first_name, S.surname
FROM restBill B
JOIN restStaff S ON B.waiter_no = S.staff_no
WHERE B.cust_name = 'Tanya Singh';

-- 2
SELECT room_date
FROM restRoom_management RM
JOIN restStaff S ON RM.headwaiter = S.staff_no
WHERE S.first_name = 'Charles' AND RM.room_name = 'Green'
AND room_date BETWEEN 160201 AND 160229;

-- 3
SELECT W.first_name, W.surname
FROM restStaff W
JOIN restStaff Z ON W.headwaiter = Z.headwaiter
WHERE Z.first_name = 'Zoe' AND surname = 'Ball' AND W.staff_no != Z.staff_no;

-- 4
SELECT B.cust_name, B.bill_total AS amount_spent, S.first_name || ' ' || S.surname AS waiter_name
FROM restBill B 
JOIN restStaff S ON B.waiter_no = S.staff_no
ORDER BY amount_spent DESC;

-- 5
SELECT DISTINCT S.first_name, S.surname
FROM restStaff S 
JOIN restBill B ON S.staff_no = B.waiter_no
WHERE B.bill_no IN (00014, 00017);

-- 6
SELECT S.first_name, S.surname 
FROM restStaff S 
JOIN restRoom_management RM ON S.staff_no = RM.headwaiter OR S.headwaiter = RM.headwaiter
WHERE RM.room_name = 'Blue' AND room_date = 160312;