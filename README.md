![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)
![Bash Script](https://img.shields.io/badge/bash_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)

# Objetivos
Criar uma VPC com com 2 sub-redes públicas e 2 privadas, configurar uma instância EC2 com o servidor web Nginx, criar uma página simples em html que será exibida dentro do servidor e criar um script que verifica a disponibilidade do site cada 1 minuto - caso a aplicação não esteja funcionando, o script envia uma notificação via Discord.

## Índice
- [Configuração do ambiente](#configuração-ambiente)
- [Configuração do servidor](#configuração-servidor)
- [Configuração do script](#configuração-script)

## Configuração do ambiente

### Criar a VPC
Para criar uma VPC acesse o Console de Gerenciamento da AWS > VPC > Your VPCs > Create VPC.
1. ![Passo 1 - Resources To Create](images/vpc-resources-to-create.png)
2. ![Passo 2 - Name Tag](images/vpc-name-tag.png)
3. ![Passo 3 - IPv4 CIDR Block](images/vpc-ipv4-cidr-block.png)
4. ![Passo 4 - IPv4 CIDR](images/vpc-ipv4-cidr.png)
> Deixe todas as outras opções como padrão

### Criar o Internet Gateway
No painel esquerdo, clique em Internet Gateways > Create internet gateway.

![Internet Gateway Name Tag](images/ig-name-tag.png)

Selecione o Internet Gateway criado > clique em Actions > Attach to VPC > selecione a VPC criada.

### Criar Sub-rede Pública

No painel esquerdo, clique em Subnets > Create subnet > selecione a VPC criada.
1. ![Passo 1 - Subnet Name](images/sbn-subnet-name.png)
2. ![Passo 2 - Availability Zone](images/sbn-availability-zone.png)
3. ![Passo 3 - IPv4 VPC CIDR Block](images/sbn-ipv4-vpc-cidr-block.png)
4. ![Passo 4 - IPv4 Subnet CIDR Block](images/sbn-ipv4-subnet-cidr-block.png)

> Repita o processo para criar a segunda sub-rede alterando apenas o IPv4 Subnet CIDR Block (ex. 10.0.**2**.0/24)

### Criar Sub-rede Privada

> Repita o processo anterior alterando apenas o nome da subrede (ex. subnet-**privada**-01)

### Criar Route Table Pública

## Configuração do servidor


## Configuração do script
