-- 1
SELECT B.cust_name
FROM restBill B
WHERE B.bill_total > 450.00 
AND B.waiter_no IN (
    SELECT S.staff_no
    FROM restStaff S
    WHERE S.headwaiter = (
        SELECT staff_no
        FROM restStaff
        WHERE first_name = 'Charles'
    )
);

-- 2
SELECT S.first_name, S.surname
FROM restStaff S
WHERE S.staff_no = (
    SELECT DISTINCT RM.headwaiter
    FROM restRoom_management RM
    INNER JOIN restRest_table RT ON RM.room_name = RT.room_name
    INNER JOIN restBill B ON RT.table_no = B.table_no
    WHERE B.cust_name = 'Nerida Smith'
    AND B.bill_date = 160111
    LIMIT 1
);

-- 3
SELECT B.cust_name
FROM restBill B
WHERE B.bill_total = (
    SELECT MIN(bill_total)
    FROM restBill
);

-- 4
SELECT S.first_name, S.surname
FROM restStaff S
LEFT JOIN restBill B ON S.staff_no = B.waiter_no
WHERE B.waiter_no IS NULL;

-- 5
SELECT DISTINCT B.cust_name, H.first_name AS headwaiter_first_name, H.surname AS headwaiter_surname, RM.room_name
FROM restBill B
INNER JOIN restRest_table RT ON B.table_no = RT.table_no
INNER JOIN restRoom_management RM ON RT.room_name = RM.room_name
INNER JOIN restStaff H ON RM.headwaiter = H.staff_no
WHERE B.bill_total = (
    SELECT MAX(bill_total)
    FROM restBill
);
