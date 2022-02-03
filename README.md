
# Desafio Finxi 

Este Desafio consiste em 3 Tarefas onde o objetivo e criar um cluter Kubenetes, contendo a aplicação Java em conteiner Docker.
 


## Descrição das Tarefas

- Tarefa 1 : criação da imagem Docker contendo a aplicação Java / criaçãodo do deploy desta imagem no Kubernetes.

- Tarefa 2 : Criação de Cronjob com o healcheck da aplicação 

- Tarefa 3 : Criação de monitamento do cluster utilizando a ferramenta prometheus e exportando os dados para o Grafana



## Requisitos:

Configuração minima para Rodar o Minikube:
```bash
4 Núcleos de CPU
4 GB RAM
```
Desabilitando a Swapp do host:
```bash
 swapoff  -a
```
Componentes instalados:    
```bash
versão mais recente do docker
curl -fsSL https://get.docker.com | bash

Instalação do mikube:
curl -LO https://storage.googleapis.com/minikube/releases/lastest;minikube-linux-adm64

Concedendo permissão de execução ao minikube:
chmod +x minikube-linux-adm64

Instalando o mikube no PATH do host:
install minikube-linux-amd64 /usr/local/bin/minikube

Ajustando o grupo Dokcker para a subinda do minikube:
usermod -aG docker $USER && newgrp docker

Inicializando o minikube:
minikube start

Instalado o Kubeclt:
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

Adicionandoo o auto-complete do Kubeclt:
source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc

```
## Cloud:

Realizada a subida da infra na Cloud AWS com o terraform:
```bash
git clone https://github.com/thiagoclessa/Desafio_finxi.git
cd Desafio_finxi/Tarefa_1/cloud/terraform/
terraform init
terraform plan 
terraform apply
```
## Tarefa 1:

Realizada a configuração do dockerfile:
```bash
Realizando o build e subindo a imagem para o dockerhub:
cd Desafio_finxi/Tarefa_1/Docker/
docker build -t thiagolessa/ipaas:lastest .
docker push thiagolessa/ipaas:lastest
```
Realizando a subida do pod e dos serviços da aplicação para o Kubernetes:
```bash
cd Desafio_finxi/Tarefa_1/
kubectl create namespace aplicacao
kubectl create -f Ipaas/ --namespace=aplicacao
```
Documentação oficial do Kubernetes:
https://kubernetes.io/pt-br/

## Tarefa 2:

Subindo a Cron de execução de 3 em 3 minutos para o Kubenets no projeto aplicacao
```bash
cd Desafio_finxi/Tarefa_2/
kubectl create -f CronJob/ 
```

## Tarefa 3:

Configurando o monitoramento:

```bash
cd Desafio_finxi/Tarefa_3/
kubectl create namespace monitoramento
kubectl create -f k8s-k8s-prometheus/ --namespace=monitoramento
kubectl create -f kube-state-metrics/ --namespace=monitoramento
kubectl create -f k8s-grafana/ --namespace=monitoramento
```
As configurações do grafana podem ser realizada baixando o template de monitoramento conforme a documentação offical

https://prometheus.io/docs/visualization/grafana/

## Custos para manter o projeto:

Apos analise de caculos realizados atraves do https://calculator.aws/ 

O melhor custo beneficio foi o de utilizar a solução AWS (EKS)
Pois o serviço se torna auto-gerencial e escalavel:
Configuração desse projeto:

```bash
01 EKS Cluster
02 Instância type t2.small
01 Load Balancer 
```

Custo inicial:
0,00 USD

Custo mensal:
105,28 USD

Custo total por 12 meses:
1.263.36 USD


![Logo](https://github.com/thiagoclessa/Desafio_finxi/blob/main/Cluster_EKS.PNG)

