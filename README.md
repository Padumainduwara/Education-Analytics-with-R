# Education-Analytics-with-R

## Overview
**Education-Analytics-with-R** is a data analytics project that leverages R programming to explore and analyze state-level education data. This project focuses on gaining insights into public education spending, teacher salaries, SAT participation rates, and population trends across states. The analysis provides a comprehensive understanding of factors influencing education and helps to uncover relationships between these variables, enabling data-driven decision-making and policymaking.

---

## Features
- **Descriptive Statistics**: 
  - Calculates key measures (mean, median, mode, minimum, maximum) for education spending, teacher salaries, SAT participation, and population.
  - Generates summary statistics for a clear understanding of the dataset.

- **Visualizations**: 
  - Density plots, histograms, scatter plots, and boxplots to represent data distributions and relationships.
  - Regression analysis with visual trends using scatter plots and regression lines.

- **Inferential Statistics**:
  - Hypothesis testing (e.g., correlation analysis, ANOVA).
  - Analysis of relationships between variables like state spending, SAT participation, and teacher salaries.

- **Data Exploration**:
  - Regional comparisons of educational investments and outcomes.
  - Identification of patterns, outliers, and trends in the dataset.

---

## Tools and Libraries
### Programming Language:
- **R**: Used for statistical computations, data manipulation, and creating visualizations.

### Libraries:
- `ggplot2`: For advanced data visualizations.
- `dplyr`: For data manipulation.
- `stats`: For hypothesis testing and statistical calculations.
- `readr`: For reading CSV files.

---

## Dataset
The analysis uses a dataset (`EduStates_New.csv`) containing the following fields:
- **`dollars`**: State spending on public education per student.
- **`percent`**: Percentage of graduating high-school students taking the SAT.
- **`pay`**: Average teacher salary in the state.
- **`pop`**: State population.
- **`region`**: Regional grouping of states.

The dataset consists of 52 rows (states and territories) with both numerical and categorical variables.

---

## Key Analyses
1. **State Spending Analysis**:
   - Minimum, maximum, mean, median, and mode spending per student.
   - Insights into states with the highest and lowest investments.

2. **SAT Participation Analysis**:
   - Central tendency (mean, median, mode) and spread of SAT participation rates across states.
   - Visual representation of participation trends using density plots and histograms.

3. **Teacher Salaries**:
   - Exploration of teacher compensation's influence on SAT participation rates.
   - Analysis of regional variations in salaries.

4. **Population Analysis**:
   - The relationship between state population and SAT participation rates.
   - Variability in educational outcomes based on demographic differences.

5. **Hypothesis Testing**:
   - Testing the significance of correlations between:
     - State spending and SAT participation.
     - Teacher salaries and SAT participation.
     - Population and SAT participation.
   - ANOVA to assess spending differences across regions.

---

## Results
- A significant positive correlation was observed between state spending and SAT participation rates.
- States with higher teacher salaries tend to have higher SAT participation, suggesting the importance of competitive compensation.
- Regional disparities were identified in spending and performance, highlighting the need for targeted resource allocation.

---

## Visualizations
- **Density Plots**: Show the spread of spending, salaries, and participation rates.
- **Scatter Plots**: Reveal relationships between key variables.
- **Histograms**: Display data distributions.
- **Boxplots**: Compare state spending and salaries across regions.

---

## How to Use
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/Education-Analytics-with-R.git
   ```
2. Install required libraries in R:
   ```R
   install.packages("ggplot2")
   install.packages("dplyr")
   install.packages("readr")
   ```
3. Run the scripts (`Tasks.R` and `Task03.R`) in RStudio.
4. View the generated outputs, including visualizations and statistical summaries.

---

## Future Enhancements
- Incorporate more datasets, such as graduation rates and socioeconomic factors.
- Develop interactive dashboards using **Tableau** or **Shiny**.
- Perform predictive modeling to forecast future trends in educational spending and outcomes.

---

## Contributions
Contributions are welcome! If you'd like to improve the analysis or add new features, feel free to submit a pull request.

---

## License
This project is licensed under the MIT License. See the LICENSE file for more details.

---

## Acknowledgments
Special thanks to the resources and tools used in this project:
- **R Programming** for statistical analysis.
- **ggplot2** and **dplyr** for data visualization and manipulation.
- Educational datasets for enabling insightful analytics.
```

You can copy and paste this into a `README.md` file for your GitHub repository. Let me know if you need further adjustments or additional sections!