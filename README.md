# Atividade avaliativa de 2026.2 - Sistemas Operacionais - Introdução a Docker

## Informações gerais

- **Público alvo**: alunos da disciplina de **Sistemas Operacionais** do curso de [TADS](https://diatinf.ifrn.edu.br/cursos/tecnologia-em-analise-e-desenvolvimento-de-sistemas/) na [DIATINF](https://diatinf.ifrn.edu.br/) no [CNAT-IFRN](https://portal.ifrn.edu.br/campus/natalcentral/)
- **Professor**: [L A Minora](https://github.com/leonardo-minora/)
- **Aluna**: [Maria Clara Batista Viana Silva](https://github.com/vianabatista04) 
- **Objetivo**:
  1. Praticar criar uma imagem e contêineres com Docker

---
## Lista de tarefas - Sumário
1. Validar a instalação do Docker com o "Olá, Mundo"
2. Criar e nomear uma imagem leve a partir de Fedora
3. Criar e explorar um contêiner interativo com bash
4. Instalar ferramentas de desenvolvimento no contêiner
5. Comparar contêineres diferentes e verificar o efeito das alterações em tempo de execução
6. Diferenciar `docker create` e `docker run` e observar o impacto de instalar pacotes no contêiner
7. Atualizar o Dockerfile com os pacotes instalados e reinicializar a imagem

---
## Lista de tarefas - Descrição

### 1. Testar a instalação do Docker com o "Olá, Mundo"
Resumo: Verificar se o Docker está corretamente instalado e funcionando no ambiente antes de iniciar os exercícios.

Exemplo de comandos:
```bash
docker --version
docker info
docker run hello-world
```

Breve descrição dos comandos:
- `docker --version`: mostra a versão do Docker instalada.
- `docker info`: exibe informações do daemon e do ambiente Docker.
- `docker run hello-world`: baixa a imagem de teste e executa um contêiner simples para confirmar que o Docker está funcionando.

**atenção**:
1. faça printscreen e coloque no seu repositório na pasta `resultados` como `tarefa-1.png` ou `tarefa-1.jpg`.

### 2. Criar e nomear uma nova imagem a partir da imagem Fedora com menos recursos
Resumo: Criar uma imagem base mais leve e nomeada para servir de ambiente de estudo, comparando a lista de imagens antes e depois.

Exemplo de comandos:
```bash
docker images
docker pull fedora
docker build -t fedora-menor:latest .
docker images
```

Breve descrição dos comandos:
- `docker images`: lista as imagens locais antes da criação.
- `docker pull fedora`: baixa a imagem oficial do Fedora.
- `docker build -t fedora-menor:latest .`: constrói uma nova imagem a partir do Dockerfile, com nome e tag personalizados.
- `docker images`: mostra novamente a lista após a criação para verificar a nova imagem.

**atenção**:
1. faça printscreen e coloque no seu repositório na pasta `resultados` como `tarefa-2.png` ou `tarefa-2.jpg`.

### 3. Criar 1 contêiner a partir da nova imagem e executar o bash em modo interativo com `docker run`
Resumo: Iniciar um contêiner com a nova imagem e observar o usuário e o nome da máquina antes e depois da execução.

Exemplo de comandos:
```bash
whoami
hostname

docker run -it --name cont1 fedora-menor:latest /bin/bash

whoami
hostname
```

Breve descrição dos comandos:
- `whoami`: mostra o usuário atual no host.
- `hostname`: exibe o nome da máquina do host.
- `docker run -it --name cont1 fedora-menor:latest /bin/bash`: cria e inicia um contêiner interativo com o nome `cont1`, usando o bash.
- `whoami` e `hostname` dentro do contêiner: mostram o usuário e o nome da máquina do ambiente do contêiner.

**atenção**:
1. faça printscreen e coloque no seu repositório na pasta `resultados` como `tarefa-3.png` ou `tarefa-3.jpg`.

### 4. Instalar pacotes do fish e dos essenciais para desenvolvimento em Python e GCC
Resumo: Alterar o ambiente do contêiner em execução, instalar ferramentas úteis e verificar versões relevantes, depois sair do contêiner.

Exemplo de comandos:
```bash
dnf update -y
dnf install -y fish python3 gcc
gcc --version
python3 --version
fish --version
exit
```

Breve descrição dos comandos:
- `dnf update -y`: atualiza os pacotes do sistema.
- `dnf install -y fish python3 gcc`: instala o shell `fish`, o Python 3 e o compilador GCC.
- `gcc --version`: verifica a versão do compilador GCC.
- `python3 --version`: verifica a versão do Python 3.
- `fish --version`: confirma que o shell fish foi instalado.
- `exit`: sai do contêiner interativo.

**atenção**:
1. faça printscreen e coloque no seu repositório na pasta `resultados` como `tarefa-4.png` ou `tarefa-4.jpg`.

### 5. Executar novamente `docker run`, verificar usuário e nome da máquina e tentar executar `fish`
Resumo: Demonstrar que cada contêiner é uma instância isolada e que alterações feitas em um contêiner não persistem em outro.

Exemplo de comandos:
```bash
docker run -it --name cont2 fedora-menor:latest /bin/bash
whoami
hostname
fish
exit
```

Breve descrição dos comandos:
- `docker run -it --name cont2 fedora-menor:latest /bin/bash`: inicia um novo contêiner a partir da mesma imagem.
- `whoami` e `hostname`: mostram o usuário e o nome do sistema do novo contêiner.
- `fish`: tenta iniciar o shell fish; se ele não estiver instalado na imagem, isso demonstra que o contêiner anterior foi modificado apenas naquele ambiente.
- `exit`: encerra o contêiner.

**atenção**:
1. faça printscreen e coloque no seu repositório na pasta `resultados` como `tarefa-5.png` ou `tarefa-5.jpg`.

### 6. Listar os contêineres criados e usar `docker create` para comparar com `docker run`
Resumo: Entender a diferença entre criar um contêiner e iniciar um contêiner, além de observar que as alterações feitas em um contêiner não são refletidas na imagem.

Exemplo de comandos:
```bash
docker ps -a
docker create --name cont3 fedora-menor:latest /bin/bash
docker start -ai cont3
fish
exit
```

Breve descrição dos comandos:
- `docker ps -a`: lista todos os contêineres criados, ativos ou não.
- `docker create --name cont3 fedora-menor:latest /bin/bash`: cria um contêiner em estado parado, sem executá-lo imediatamente.
- `docker start -ai cont3`: inicia o contêiner em modo interativo.
- `fish`: tenta executar o shell fish; como ele foi instalado apenas no contêiner anterior, esse teste ajuda a explicar a diferença entre modificar um contêiner e preparar uma imagem.
- `exit`: encerra o contêiner interativo.

**atenção**:
1. faça printscreen e coloque no seu repositório na pasta `resultados` como `tarefa-6.png` ou `tarefa-6.jpg`.

### 7. Atualizar o Dockerfile com os pacotes instalados e recriar a imagem
Resumo: Registrar as alterações na imagem para que novas instâncias venham já configuradas com os pacotes necessários e com o shell `fish` como comando padrão.

Exemplo de comandos:
```bash
cat > Dockerfile <<'EOF'
FROM fedora:latest
RUN dnf update -y && dnf install -y fish python3 gcc
CMD ["/usr/bin/fish"]
EOF

docker build -t fedora-menor:latest .
docker run -it --name cont-final fedora-menor:latest
```

Breve descrição dos comandos:
- `cat > Dockerfile ...`: atualiza o arquivo Dockerfile com as instruções da nova imagem.
- `FROM fedora:latest`: define a imagem base.
- `RUN dnf update -y && dnf install -y fish python3 gcc`: instala os pacotes necessários na imagem durante o build.
- `CMD ["/usr/bin/fish"]`: define o comando inicial da imagem para abrir o shell fish ao iniciar o contêiner.
- `docker build -t fedora-menor:latest .`: recompila a imagem com as mudanças.
- `docker run -it --name cont-final fedora-menor:latest`: cria e executa um novo contêiner já preparado com os pacotes instalados e o shell configurado.

**atenção**:
1. faça printscreen e coloque no seu repositório na pasta `resultados` como `tarefa-7.png` ou `tarefa-7.jpg`.

---
