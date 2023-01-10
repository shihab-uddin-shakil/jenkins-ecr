FROM centos:7

RUN for user in shihab; do useradd $user; echo "1234" | passwd $user --stdin; done
RUN yum update -y && yum install mysql -y
