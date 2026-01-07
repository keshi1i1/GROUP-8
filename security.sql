CREATE USER IF NOT EXISTS 'brgy_admin'@'localhost'
IDENTIFIED BY 'Admin@123';

CREATE USER IF NOT EXISTS 'brgy_staff'@'localhost'
IDENTIFIED BY 'Staff@123';

GRANT ALL PRIVILEGES
ON *.*
TO 'brgy_admin'@'localhost'
WITH GRANT OPTION;

GRANT INSERT, SELECT, UPDATE, DELETE
ON barangay_information_system.residents
TO 'brgy_staff'@'localhost';

GRANT INSERT, SELECT, UPDATE, DELETE
ON barangay_information_system.certificates
TO 'brgy_staff'@'localhost';

GRANT EXECUTE
ON PROCEDURE barangay_information_system.IssueCertificate
TO 'brgy_staff'@'localhost';

FLUSH PRIVILEGES;
