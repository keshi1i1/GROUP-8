# Barangay Information &amp; Services System

Description:
- Stores resident records, certificates, and project information.

Objectives:
- Integrate all DBA skills: DDL, DML, triggers, procedures, and backups.

Major Features:
- Residents, Households, Officials, Projects, Certificates tables.
- Trigger for certificate number generation.
- View for household summary.
- Import/export resident list.
- Backup and security roles.

Deliverables:
1. ERD + Data Dictionary.
2. Table scripts with constraints.
3. CRUD for residents and certificates.
4. Queries for population stats.
5. View: Barangay Summary.
6. Procedure: Permit issuance.
7. Trigger: Auto-certificate ID.
8. Backup demonstration.
9. Security (Admin/Staff).
10. Project documentation + slides.

# How to Import SQL and Security

1. Open XAMPP and initiate the local server.
2. Create a database and select it.
3. Go to the Import tab, and choose the "barangay_information_system.sql" file.
4. Go to the Import tab again, and choose the "security.sql" file.

NOTE: Importing to WAMPP database, instead of XAMPP would result to an error in creating the table "projects"
\nbecause of the difference of how "CHECK (date_end > date_start)" constraint is used.
