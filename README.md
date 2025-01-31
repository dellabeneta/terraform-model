# Terraform Multi-Environment Base

Este projeto serve como um modelo base para iniciar projetos Terraform com múltiplos ambientes (dev, staging, prod) sem utilizar módulos, mantendo uma estrutura simples e direta.

## Estrutura do Projeto

```
della@ubuntu:~/projetos/terraform-model$ tree 
.
├── backend.tf
├── credentials.auto.tfvars
├── credentials.auto.tfvars.example
├── droplet.tf
├── env
│   ├── dev.tfvars
│   ├── prd.tfvars
│   └── stg.tfvars
├── firewall.tf
├── keypair.tf
├── outputs.tf
├── providers.tf
├── README.md
├── variables.tf
└── vpc.tf

2 directories, 14 files
```

## Características

- **Múltiplos Ambientes**: Utiliza Terraform Workspaces para gerenciar diferentes ambientes
- **State Remoto**: Armazenamento do state no S3 com locking via DynamoDB
- **Configuração por Ambiente**: Cada ambiente tem suas próprias configurações via arquivos .tfvars
- **Escalabilidade**: Suporte a diferentes quantidades de recursos por ambiente
  - Dev: 1 Droplet
  - Staging: 2 Droplets
  - Produção: 4 Droplets

## Pré-requisitos

- Terraform >= 1.0
- Conta na DigitalOcean
- Bucket S3 para armazenar o state (AWS)
- Tabela DynamoDB para state locking (AWS)

## Como Usar

1. Clone este repositório
2. Configure suas credenciais:
   ```bash
   cp credentials.auto.tfvars.example credentials.auto.tfvars
   # Edite credentials.auto.tfvars com suas credenciais
   ```

3. Inicialize o Terraform:
   ```bash
   terraform init
   ```

4. Selecione o workspace desejado:
   ```bash
   terraform workspace select dev|stg|prd
   # ou crie um novo: terraform workspace new dev|stg|prd
   ```

5. Aplique a configuração:
   ```bash
   terraform plan -var-file=env/dev.tfvars
   terraform apply -var-file=env/dev.tfvars
   ```

## Ambientes

### Desenvolvimento (dev)
- 1 Droplet (s-2vcpu-2gb)
- Região: NYC1
- VPC dedicada

### Staging (stg)
- 2 Droplets (s-2vcpu-2gb)
- Região: NYC3
- VPC dedicada

### Produção (prd)
- 4 Droplets (s-4vcpu-8gb)
- Região: SFO2
- VPC dedicada

## Segurança

- Firewalls configurados por ambiente
- States isolados por ambiente
- Credenciais não versionadas
- State locking para prevenir conflitos

## Contribuindo

1. Faça um fork do projeto
2. Crie sua feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## Notas

- Este projeto não utiliza módulos Terraform intencionalmente para manter a simplicidade
- Cada ambiente é completamente isolado através de workspaces
- Os recursos são tagueados automaticamente por ambiente
