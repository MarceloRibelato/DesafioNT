# Projeto Frame Web Yaman

Projeto teste para apresentação da POC

## 🚀 Começando

Essas instruções permitirão que você obtenha uma cópia do projeto em operação na sua máquina local para fins de desenvolvimento e teste

## 📋 Pré-requisitos

Quais ferramentas você precisa para executar os testes?

* [Python](https://www.python.org/downloads/)
* [Robot Framework](https://robotframework.org/)
* [Chromedriver](https://chromedriver.chromium.org/downloads/)


## 🔧 Instalação

Para executar os testes em sua máquina local, será necessário clonar o projeto com o seguinte comando:

```
$ git clone https://github.com/MarceloRibelato/robot-web.git
```


Após abrir a pasta do projeto através de sua IDE, vamos instalar as bibliotecas necessárias com o comando:


```
$ pip install -r requirements.txt
```

Também será necessário fazer o download do [Chromedriver](https://chromedriver.chromium.org/downloads/) de acordo com a versão atual do seu navegador Chrome.

Após o download, você deve copiar o arquivo chromedriver.exe

E colar na pasta onde foi instalado o Python.
```
ex: C:\Program Files\Python\Python310
```


Ou colar o arquivo chromedriver.exe na pasta raiz do projeto
```
ex: C:\Users\SeuUsuario\Documentos\anima\projeto-anima
```



## ⚙️ Executando os testes

Após instalar as bibliotecas e configurar o local do chromedriver, nossos testes já podem ser executados utilizando o comando:


```
$ robot features/GestaoOfertas.robot 
```


ou


```
$ python -m robot features/GestaoOfertas.robot 
```

Obs: Se você quiser executar os testes em modo gráfico, será necessário fazer uma alteração no arquivo GestaoOfertasSteps.robot

├── Projeto anima -> Web -> steps -> GestaoOfertasSteps.robot

Na linha 9, você deverá apagar o parâmetro "${CHROME_OPTIONS_HEADLESS}"

Obs: não esquecer de apagar o símbolo ";" que vem antes da variável.



## 🔩 Configurações de execução

Caso queira criar um diretório para os arquivos de report, e melhorar a organização dos arquivos basta passar o parâmetro "-d ./log"

Onde "log" será o nome do diretório.


```
$ robot -d ./log features/GestaoOfertas.robot
```


ou


```
$ python -m robot -d ./log features/GestaoOfertas.robot 
```


Para executar um cenário específico, usamos o parâmetro "-i" e na sequência passamos a tag referente ao cenário


```
$ robot -d ./log -i ct-003 features/GestaoOfertas.robot 
```

## 📄 Instalação Allure Report 


Quais ferramentas você precisa para instalar o Allure Report?

* [Java](https://www.oracle.com/br/java/technologies/downloads/)


Visando apresentar um relatório mais organizado e com um design melhor do que o padrão gerado pelo Robot Framework

Podemos utilizar o Allure Report, uma ferramenta INCRÍVEL que traz uma série de métricas sobre os nossos testes

Para isso, vamos abrir o Windows PowerShell e executar os comandos:

```
$ Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

```
$ irm get.scoop.sh | iex
```

```
$ scoop install allure
```


Com o Allure instalado, basta passar o parâmetro "--listener allure_robotframework" na hora de executar os testes.

```
ex: $ robot --listener allure_robotframework Web/features/GestaoOfertas.robot
```

ou

Para executar um cenário específico:

```
ex: $ robot --listener allure_robotframework -i ct-002 features/GestaoOfertas.robot
```

Após a execução será criado um novo diretório chamado "output", onde estarão os arquivos gerados pelo Allure durante a execução


E para gerar o relatório Allure será necessário executar o comando:

```
$ allure generate /output/allure --clean output/allure  
```
ou

```
$ allure generate output/allure --clean output/allure  
```

*O comando "--clean" irá limpar dados gerados por execuções anteriores na pasta "output" gerada pelo Allure



## 🛠️ Construído com


* [Python](https://www.python.org/downloads/)
* [Robot Framework](https://robotframework.org/)
* BDD


## ✒️ Autores

* **Marcelo Ribelato** - *Estrutura de desenvolvimento* - [MarceloRibelato](https://github.com/MarceloRibelato)
* **Vinicius França** - *Modelagem dos cenários* - [ViniciusFranca](https://github.com/Vini-Franca)
