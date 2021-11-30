## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Cloud Diagram](https://user-images.githubusercontent.com/88017838/143880280-f1fc662c-43c3-45de-b1ae-c048fdcfcfbb.png)


These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

 [ELK Playbook](https://github.com/eharvey92/Project-1-ELK-Stack/blob/main/Ansible/elk-playbook.yml)
 
 [Filebeat Playbook](https://github.com/eharvey92/Project-1-ELK-Stack/blob/main/Ansible/filebeat-playbook.yml)
 
 [Metricbeat Playbook](https://github.com/eharvey92/Project-1-ELK-Stack/blob/main/Ansible/metricbeat-playbook.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting traffic to the network.
The presence of a load balancer in this setup adds elasticity to the network by controlling the distribution of traffic evenly and adding a layer of redundancy in the instance that one server is compromised or becomes unavailable (as traffic would be redirected to the available server).

The advantage of using a Jump Box Provisioner is that it serves as a single heavily secured access point with the purpose of monitoring and logging and masks our virtual machines from being exposed to the public.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the files and system metrics.

- Filebeat collects, stores and organises log data efficiently, e.g. if an attacker attempts to modify the /etc/passwd file
- Metricbeat compiles data relating to system machine metrics, e.g. CPU

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.8   | Linux            |
| Web-1    | Server   | 10.0.0.9   | Linux            |
| Web-2    | Server   | 10.0.0.10  | Linux            |
| ELK-VM   | Logging  | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Private user IP

Machines within the network can only be accessed by SSH.
- The Jump Box machine with IP 10.0.0.8 can access the ELK VM

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | User IP address      |
| Web-1    | No                  | 10.0.0.8 via SSH     |
| Web-2    | No                  | 10.0.0.8 via SSH     |
| ELK-VM   | No                  | User IP, 10.0.0.8    |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it alleviates the need to manually update or configure each virtual machine since any modifications to the ansible playbook will automatically apply to all linked machines. Aside from saving time this also reduces the margin for errors which could occur if multiple changes had to be made across multiple virtual machines.

The playbook implements the following tasks:
- Installing Docker
- Installing Python3-pip
- Increasing virtual memory
- Downloads and installs ELK docker container running on ports 5601, 9200 and 5044

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Docker ps](https://user-images.githubusercontent.com/88017838/143980138-4d6531dd-637e-476e-8098-3aba235f8e39.PNG)


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1: 10.0.0.9
- Web-2: 10.0.0.10

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat gathers log files from processes, in this instance an example would be failed or successful SSH login attempts.
- Metricbeat gathers machine metrics from system data such as memory usage and uptime which is helpful in determining suspicious activity.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml file to /etc/ansible/install-elk.yml
- Update the hosts file to include the webserver IP addresses and ELK-VM IP address
- Run the playbook using ansible-playbook /etc/ansible/roles/install-elk.yml, and navigate to http://[ELK-VM IP address]:5601/app/kibana to check that the installation worked as expected. If working as expected, the below will show:

![kibana](https://user-images.githubusercontent.com/88017838/143980484-e64021d7-ab41-485f-bc7c-8ad45a14a091.PNG)
