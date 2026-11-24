FOODY SPOT - LOCAL SETUP

1. Extract the foodyspot folder into C:\xampp\htdocs\
2. Start Apache and MySQL in XAMPP.
3. Open http://localhost/phpmyadmin
4. Import database.sql (Import tab -> Choose File -> Go).
5. Open http://localhost/foodyspot/

Database defaults:
Host: localhost
Database: foodyspot
Username: root
Password: (blank, standard XAMPP default)

Create a customer account using Register.

To create an admin account:
- Register normally through the website.
- In phpMyAdmin, open database foodyspot, SQL tab, run:
  UPDATE users SET role='admin' WHERE email='YOUR_REGISTERED_EMAIL';
- Log out and log in again.
- Open http://localhost/foodyspot/admin.php

IMPORTANT:
- Change database credentials in config/db.php if your MySQL root account has a password.
- This is a student/demo project. Before public production use, add CSRF protection, rate limiting, secure production database credentials, HTTPS, backups, and privacy/legal pages.
- Replace demo food image URLs with your own licensed images if needed.
