# Charity-Donation-System
# Overview
![Image (Dashboard)](https://github.com/user-attachments/assets/afb6b382-c834-4839-a66f-d4d8a301caf9)

The Charity Donation System is an overall web application that enables the management of charitable donations. They give the donors a ground through which they can donate to different charities and at the same time give the administrators a way through which they can monitor accounts and charities. The system should improve the process of donating and improve the level of transparency in the charity field.

# Features

# User Authentication
•	Role-Based Access Control: Features which are offered depend on the type of roles provided to the user (Admin, Fundraiser, Donor).

![Image (Login page)](https://github.com/user-attachments/assets/5d4a6f01-9ba8-4928-9549-a090bda09bc1)

•	Secure Login: Users can enter their user name and password and thus minimize exposure of certain information. 
![Image (Logout)](https://github.com/user-attachments/assets/99410912-a99a-4995-b346-9afcc36b0144)

# Charity Management
•	Charity Approval Process: Charity registration approval or rejection is done by the admins of the website.

•	Pending Charities View: Administrators can see a list of charities where some of the information is name and registration date.

# Report Viewing
•	Comprehensive Reports: Some of the reports are total donation reports, charity reports, performance reports, users report and other related reports.

•	Dynamic Data Presentation: Information is retrieved from the database and the result is arranged in a readable form by the user.

# User Management

![Image (Manage Users)](https://github.com/user-attachments/assets/e851c13e-cf9b-4167-81bc-be6f683cc3ea)

•	User Role Management: In this proposed system, admins have total control of human accounts, meaning they are the ones who can create, modify, or even delete users depending on their type: Admin, Fundraiser, or Donor.

•	User Status Tracking: Notification of the status of users can also be seen (active/inactive) where necessary action by the admin can be taken.

# Payment Method
![Image (Payment Gateway)](https://github.com/user-attachments/assets/d0ce4c25-711f-4177-8e2e-e751ba4d22c1)

![Image (Payment Success)](https://github.com/user-attachments/assets/72483516-e764-44e7-972b-c99d99a5c4d7)


# Database Integration
•	MySQL Database: All user, charity, and donation data is stored in a MySQL database, providing robust data management and retrieval capabilities.

•	Data Security: Sensitive information such as passwords is handled with care, and best practices for database security are followed.

# Technologies Used

•	Java: The backend is developed using Java Servlets, providing a robust server-side application framework.

•	MySQL: A relational database management system used for storing user and charity data.

•	JSP (JavaServer Pages): Used for rendering dynamic web content and integrating Java code with HTML.

•	HTML/CSS: For creating the frontend layout and styling the user interface.

•	Apache Tomcat: A widely used web server and servlet container for deploying Java web applications.

•	JDBC (Java Database Connectivity): For connecting and executing queries against the MySQL database.

# Installation Steps
1.	Clone the Repository: Open your terminal and run the following command to clone the repository:
     
•	git clone https://github.com/yourusername/charity-donation-system.git

•	cd charity-donation-system

2. Set Up MySQL Database:
   
•	Open your MySQL client (e.g., MySQL Workbench, command line).

•	Create a new database named charity_system: sql

•	CREATE DATABASE charity_system;

•	Import the SQL schema provided in the database folder to set up the necessary tables. You can find the SQL file (e.g., schema.sql) in the project directory.


3. Configure Database Connection:

•	Open the servlet classes (e.g., ApproveCharityServlet.java, LoginServlet.java, etc.) and verify the database connection details: 

4. Deploy on Tomcat:
   
•	Copy the project folder to the webapps directory of your Tomcat server.
   
•	Start the Tomcat server using the command line or the Tomcat Manager.

  
5. Access the Application:
   
•	Open a web browser and go to http://localhost:8080/charity-donation-system.

•	You should see the login page.


# Usage
•	Login: Users can log in using their credentials. Admins will have access to additional functionalities.

•	Charity Approval: Admins can view pending charities and approve or reject them based on the provided information.

•	View Reports: Users can access various reports, which provide insights into the donation activities and charity performance.

•	Manage Users: Admins can view the list of users and manage their roles and statuses.
