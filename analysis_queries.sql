-- Macro: Yearly Total Imports and Duty Paid
SELECT
    YEAR,
    SUM([TOTAL VALUE_INR]) AS total_imports,
    SUM([DUTY PAID_INR]) AS duty_paid
FROM
    cleaned_trade_data
GROUP BY
    YEAR
ORDER BY
    YEAR;

-- Macro: Grand Total Import Value Yearly
SELECT
    YEAR,
    SUM([TOTAL VALUE_INR] + [DUTY PAID_INR]) AS grand_total_value
FROM
    cleaned_trade_data
GROUP BY
    YEAR
ORDER BY
    YEAR;


-- Pareto Analysis: Top 10 HSN Codes by Trade Value
SELECT
    [HS CODE],
    SUM([TOTAL VALUE_INR]) AS code_total
FROM
    cleaned_trade_data
GROUP BY
    [HS CODE]
ORDER BY
    code_total DESC
LIMIT 10;

-- Optional: "Others" bucket (All codes outside Top 10)
SELECT
    'Others' AS HSN_GROUP,
    SUM([TOTAL VALUE_INR]) AS code_total
FROM
    cleaned_trade_data
WHERE
    [HS CODE] NOT IN (
        SELECT [HS CODE]
        FROM cleaned_trade_data
        GROUP BY [HS CODE]
        ORDER BY SUM([TOTAL VALUE_INR]) DESC
        LIMIT 10
    );




-- Micro/Unit Economics: Landed Cost Per Unit for Valid Quantities
SELECT
    EXTRACTED_CAPACITY,
    (LANDED_COST / QUANTITY) AS landed_cost_per_unit
FROM
    cleaned_trade_data
WHERE
    QUANTITY > 0;

-- Micro: Category/Sub-Category Aggregation (for Drilldown Bar)
SELECT
    CATEGORY,
    SUB_CATEGORY,
    SUM([TOTAL VALUE_INR]) AS total_value
FROM
    cleaned_trade_data
GROUP BY
    CATEGORY,
    SUB_CATEGORY
ORDER BY
    total_value DESC;

-- Feature Engineering: Example for extracting monthly trends (optional)
SELECT
    YEAR,
    MONTH,
    SUM([TOTAL VALUE_INR]) AS imports_monthly
FROM
    cleaned_trade_data
GROUP BY
    YEAR,
    MONTH
ORDER BY
    YEAR,
    MONTH;




-- Supplier Logic: Active and Historical Supplier Mapping
-- Assignment Note: Supplier Name and Address field is missing in provided dataset.
-- As a result, supplier longevity analysis for 2025 vs. historical cannot be performed.
-- If data were present, example query might look like:

-- SELECT SUPPLIER_NAME, YEAR, SUM([TOTAL VALUE_INR]) AS supplier_value
-- FROM cleaned_trade_data
-- GROUP BY SUPPLIER_NAME, YEAR
-- ORDER BY supplier_value DESC;

-- See README and insights summary for further notes on analytic limitations.
