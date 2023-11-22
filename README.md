# User Setup and SSH Permissions Script

This Bash script automates the process of setting up a new user on a Linux system, configuring SSH permissions, and adding the user to the sudoers file. It's a convenient way to streamline user management and enhance system security.

**Note:** Make sure to have the necessary permissions and dependencies set up before running this script.

## Prerequisites

Before using this script, ensure that:

1. You have root privileges to execute system-level commands.

## Usage

1. Clone this repository to your local machine or copy the script into a file on your Linux system.

2. Make the script executable:
   
   ```bash
   chmod +x user_setup.sh
   ```

3. Open the script (`user_setup.sh`) in a text editor and customize the following variables:

   - `username`: The desired username for the new user.
   - `password`: The desired password for the new user.

4. Save the script after making your customizations.

5. Run the script as the root user:

   ```bash
   sudo ./user_setup.sh
   ```

6. Follow the prompts, and the script will perform the following tasks:

   - Check if the script is being run with root privileges.
   - Create an SSH directory and set permissions.
   - Create SSH-related files with the correct permissions.
   - Check if the specified user already exists, and if not, create the user and set the password.
   - Add the user to the sudoers file if they are not already included.

7. The script will provide feedback at each step, indicating whether each task was successful or if any errors occurred.

## Donations

If you want to show your appreciation, you can donate via [Buy Me a Coffee](https://www.buymeacoffee.com/lalatendu.swain)

## Disclaimer

**Author**: Lalatendu Swain | [GitHub](https://github.com/Lalatenduswain) | [Website](https://blog.lalatendu.info/)

This script is provided as-is and may require modifications or updates based on your specific environment and requirements. Use it at your own risk. The authors of the script are not liable for any damages or issues caused by its usage.

## License

This script is provided under the [MIT License](LICENSE). You are free to modify and distribute it as needed.
```

You can use this README.md file in your GitHub repository to provide documentation and usage instructions for your script.
