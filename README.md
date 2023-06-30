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


# 
