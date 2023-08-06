# Sudo Users Management Scripts

This repository contains three bash scripts used for managing sudo users on a Linux system. 

- `create_single_sudo_user.sh`: Creates a single user and grants the user full sudo access.
- `create_multiple_sudo_users.sh`: Creates multiple users and grants each user full sudo access.
- `check_sudo_access.sh`: Checks if a user has full sudo access.

## Getting Started

These instructions will help you run these scripts on your local machine.

### Prerequisites

- Bash shell (typically the default on most Linux distributions)
- `sudo` access on your machine to run the scripts

### Usage

Here are the detailed steps to run each script:

1. **Creating a Single User**

    Use the `create_single_sudo_user.sh` script to create a single user with full sudo access.

    ```bash
    sudo bash create_single_sudo_user.sh <username>
    ```

    Replace `<username>` with the username of the new account you want to create.

2. **Creating Multiple Users**

    Use the `create_multiple_sudo_users.sh` script to create multiple users with full sudo access.

    ```bash
    sudo bash create_multiple_sudo_users.sh <username1> <username2> ...
    ```

    Replace `<username1>`, `<username2>`, ... with the usernames of the new accounts you want to create.

3. **Checking User's Sudo Access**

    Use the `check_sudo_access.sh` script to check if a user has full sudo access.

    ```bash
    bash check_sudo_access.sh <username>
    ```

    Replace `<username>` with the username of the account you want to check.

## Author

- [Aftab Shaikh](https://github.com/iamaftabshaikh)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

---

