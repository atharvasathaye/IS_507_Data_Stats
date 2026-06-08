# IS_507 Data & Stats

## Overview
This repository contains statistical analysis projects and assignments completed for the IS 507 course. The major component is a comprehensive data analysis project examining the 2023 Formula 1 season. It explores driver ratings, qualifying results, and race performances using statistical and machine learning techniques in R.

## Repository Structure
- `assignment 2/`: Contains R scripts (Q2, Q3, Q5, etc.) covering basic probability, binomial distributions, and foundational statistics.
- `project/`: Contains the main F1 analysis project.
  - `trial.R`: The core exploratory analysis and modeling script (Linear Regression, Random Forest) analyzing driver performance.
  - `f1_project_folder-20241216T053807Z-001/f1_project_folder/`: Contains specific research question scripts (`research_question_1.R`, `research_question_2.R`).
  - `.mp4` and `.potx` files: Final presentation materials for the F1 project.
- `boxplot.R`: A standalone script to visualize exam scores with a box plot.

## Methodology
The F1 project uses data from the 2023 season, standardizing and merging several datasets:
- Race and Qualifying Results
- F1 23 Video Game Driver Ratings
- Driver of the Day Votes

The analysis involves:
- **Feature Engineering**: Creating average race performance metrics and Driver of the Day frequencies.
- **Exploratory Data Analysis**: Generating correlation matrices and visualizing pairwise relationships to understand underlying patterns.
- **Modeling**: 
  - Applying Multiple Linear Regression to model average race performance against driver rating, experience, salary, and popularity.
  - Training a Random Forest Regression model to capture non-linear relationships and assess feature importance.

## Key Findings
- Driver ratings (from the video game) and Driver of the Day voting percentages correlate strongly with actual average race performance.
- The Random Forest model provides feature importance metrics, helping pinpoint which specific driver attributes and real-world statistics best predict overall success in the 2023 season.
