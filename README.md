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

# Group 8: Developers
1. Jester Von Resma
2. Ron Cyrus Medina
3. Frederick Rosales
4. Mark Manabat
5. Jhomari Gandionco
6. Jhon Benedict Balawang

# Documentation
[Full documentation here](https://docs.google.com/document/d/1DUiw2OXdhw_VdItf74Sa_3e5d3riC_VzFfT3B6QyvdQ/edit?usp=sharing)

# How to Import SQL and Security
1. Download "barangay_information_system.sql" and "security.sql" files.
2. Open XAMPP and initiate the local server.
3. Create a database and select it.
4. Go to the Import tab, and choose the "barangay_information_system.sql" file.
5. Go to the Import tab again, and choose the "security.sql" file.

NOTE: Importing to WAMPP database, instead of XAMPP would result to an error in creating the table "projects" because of the difference of how "CHECK (date_end > date_start)" constraint is used.
