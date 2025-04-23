# Gravity Bookstore Data Warehouse

## 📚 Project Overview

This project involves modeling and building a **Data Warehouse** for **Gravity Bookstore**, a fictional bookstore that maintains comprehensive information about books, authors, customers, and their transactions. The warehouse is optimized for analytical processing and reporting.

---

## 🎯 Objectives

- Design and implement the `gravity_books_dwh` Data Warehouse using Snowflake Schema
- Build a date dimension to support time-based analytics
- Ensure referential and data integrity between fact and dimension tables
- Develop an SSIS project to populate the warehouse from the transactional DB
- Create an SSAS cube (Multidimensional) for advanced analysis

---

## 🗃️ Source Database (OLTP)

To set up the source database (`gravity_books`):

1. Download SQL files from the original repository:  
   [GitHub - Gravity Bookstore Sample Database](https://github.com/bbrumm/databasestar/tree/main/sample_databases/sample_db_gravity/gravity_sqlserver)
2. Create a new SQL Server database named `gravity_books`
3. Run the downloaded scripts

---

## 📐 Dimensional Model

This project uses a **Snowflake Schema**, where dimensions are normalized into multiple related tables. This enhances data integrity and reduces redundancy at the cost of slightly more complex queries.

### 💡 Why Snowflake Schema?

- Reduces data redundancy through normalization
- Easier maintenance and updates on dimension attributes
- Suitable for environments with complex relationships (e.g., authors, books, addresses)

---

### 🗺️ Data Warehouse Schema

![DWH Schema](https://github.com/user-attachments/assets/3e339480-6805-4ed7-af3e-573a03b5bb86)

**Main Tables:**

- `PriceFact`: Central fact table storing sales data (with foreign keys to all dimensions)
- `DimDate`: Tracks calendar dates and periods
- `DimBook`: Contains book metadata and foreign keys to publisher and language
- `DimAuthor`: Stores author info
- `Dim_Book_Author`: Resolves many-to-many relationship between books and authors
- `DimCustomer`: Customer details
- `DimCustomerAddress`: Links customers to addresses (many-to-many)
- `DimAddress`: Address details including city and country

---

## ✅ Data Integrity Checks

To maintain referential integrity, the following practices were used:

- Use of **surrogate keys** for all dimensions
- **Foreign key constraints** in the fact table
- **SQL queries** to validate orphan records, such as:

```sql
-- Find sales records with missing books
SELECT * FROM PriceFact pf
LEFT JOIN DimBook db ON pf.book_fk = db.book_id_SK
WHERE db.book_id_SK IS NULL;

```
## 🧰 ETL Process (SSIS)

The **SSIS project** performs ETL from the `gravity_books` transactional database into `gravity_books_dwh`. It includes:

- Data transformation and cleansing  
- Handling of Slowly Changing Dimensions (Type 2)  
- Lookup and merge logic  

### 📄 Files:

- SSIS `.dtsx` packages  
- Mapping sheet for field correspondence  

---

## 📊 OLAP Cube (SSAS)

An SSAS project was built using the **Multidimensional model**, with dimensions for:

- Date  
- Book (with drilldowns to publisher and language)  
- Customer (with address hierarchy)  
- Author  

### 📦 Deliverables:

- SSAS `.bim` file  
- Screenshots of cube browsing showing drilldowns and KPIs  

---

## ⚙️ Requirements

- Microsoft SQL Server  
- SQL Server Integration Services (SSIS)  
- SQL Server Analysis Services (SSAS)  
- SSDT (SQL Server Data Tools)  
