#  OrangeHRM Automation Suite (Robot Framework)


This project is an automated test suite for the [OrangeHRM](https://www.orangehrm.com/) web application, built using Robot Framework and SeleniumLibrary.
It covers key user flows such as login, forgot password, and other HRM functionalities.  
The repository is structured to be modular, reusable, and easily extendable using Page object model.

## Project Structure

```bash
Orangehrm/
├── resources/
│ ├── data/ # Test data files (e.g., JSON, CSV)
│ ├── keywords/ # Reusable Robot Framework keywords
│ ├── pages/ # Page Object keywords for different pages
│ ├── screenshots/ # Screenshot storage (optional tracking)
│ └── logs/ # Log storage (may be empty, use .gitkeep)
│
├── results/ # Robot Framework output (ignored by Git)
│ ├── screenshots/ # Test screenshots captured on failures
│ └── logs/ # Test execution logs
│
├── tests/ # All test case files
│ └── forget_password.robot # Example test suite
│
├── .gitignore
├── README.md
└── requirements.txt # Python dependencies

```

---

## ⚙️ Setup Instructions

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/<your-username>/Orangehrm.git
cd Orangehrm

2️⃣ Create a Virtual Environment (Recommended)
python -m venv .venv

```
### 2️⃣ Create a Virtual Environment (Recommended)

```bash
python -m venv .venv
```
### Activate the virtual environment
```bash
# On Windows
.venv\Scripts\activate

# On macOS/Linux
source .venv/bin/activate
```

3️⃣ Install Dependencies

```bash
pip install -r requirements.txt

```
## 4 Running test cases
```bash
robot tests/

### Run a specific test file

robot tests/forget_password.robot

```

## 5 Tools and libraries used
```bash
| Tool                                                                 | Description               |
| -------------------------------------------------------------------- | ------------------------- |
| [Robot Framework](https://robotframework.org/)                       | Core automation framework |
| [SeleniumLibrary](https://github.com/robotframework/SeleniumLibrary) | Web automation            |
| [JSONLibrary](https://github.com/robotframework/JSONLibrary)         | JSON data handling        |
| Python 3.9+                                                          | Programming language      |
```
## 6 Author 

***Kebal khadka***
📧 kebal.khadka7@gmail.com