### 1. Description:
This is a depolyment guide developed by Chongzhi Xu(cx2273) and Xiaoran Yuan(xy2508) for a library management system project inspired by [mehmetpekdemir](https://github.com/mehmetpekdemir/Library-Management-System). We developed and deployed this web application using Spring Boot, every one can visit the main page for this app on this URL [http://3.141.43.205:8081/](http://3.141.43.205:8081/).

### 2. User Guide:
Visit the main page for this app on this URL [http://3.141.43.205:8081/](http://3.141.43.205:8081/)\

From the navigation bar, we can see there are 4 main micro-services: categories management, books management, publisher management and authors management. You can navigate to any of the services by clicking the navigation bar. All services have full add, delete, modify functions based on the users actions. The user interface are clean and interactive with good guidelines. The base functions are shown below:



### 3. Tech stack:
  - Spring Boot
  - Spring Data Jpa
  - AWS RDS Database
  - Docker
  - AWS EC2
  - Thymeleaf
  - Bootstrap4

### 4. Requirements

For building and running the application you need:
- [JDK 18](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
- [Maven 3](https://maven.apache.org)
- [Lombok](https://projectlombok.org)
- [Docker](https://www.docker.com)
- [AWS EC2/RDS](https://aws.amazon.com/aws/ec2)

### 5. Deploy this application on EC2 using Docker
(1) Java Environment Setup\
\
Visit JDK 18 releases page to download the latest archive.
```
  sudo yum install -y curl wget
  curl -O https://download.java.net/java/GA/jdk18/43f95e8614114aeaa8e8a5fcf20a682d/36/GPL/openjdk-18_linux-x64_bin.tar.gz
```
Extract downloaded file using tar command.
```
  tar xvf openjdk-18_linux-x64_bin.tar.gz
```
Move the resulting folder to /opt directory.
```
  sudo mv jdk-18 /opt/
```
Configure Java environment:
```
sudo tee /etc/profile.d/jdk18.sh <<EOF
export JAVA_HOME=/opt/jdk-18
export PATH=\$PATH:\$JAVA_HOME/bin
EOF
```
Source your profile file and check java command.
```
source /etc/profile.d/jdk18.sh
```
Confirm Java version.
```
$ echo $JAVA_HOME
/opt/jdk-18

$ java -version
java version "18" 2022-03-22
Java(TM) SE Runtime Environment (build 18+36-2087)
Java HotSpot(TM) 64-Bit Server VM (build 18+36-2087, mixed mode, sharing)
```

(2) Install Maven\
\
Following are the set of commands need to be executed sequentially to install maven.
```
sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
```
```
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
```
```
sudo yum install -y apache-maven
```
```
mvn –version
```
And you all set to run any “mvn” (maven) command in ec2 instance.

(3) Install Docker\

```
sudo yum update -y
```
```
sudo amazon-linux-extras install docker
```
```
sudo service docker start
```
```
sudo usermod -a -G docker ec2-user
```

(4) Copy this project to your EC2\

```
  sudo yum install git -y
```
```
  git clone https://github.com/ChongzhiXu/ELEN6770_Library_Management_System.git
```

(5) Build and run this project in docker

```
mvn clean install
```
```
docker build -t 6770-project . 
```
```
docker run -it -p 8081:8081 6770-project
```
  
(6) Port\
\
Add port 8081 from antwhere ipv4 inbound rules in security groups then this project will be presented in
```
  http://(Your Aws EC2 Public IPv4 address):8081
```

### 6. Now you can start enjoying using or trying to deploy this simple application.

### 7. About:
This is the final project for ELEN6770 course 2022 fall term, designed and developed by\
Chongzhi Xu, cx2273@columbia.edu,\
Xiaoran Yuan, xy2508@columbia.edu.\
If having questions, feel free to contact us. Thank you for reading.
