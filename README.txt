# Siddharth Associates Trade Data Assignment

## Overview
This submission automates international trade data analysis using Python, SQL, and business intelligence dashboards. The workflow extracts and visualizes macro trends, unit economics, and HSN/category impacts for the period 2017–2025.

## Folder Structure
- `data/raw/`: Raw Excel data as received
- `data/processed/`: Cleaned CSV and SQLite DB for analysis
- `notebooks/`: Python Jupyter workflow and output
- `sql/`: Main analysis SQL queries
- `dashboards/exports/`: Dashboard visualizations (PDF, PPTX, or .pbix/.twb)
- `docs/`: Report/README/summary files

## Key Analysis Steps
1. **Data Cleaning & Parsing:**  
   - Used regex/NLP in Python to extract model name, capacity, and material from unstructured descriptions.
   - Standardized all units.
2. **Feature Engineering:**  
   - Computed landed cost and auto-categorized HSNs and sub-categories.
3. **SQL Analysis:**  
   - Macro trends, Pareto (top HSNs), YoY growth, and micro-level economics.
   - *Supplier analysis not performed due to missing supplier field in provided data.*
4. **Visualization:**  
   - Macro and category dashboard, interactive drill-downs, and unit economics scatterplot.

## How to Review
- Open the main notebook in `notebooks/01_data_inspection.ipynb` for full code and inline comments.
- Review dashboards in `dashboards/exports/`.
- SQL queries are in `sql/analysis_queries.sql` (or in the notebook cells).

## Author & Date
- Your Name (update)
- Submission date: (update)
