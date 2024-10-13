# Terraform AWS VPC with Public and Private Subnets

This Terraform project creates an AWS infrastructure that includes:

- A Virtual Private Cloud (VPC)
- Two public subnets across different availability zones
- Two private subnets across different availability zones
- An Internet Gateway for public subnet internet access
- Routing configuration for communication inside the VPC and from the public subnets to the internet

## Prerequisites

Before using this Terraform code, ensure you have the following:

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS credentials configured on your machine (through `aws configure` or environment variables)

## Resources Created

### 1. VPC

- **CIDR block**: `10.0.0.0/16`

### 2. Public Subnets

- **Subnet 1**: `10.0.1.0/24` in Availability Zone `us-east-1a`
- **Subnet 2**: `10.0.2.0/24` in Availability Zone `us-east-1b`

### 3. Private Subnets

- **Subnet 1**: `10.0.3.0/24` in Availability Zone `us-east-1a`
- **Subnet 2**: `10.0.4.0/24` in Availability Zone `us-east-1b`

### 4. Internet Gateway

Enables public subnet instances to connect to the internet.

### 5. Route Tables

- **Public Route Table**: Routes external traffic (`0.0.0.0/0`) through the Internet Gateway
- **Private Route Table**: Only allows internal communication between private subnets

### 6. Security Groups

- **Public Security Group**: Allows inbound SSH (22), HTTP (80), and HTTPS (443) traffic and all outbound traffic
- **Private Security Group**: Allows internal communication within the VPC and all outbound traffic

## Usage

### Steps to Deploy

1. **Clone this repository**:

   ```bash
   git clone <repository_url>
   cd <repository_folder>
   ```

2. **Initialize Terraform**:
   Run the following command to initialize the working directory and download the necessary providers:

   ```bash
   terraform init
   ```

3. **Plan the Infrastructure**:
   You can preview the changes that will be applied by running:

   ```bash
   terraform plan
   ```

4. **Apply the Configuration**:
   Create the resources defined in the Terraform code:

   ```bash
   terraform apply
   ```

5. **Destroy the Resources (Optional)**:
   When you're done and no longer need the infrastructure, you can destroy the created resources:
   ```bash
   terraform destroy
   ```

## Variables

You can modify this project by introducing variables to make the code more flexible (for example, changing CIDR blocks, availability zones, etc.). Here's an example of how you can introduce variables:

```hcl
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  default = "10.0.1.0/24"
}

variable "availability_zone_1" {
  default = "us-east-1a"
}
```
