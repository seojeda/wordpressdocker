# Instalacion WordPress Docker

## Instalacion Docker - Amazon Linux

**Instalación Docker:**

```  
sudo amazon-linux-extras install docker
```

**Inicio del servicio de Docker:**

```  
sudo service docker start
```

**Agrega tu usuario actual al grupo "docker"**

```  
sudo usermod -aG docker $USER
```

**Verificación de la instalación de Docker**


```  
docker version
```



## Instalación GitHub - Amazon Linux

**Instalación Git:**

```  
sudo yum install git -y
```

**Verificación de Instalación:**

```  
git --version
```

**Crea un nuevo repositorio Git en el directorio actual**

```  
git init
```

