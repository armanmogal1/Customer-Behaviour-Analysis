<h1>Customer Shopping Behavior Analysis 📊</h1>

<p>
A comprehensive data analysis project exploring customer shopping patterns, preferences, 
and behaviors using SQL, Python, and Power BI to derive actionable business insights.
</p>

<h2>🎯 Project Overview</h2>
<p>
This project analyzes customer shopping data to understand purchasing patterns, customer 
preferences, and revenue drivers. The analysis includes EDA, SQL querying, and Power BI 
visualization to support better business decisions.
</p>

<h2>📊 Dataset Description</h2>
<ul>
  <li><strong>Total Records:</strong> 3,900</li>
</ul>

<h2>🎯 Objectives</h2>
<ul>
  <li>Segment customers based on demographics and behavior</li>
  <li>Identify revenue-driving categories and customer groups</li>
  <li>Analyze product performance and seasonal trends</li>
  <li>Calculate customer value to identify high-value segments</li>
  <li>Study purchase frequency, subscription behavior, and payment preferences</li>
  <li>Provide actionable insights for marketing and inventory strategies</li>
</ul>

<h2>🛠 Tools & Technologies</h2>
<ul>
  <li><strong>PostgreSQL:</strong> Database & SQL queries</li>
  <li><strong>Power BI:</strong> Dashboard & visualizations</li>
  <li><strong>Python (Jupyter Notebook):</strong> Data cleaning & EDA</li>
</ul>

<h2>⚙️ Project Workflow</h2>
<ol>
  <li><strong>Data Collection</strong>
    <ul><li>Load CSV dataset (3,900 records)</li></ul>
  </li>

  <li><strong>Data Cleaning & Preprocessing (Python)</strong>
    <ul>
      <li>Handle missing values (37 nulls in review_rating)</li>
      <li>Standardize column names to snake_case</li>
      <li>Create derived features:
        <ul>
          <li>age_group (4 categories)</li>
          <li>purchase_frequency_days (7–365 days)</li>
        </ul>
      </li>
      <li>Remove redundant columns (promo_code_used)</li>
      <li>Convert data types where required</li>
    </ul>
  </li>

  <li><strong>Database Setup (PostgreSQL)</strong>
    <ul>
      <li>Create database: <em>customer_behaviour</em></li>
      <li>Load cleaned data into <em>customer</em> table</li>
      <li>Optimize table for faster SQL querying</li>
    </ul>
  </li>

  <li><strong>SQL Analysis</strong>
    <ul>
      <li>10 business-focused SQL queries</li>
      <li>Analyze customer spending & patterns</li>
      <li>Calculate revenue & category metrics</li>
      <li>Generate customer-level insights</li>
    </ul>
  </li>

  <li><strong>Visualization (Power BI)</strong>
    <ul>
      <li>Design interactive dashboard</li>
      <li>Create KPIs, cards, and charts</li>
      <li>Implement slicers & filters for dynamic analysis</li>
    </ul>
  </li>

  <li><strong>Insights & Recommendations</strong>
    <ul><li>Document key findings & business actions</li></ul>
  </li>
</ol>

<h2>💡 Key Insights</h2>

<h3>📌 Customer Demographics</h3>
<ul>
  <li>Age Range: 18–70 (Avg: 44 years)</li>
  <li>Gender: 68% Male, 32% Female</li>
  <li>Subscriptions: 27% active subscribers</li>
</ul>

<h3>📌 Revenue Insights</h3>
<ul>
  <li>Average Purchase Value: $59.76</li>
  <li>Purchase Range: $20 – $100</li>
  <li>Top Category: Clothing (44.5% / 1,737 items)</li>
</ul>

<h3>📌 Customer Behavior</h3>
<ul>
  <li>Avg Purchase Frequency: 25.4 previous purchases</li>
  <li>Avg Customer Rating: 3.75 / 5</li>
  <li>Top Season: Spring (25.6% purchases)</li>
</ul>

<h3>📌 Product Performance</h3>
<ul>
  <li>Most Popular Item: Blouse (171 purchases)</li>
  <li>Top Size: Medium (45%)</li>
  <li>Most Popular Color: Olive (177 purchases)</li>
</ul>

<h3>📌 Payment & Shipping Preferences</h3>
<ul>
  <li>Top Payment Method: PayPal (17.4%)</li>
  <li>Preferred Shipping: Free Shipping (17.3%)</li>
  <li>Discount Usage: 57% purchased without discounts</li>
</ul>

