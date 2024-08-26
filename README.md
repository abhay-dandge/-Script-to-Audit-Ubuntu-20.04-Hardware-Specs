 Bash script that gathers the specified hardware details about an Ubuntu 20.04 system. This script will collect information such as uptime, timezone, OS details, CPU information, network addresses, and RAM utilization. After collecting the details, the script will save them into a file named hardware_report_DD_MM_YY.txt where DD_MM_YY represents the execution date.

 Script Explanation

    Date and File Naming: The script uses the date command to generate the current date in the format DD_MM_YY and uses this date to name the output file.

    Gathering Information: Each variable captures specific system details using standard Linux commands:
        uptime -p provides the system's uptime in a human-readable format.
        timedatectl fetches the current server's local timezone.
        uname -o gives the OS family.
        lsb_release -r and lsb_release -d fetch OS version and name.
        uname -r provides the kernel version.
        nproc returns the number of CPU cores.
        uname -m gives the CPU architecture.
        hostname -I fetches the private IP address (the first IP is assumed to be the main one).
        curl -s ifconfig.me gets the public IP address (make sure curl is installed).
        free -h gives the RAM utilization.

    Writing to File: The script writes all collected details into the hardware_report_DD_MM_YY.txt file.

    Completion Message: A message is displayed indicating where the report has been saved.

Usage

    Save the script as hardware_report.sh.
    Make the script executable:

    bash

chmod +x hardware_report.sh

Run the script:

bash

    ./hardware_report.sh

Notes

    Ensure curl is installed on the system to fetch the public IP. If it's not installed, you can install it using:

    bash

sudo apt-get install curl

This script is tailored for Ubuntu 20.04 but should be compatible with other Ubuntu versions with minor modifications if necessary.

The script captures system information at the moment it runs. It's useful for quick snapshots of system status or periodic monitoring by adding it to a cron job.
