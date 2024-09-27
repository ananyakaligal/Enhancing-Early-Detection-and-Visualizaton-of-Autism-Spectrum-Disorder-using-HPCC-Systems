# Enhancing Early Detection and Visualization of Autism Spectrum Disorder

This project leverages HPCC Systems to improve early detection and visualization of Autism Spectrum Disorder (ASD). HPCC Systems is a powerful open-source data analytics platform designed for big data processing, making it ideal for managing, analyzing, and visualizing the large datasets required for ASD diagnosis.

HPCC Systems Overview
HPCC Systems (High-Performance Computing Cluster) provides a distributed data-intensive computing platform. It is designed to efficiently process large-scale data across multiple nodes and integrates an intuitive data-centric programming language called ECL (Enterprise Control Language).HPCC Systems was selected for this project due to its ability to handle large datasets, real-time data processing, and its built-in support for distributed machine learning. Its Thor engine allows the efficient processing of Q-Chat data, while the ROXIE engine facilitates real-time querying to generate personalized advice based on user inputs. This makes HPCC Systems an ideal platform for building a robust, scalable solution for early ASD detection.

Key benefits of using HPCC Systems include:

Scalability: The system can process massive datasets in parallel, enabling real-time analytics and machine learning on large amounts of data.
Efficiency: The Thor processing engine within HPCC handles complex ETL (Extract, Transform, Load) tasks, making it an ideal choice for preprocessing, cleaning, and feature engineering of ASD-related data.
Flexibility: HPCC's integrated machine learning libraries provide out-of-the-box algorithms, simplifying the development of predictive models for ASD diagnosis.
ROXIE Query Engine: It supports high-speed data delivery, enabling real-time personalized recommendations based on individual user inputs.

Project Objectives
Using HPCC Systems for ASD Detection:
Data Distribution: Visualize how autistic and control subjects vary across different age groups.
Model Evaluation: Build predictive models (Logistic Regression and Random Forest) using HPCC's machine learning libraries.
Feature Analysis: Interpret which Q-Chat responses are most influential in detecting ASD traits using SHAP values and feature importance.
Personalized Advice: Generate tailored advice for individuals by integrating ROXIE Queries with a user-friendly Q-Chat interface.

Methodology
Data Collection & ETL Pipeline: Using HPCC Systems’ Thor engine, raw data is collected, processed, and transformed for analysis. This involves filtering Q-Chat responses, encoding categorical data, and handling missing values efficiently.
Model Building:
The Logistic Regression, Random Forest, and SVM models are built using the data processed in HPCC.
HPCC’s machine learning libraries simplify the implementation and training of these models for ASD classification.
Model Evaluation:
Performance is evaluated using standard metrics like Accuracy, Confusion Matrix, and Matthews Correlation Coefficient (MCC) to identify the best model for ASD detection.
Feature Analysis:
SHAP (SHapley Additive exPlanations) values are calculated to understand the contributions of each feature (Q-Chat question) to the model’s predictions. This is made efficient through HPCC’s distributed processing capabilities.
ROXIE Query for Personalized Advice:
ROXIE, the high-performance data query engine of HPCC, enables real-time queries where users can input their Q-Chat answers (Yes/No). Based on these inputs, the system offers personalized recommendations on ASD diagnosis and intervention.
Results
The Random Forest classifier showed the best performance with an accuracy of 96.7%.
The Confusion Matrix indicates strong predictive power with minimal false negatives.
Key Features: Important features for classification include "response to name," "eye contact," and "sharing interest."




![Example Poster 3 column (Blank) (4)](https://github.com/user-attachments/assets/8b7653e7-47a1-4410-9bd6-0fea0d11e915)
