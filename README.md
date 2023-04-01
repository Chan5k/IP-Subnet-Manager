# IP-Subnet-Manager

IP-Subnet-Manager is a Linux-based command-line tool that simplifies the process of adding and managing IP addresses within /24 subnets. This script automates IP address configuration, making it easy to handle large-scale deployments and network administration tasks.

## Features

- Validates input IP addresses
- Adds IP addresses within the specified /24 subnet
- Provides feedback on the success or failure of each operation
- Compatible with most Linux distributions

## Prerequisites

- Linux operating system with a configured network interface
- `ip` command available on the system (usually part of the `iproute2` package)
- sudo privileges for the user running the script

## Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/IP-Subnet-Manager.git
```

2. Navigate to the project folder:

```bash 
cd IP-Subnet-Manager
```
3. Make the script executable:

```bash
chmod +x add_subnet_ips.sh
```

## Usage

1. Prepare a text file containing a list of IP addresses, one per line.
2. Run the script:

```bash
./add_subnet_ips.sh
```
3. When prompted, enter the path to the IP list file.
4. The script will loop through the IP addresses, validate them, and add the corresponding /24 subnet to the system.
5. If the process is successful, the script will output a confirmation message.

## Contributing

Contributions are welcome! If you'd like to contribute, please fork the repository and make your changes. Then submit a pull request with a detailed description of your proposed changes.

## License

This project is licensed under the MIT License.