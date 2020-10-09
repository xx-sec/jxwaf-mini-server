FROM centos:7

MAINTAINER xx-zhang <actanble@gmail.com>
ENV LANG en_US.UTF-8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo && \
    sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo
RUN curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
RUN yum makecache

RUN yum install -y epel-release gcc make python-devel python-pip

WORKDIR /usr/src/app
VOLUME /usr/src/app
ADD ./requirements.txt /requirements.txt

#RUN yum -y install python3 python3-pip python3-devel
#RUN pip3 install --upgrade pip --index-url https://pypi.tuna.tsinghua.edu.cn/simple
#RUN pip3 install -r /requirements.txt --index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install -r /requirements.txt --index-url https://pypi.tuna.tsinghua.edu.cn/simple

USER root