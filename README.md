OrangeHRM Automation Suite

This repository contains automation tests for OrangeHRM using Robot Framework with the Page Object Model (POM) design pattern. Test data is managed through JSON files for reusability and maintainability.

Project Structure
OrangeHRM/
│
├── resources/
│   ├── pages/           # Page Object Model files (e.g., login_page.robot)
│   ├── data/            # JSON test data files
│   └── keywords/        # Optional custom keywords
│
├── tests/               # Test case files
│   └── test_login.robot
│
├── .venv/               # Python virtual environment
├── robot_output/        # Output, logs, and reports (after test execution)
├── README.md
└── requirements.txt     # Required Python packages


Page Object Model (POM)

All page locators and keywords are stored in resources/pages/.
Test cases import these resources and call page-level keywords.

⚙ Setup Instructions

Clone the repository
git clone <repo-url>
cd OrangeHRM

Set up a Python virtual environment
python -m venv .venv

Activate the virtual environment
.venv\Scripts\activate


