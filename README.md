# Implementación de WordPress en AWS utilizando contenedores

Se presenta a continuación una guía para la implementación de un sitio web en WordPress, utilizando los archivos de este repositorio en el entorno de Amazon Web Services (AWS). 

Para esta implementación se usan los siguientes servicios:

* Docker
* Github
* AWS ECR
* AWS ECS
* AWS Fargate
* EC2 - Balanceador de carga

---


## Instalacion Docker - Amazon Linux

**1. Instalación Docker:**

```  
sudo amazon-linux-extras install docker
```

**2. Inicio del servicio de Docker:**

```  
sudo service docker start
```

**3. Agrega tu usuario actual al grupo "docker"**

```  
sudo usermod -aG docker $USER
```

**4. Verificación de la instalación de Docker**


```  
docker version
```


---

## Instalación GitHub - Amazon Linux

**1. Instalación Git:**

```  
sudo yum install git -y
```

**2. Verificación de Instalación:**

```  
git --version
```

**3. Crea un nuevo repositorio Git en el directorio actual**

```  
git init
```

---


## Descarga de repositorio

**Dentro de nuestro entorno, usamos el siguiente comando:**

```  
git clone https://github.com/seojeda/wordpressdocker.git
```

**Creación de imagen docker**

```  
docker build -t nombrecontenedor .
```

**Lanzamiento docker (TEST)**

Con esto, podrás ver el entorno Wordpress funcionando.

```  
docker run -d -p 80:80 nombrecontedor:latest
```


## Trabajar en entorno AWS

### Instalación de AWS CLI

Descargamos el paquete "awscliv2", para poder ejecutar la AWS CLI desde nuestro entorno, lo que nos permite interactuar y administrar los servicios de Amazon Web Services desde nuestro sistema operativo.

Estos pasos deben realizarse desde la raiz de nuestro entorno.

**Descarga de paquete**


```  
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
```

**Descomprimir

```  
unzip awscliv2.zip
```

**Ejecutar**

```  
sudo ./aws/install

```


### Creación archivo Credenciales AWS

**Creamos la carpeta y luego el archivo de credenciales.**

```  
mkdir ~/.aws/
```

```  
vim ~/.aws/credentials
```

Dentro de nuestro archivo ~/.aws/credentials, debemos ingresar nuestras credenciales, que puedes obtener en el Cloud Access, de tu cuenta de AWS en AWS CLI.

### Subir imagen Docker

En este apartado subimos nuestra imagen docker a nuestro ECR, complementamos este comando con la URI que tenemos de nuestro ECR en AWS

```
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin "URI"
```

**Ejemplo:**


```
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 988173661302.dkr.ecr.us-east-1.amazonaws.com
```

**Tag**

```
docker tag "nombrecontenedor:tag" "URI"/"nombrerepositorioECR:tag"
```


**Subida**

```
docker push "URI"/"nombrerepositorioECR:tag"
```

# Configuración Servicios AWS


Ya que tenemos la imagen de docker en nuestro ECR para poder ser utilizada, debemos hacer que los servicios de AWS ECR, AWS Fargate y AWS ECS converjan para ver nuestro sitio Web de manera escalable.



## Recuerda:

**Balanceador de carga:**

* Recuerda tener tu balanceador de carga con el grupo de seguridad correspondiente asignado (Puerto 80 de entrada)
* Configurar correctamente el "Listener" que sera el target group del destino de ecs

**Amazon Elastic Container Service (ECS)**

* Crea el clúster correspondiente para poder ejecutar tareas.
* Configura la tarea para la creación del contenedor usando la imagen que tienes en el ECR.

# Ingreso a pagina web

Si tienes todo correctamente configurado, deberías poder ingresar a la pagina web, que contiene la imagen que anteriormente subiste a tu ECR.
Esto lo podrás hacer, copiando el DNS name de tu balanceador de carga

**Ejemplo:**

DNS name

Balanceador-docker-816375831.us-east-1.elb.amazonaws.com
