# IS 507: Data and Statistics

## Overview
Statistical analysis projects and assignments completed for IS 507. Primary project components include statistical modeling and machine learning evaluations of the 2023 Formula 1 season in R, assessing driver ratings, qualifying results, and race metrics.

## Repository Structure
- `assignment 2/`: R scripts (`Q2.R`, `Q3.R`, `Q5.R`) covering probability distributions and descriptive statistical procedures.
- `project/`: F1 dataset modeling and analysis directory.
  - `trial.R`: Exploratory analysis and regression modeling scripts (Linear Regression, Random Forest).
  - `f1_project_folder-20241216T053807Z-001/f1_project_folder/`: Scripts focused on specific research questions (`research_question_1.R`, `research_question_2.R`).
  - `.mp4` and `.potx`: Project presentation media and slide decks.
- `boxplot.R`: Standalone script for score distribution boxplot generation.

## Methodology
The F1 analysis integrates dataset sources from the 2023 season:
- Race and Qualifying Results
- F1 23 Driver Ratings
- Driver of the Day Voting Records

Analytical pipeline:
- **Feature Engineering**: Derivation of mean race finish metrics and Driver of the Day selection frequencies.
- **Exploratory Data Analysis**: Generation of correlation matrices and pair plots for variable dependency analysis.
- **Modeling**: 
  - Multiple Linear Regression evaluating finish position against rating, experience, salary, and fan voting metrics.
  - Random Forest Regression capturing non-linear relationships and evaluating feature importance rankings.

## Key Findings
- Driver ratings and Driver of the Day voting percentages show strong correlation with seasonal race performance metrics.
- Random Forest feature importance identifies driver attributes and seasonal stats with high predictive weight for finishing outcomes.

## Author

Atharva Sathaye
