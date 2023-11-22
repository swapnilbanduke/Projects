# Employee Churn Prediction at Dunder Mifflin Paper Company

## Introduction

In this project, we aim to predict employee churn at the Dunder Mifflin Paper Company, a well-established paper company located in Scranton, Pennsylvania. The company is facing a challenge with a high turnover rate among its employees, and our goal is to understand the factors contributing to employee churn to improve satisfaction and retention.

## Dataset Features

### Employee Information

1. **EmployeeID**: A unique identifier for each employee.
2. **Tenure**: The number of years the employee has been with the company.
3. **Salary**: The employee's annual salary.
4. **Department**: The department in which the employee works (e.g., Sales, Accounting, Customer Service).
5. **JobSatisfaction**: The employee's self-reported job satisfaction level (on a scale from 1 to 5, with 5 being highly satisfied).
6. **WorkLifeBalance**: The employee's self-reported work-life balance rating (on a scale from 1 to 5, with 5 being excellent).
7. **CommuteDistance**: The distance the employee commutes to work (e.g., Short, Medium, Long).
8. **MaritalStatus**: The marital status of the employee (e.g., Single, Married, Divorced).
9. **Education**: The highest level of education attained by the employee (e.g., High School, Bachelor's, Master's).
10. **PerformanceRating**: The employee's performance rating (on a scale from 1 to 5, with 5 being excellent).
11. **TrainingHours**: The number of hours of training the employee has received.
12. **OverTime**: Whether the employee works overtime or not.
13. **NumProjects**: The number of projects the employee is currently working on.
14. **YearsSincePromotion**: The number of years since the employee's last promotion.
15. **EnvironmentSatisfaction**: The employee's self-reported environment satisfaction (on a scale from 1 to 5, with 5 being highly satisfied).

### Target Variable

- **Classes**: Employees will be classified into four classes based on their likelihood to leave:
  - Class A: Highly likely to leave.
  - Class B: Moderately likely to leave.
  - Class C: Slightly likely to leave.
  - Class D: Not likely to leave.

## Project Structure

The project is organized into the following files and directories:

1. **data**: Contains the dataset used for training and testing the model.
2. **src**: Includes the source code for data preprocessing, model training, and evaluation.
3. **models**: Stores the trained machine learning model.
4. **README.md**: The file you are currently reading, providing an overview of the project.

## How to Use

Follow these steps to run the project:

1. Clone the repository: `git clone <repository-url>`
2. Navigate to the project directory: `cd employee-churn-prediction`
3. Install the required dependencies: `pip install -r requirements.txt`
4. Run the main script: `python src/main.py`

## Results

Include information about the model's performance, key insights, and recommendations for reducing employee churn.

## Contributors

- [Your Name]
- [Other Contributor Names, if applicable]

## License

This project is licensed under the [License Name] - see the [LICENSE.md](LICENSE.md) file for details.

