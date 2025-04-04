# Aavistus Website Test Automation

This project provides a structured automation framework for testing the Aavistus web application using Robot Framework with the Page Object Model (POM) design pattern.

## Project Structure

```
project_root/
├── .env                       # Environment variables (credentials)
├── env_vars.resource          # Resource file to load environment variables
├── load_env_mac_linux.sh      # Script to load env vars on Mac/Linux
├── load_env_windows.ps1       # Script to load env vars on Windows
├── firefox_utils.py           # Firefox profile utilities
├── tests/
│   ├── test_login.robot       # Login test cases
│   ├── test_spaces.robot      # Space management test cases
│   ├── test_projects.robot    # Project management test cases
│   ├── test_sessions.robot    # Session test cases
│   ├── test_multi_client.robot # Multi-client interaction test cases
│   └── resources/
│       ├── common.resource    # Common keywords
│       └── pages/
│           ├── landing_page.resource   # Landing page
│           ├── login_modal.resource    # Login modal
│           ├── signup_page.resource    # Signup page
│           ├── home_page.resource      # Home page
│           ├── sidebar_menu.resource   # Sidebar menu
│           ├── profile_menu.resource   # Profile menu
│           ├── space_page.resource     # Space page
│           ├── project_page.resource   # Project page
│           └── session_page.resource   # Session page
```

## Setup and Configuration

### Prerequisites

- Python 3.7 or higher
- Robot Framework
- SeleniumLibrary
- Firefox browser (If any other browser is used, update the `firefox_utils.py` file accordingly, and browser env variable in the other files)

### Installation

1. Clone this repository
   ```
   git clone https://github.com/Andebugulin/aavistus-test.git
   ```
2. Install required dependencies:
   ```
   pip install -r requirements.txt
   ```

### Environment Setup

1. Create a `.env` file in the project root with the following structure:
   ```
   # Login credentials for the first client
   EMAIL=your_email@example.com
   PASSWORD=your_password
   
   # Login credentials for the second client (for multi-client tests)
   EMAIL_2=second_user@example.com
   PASSWORD_2=second_password
   ```

2. Load environment variables before running tests, by executing these commands:
   - On Mac/Linux in the terminal:
     ```
     source load_env_mac_linux.sh
     ```
   - On Windows (PowerShell) (don't forget to open PowerShell):
     ```
     .\load_env_windows.ps1
     ```

## Page Object Model (POM)

This project follows the Page Object Model design pattern to create a structured and maintainable automation framework:

- **Page Objects**: Each page of the application has its own resource file with all elements and actions (NOTE: not all the pages are implemented)
- **Reusable Keywords**: Common actions are organized into reusable keywords 
- **Separation of Concerns**: Test logic is separated from page implementation details

## Running Tests

### Single Test Suite

```
robot -d results tests/test_login.robot
```

### All Tests

```
robot -d results tests/
```

### Custom Variable Assignment

```
robot -d results -v BROWSER:chrome tests/test_login.robot
```

## Key Features

### Session Management

The framework uses a single browser session for multiple tests, improving efficiency:

- `Suite Setup` initializes the session with `Login Once`
- `Test Setup` uses `Prepare Test` to ensure we're in the right state
- Browser is only closed at the end of the suite

### Multi-Client Testing

For testing features that require multiple users:

- Use `Launch Second Client` to start a second browser session
- Switch between clients using `Switch To Client`
- Test real-time updates and interactions between users

### Page Objects Overview

Each page object has:
- **Variables**: Locators for all elements on the page
- **Keywords**: Actions that can be performed on the page

## Test Suites

### Login Tests
Validates authentication functionality.

### Spaces Tests
Tests space management features:
- Viewing spaces
- Creating new spaces
- Navigating between spaces

### Projects Tests
Tests project management features:
- Creating projects
- Accessing projects
- Project settings

### Sessions Tests
Tests session functionality:
- Viewing sessions
- Adding comments
- Real-time updates

### Multi-Client Tests
Tests interactions between multiple users:
- Comment synchronization
- Real-time updates

## Contributing

To add new tests:
1. Use the existing page objects
2. Add new locators to the appropriate page resource file if needed
3. Create clear test case descriptions
4. Follow the existing patterns for setup and teardown

## Troubleshooting

### Common Issues

- **Element not found**: Check if the xpath/selector is correct or if the element is inside an iframe
- **Environment variables not loading**: Ensure you've run the appropriate script for your OS
- **Browser issues**: Check Firefox version compatibility (or other browsers if used)

## Best Practices

- Use descriptive test names
- Keep test cases focused on one functionality
- Use appropriate waits instead of fixed sleeps when possible
- Add comments for complex operations

## Hope this helps you get things started!