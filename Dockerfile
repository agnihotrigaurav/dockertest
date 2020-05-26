FROM ubuntu

RUN apt-get update && apt-get -y install curl && apt-get -y install zip && apt-get  -y install unzip
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN apt-get install -y jo
RUN apt-get install -y certbot
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.10.0/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
ADD run.sh .
RUN ls -ltr
RUN chmod 777 run.sh
CMD ./run.sh
