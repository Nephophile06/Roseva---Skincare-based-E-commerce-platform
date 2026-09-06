<div align="center">
 
  <img src="https://iili.io/ndPY5Ft.jpg" alt="Roséva Logo"  />
 
  **The Proof is in Your Reflection.**  
  *A luxury, transparent skincare e-commerce web application crafted with transparency, aesthetics, verified safety standards, and seamless user experience.*
</div>
 
 
### Overview
 
Traditional skincare brands rely heavily on vague marketing claims and buzzwords like "Premium Quality" or "100% Organic," which creates ambiguity for consumers. Users, particularly those with sensitive or problem-prone skin, struggle to make confident decisions without clear, structured evidence. The fundamental issue in e-commerce skincare is a lack of verifiable facts, leading to a breakdown in consumer trust.

The core philosophy of **Roséva** is built on verification rather than assumptions. The primary goal was to shift the industry mindset from a blind "Trust us" to an empowered "Know what you use". To achieve this, the entire design system was structured to translate complex clinical data into simple, actionable insights. The brand voice was intentionally defined as educational, avoiding aggressive marketing, or exaggerated beauty claims.
 
### Features
 
* **Storefront & Navigation:** Dynamic `Hero Showcase` and a smooth `Product Carousel` for seamlessly browsing skincare categories.
 
* **Catalog & Filtering (`products.jsp`):** Instant `Category Filtering`, intuitive `Search & Sort`, and complete `Pagination` for effortless discovery.
 
* **Product Details (`product-detail.jsp`):** `Interactive Galleries`, verified `Ingredient Transparency`, live `Community Reviews`, and quick `Add to Cart` controls.
 
* **Dynamic Cart (`cart.jsp`):** Interactive `Item Selection` driven by a real-time `Price Engine` for instant subtotal recalculations.
 
* **Streamlined Checkout (`checkout.jsp`):** Secure flow featuring `Address Validation`, clear `Order Summaries`, and flexible `Payment Options` (Cards, Mobile Banking, COD).
 
* **Customer Dashboard (`profile.jsp`):** Centralized `Profile Management` paired with an interactive `Live Order Tracking` timeline and detailed purchase history.
 
* **The Journal (`journal.jsp`):** Curated `Skincare Science Articles` presented in a clean, `Typography-First` editorial layout.
 
 
### Initial Project Structure
 
```plaintext
Roséva/
├── assets/                  # Product imagery, banners, icons & logos
├── css/
│   └── styles.css           # Custom animations, transitions & button styling
├── js/
│   ├── main.js              # Interactive UI, cart state, dropdowns & animations
│   └── tailwind-config.js   # Custom Tailwind theme tokens & font families
├── WEB-INF/                 # Java EE web application configuration
│   └── web.xml              # Deployment descriptor
├── META-INF/                # Context configuration
├── index.jsp                # Landing & Home page
├── products.jsp             # Product listing & catalog page
├── product-detail.jsp       # Product details, reviews & formulation
├── cart.jsp                 # Interactive shopping cart
├── checkout.jsp             # Checkout & payment processing
├── profile.jsp              # Customer account & order tracking
├── journal.jsp              # Skincare editorial & journal
└── README.md                # Project documentation
```
###       Built With
<p align="center">
    <!-- Frontend -->
    <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white" alt="HTML5" />
    <img src="https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white" alt="Tailwind CSS" />
    <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black" alt="JavaScript" />
    <!-- Backend & Database -->
    <img src="https://img.shields.io/badge/Java_%2F_JSP-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white" alt="Java & JSP" />
    <img src="https://img.shields.io/badge/Oracle_21c-F80000?style=for-the-badge&logo=oracle&logoColor=white" alt="Oracle Database" />
    <!-- Server & Deployment -->
    <img src="https://img.shields.io/badge/Apache_Tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black" alt="Apache Tomcat" />
    <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker" />
    <img src="https://img.shields.io/badge/Render-46E3B7?style=for-the-badge&logo=render&logoColor=black" alt="Render" />
    <!-- Architecture -->
    <img src="https://img.shields.io/badge/Architecture-POJO_%26_DAO-7A2E47?style=for-the-badge" alt="Architecture Pattern" />
  </p>
 
 
## Getting Started & Deployment
 
### Prerequisites
- [Java Development Kit (JDK 21)](https://www.oracle.com/java/technologies/downloads/)
- [Apache Tomcat 10.1](https://tomcat.apache.org/) (or any standard Java Servlet container)
- Modern Web Browser (Chrome, Firefox, Edge, Safari)
 
> Here is the expanded and comprehensive installation guide. It includes the necessary Oracle database configuration, user creation, and application credential updates required to actually get the project running locally.
 
## Installation & Running Locally
 
**1. Clone the Repository**
 
```bash
git clone https://github.com/Nephophile06/roseva-skincare.git
cd roseva-skincare
```
 
**2. Database Setup (Oracle 21c XE)**
Before running the application, you must configure the database schema and user.
 
* Open **SQL*Plus** or **Oracle SQL Developer** and log in as `SYSDBA` or a system administrator.
* Execute the following SQL commands to create the dedicated user and grant necessary privileges:
```sql
CREATE USER c##roseva IDENTIFIED BY roseva123;
GRANT CONNECT, RESOURCE, DBA TO c##roseva;
GRANT UNLIMITED TABLESPACE TO c##roseva;
```
 
 
* Disconnect, then **reconnect** using the newly created `c##roseva` user.
* Locate the provided SQL script (e.g., `schema.sql` or `database.sql`) inside the project repository and execute it to generate the required tables and insert initial dummy data.
 
**3. Configure Application Credentials**
 
* Navigate to the database connection utility class in the project source code (typically something like `DBConnection.java`).
* Update the JDBC credentials to match the user you just created:
```java
String jdbcURL = "jdbc:oracle:thin:@localhost:1521:XE";
String dbUser = "c##roseva";
String dbPassword = "roseva123";
```
 
**4. Build and Deploy**
 
* Open the project in your preferred Java EE IDE (Eclipse, IntelliJ IDEA Ultimate, etc.).
* Ensure the **Oracle JDBC Driver** (`ojdbc11.jar` or `ojdbc17.jar`) is placed inside the `WEB-INF/lib` directory as well as in the `tomcat/lib` folder.
* Build the project and add it to your local Apache Tomcat deployment configuration.
 
**5. Start Tomcat Server**
 
```bash
# On Windows:
<TOMCAT_HOME>/bin/startup.bat
 
# On macOS / Linux:
<TOMCAT_HOME>/bin/startup.sh
```
 
**6. Access the Application**
Open your web browser and navigate to:
 
```http
http://localhost:8080/roseva-skincare/index.jsp
```
 
*(Note: Ensure the URL matches your exact Tomcat deployment context path).*
 
 
## License
 
**All Rights Reserved.**

This project is for viewing and demonstration purposes only. The source code, design, assets, and other contents of this project may not be copied, reproduced, modified, distributed, or reused without prior written permission from the owner.
 
<div align="center">
  <sub>Crafted with passion for radiant, healthy skin • © Roséva Skincare</sub>
</div>