# Odoo 18 Devcontainers

[![Watch the video](https://github.com/mjavint/devcontainers-odoo/blob/main/img/miniatura.png?raw=true)](https://youtu.be/I4vswyVg2K0)

## Instalación y Configuración

1. Clonar el repositorio

```bash
git clone https://github.com/mjavint/devcontainers-odoo
```

2. Configurar entorno virtual de python

```bash
# Entrar al proyecto
cd devcontainers-odoo
# Sncronizar el proyecto
uv sync
# Activar el entorno
source .venv/bin/activate
```

3. Instalar dependencias de odoo

```bash
uv pip install -r odoo.18.0/requirements.txt
```

4. Crear el role `odoo` en la base de datos.

> **Nota:** El archivo `init-db.sql` crea el role automáticamente al iniciar el contenedor de PostgreSQL por primera vez. Si necesitas crearlo manualmente, usa uno de los siguientes métodos:

**Desde la terminal del host (fuera del devcontainer):**

```bash
docker exec -it pgdb18 psql -U postgres -c "CREATE ROLE odoo WITH LOGIN PASSWORD 'odoo' CREATEDB;"
```

**Desde la terminal del devcontainer:**

```bash
psql -h pgdb -U postgres -c "CREATE ROLE odoo WITH LOGIN PASSWORD 'odoo' CREATEDB;"
```

Cuando se solicite la contraseña de `postgres`, ingresa: `admin`

**Verificar que el role fue creado:**

```bash
docker exec -it pgdb18 psql -U postgres -c "\du odoo"
```

También puedes usar el servicio `pgadmin` disponible en `http://localhost:8185` (usuario: `admin@example.com`, contraseña: `admin`).

5. Iniciar el servidor de odoo

```bash
python odoo.18.0/odoo-bin -c odoo.conf
```

## Debugging

El proyecto viene preconfigurado con `debugpy` y `pydevd-odoo` para depurar Odoo desde VS Code.

### Opción 1: Lanzar con F5 (Recomendado)

1. Abre el devcontainer en VS Code
2. Selecciona la configuración **"Odoo: Launch"** en el panel de Debug (Ctrl+Shift+D)
3. Presiona **F5** para iniciar Odoo en modo debug
4. Coloca breakpoints en cualquier archivo `.py` y se detendrá automáticamente

### Opción 2: Attach a un proceso existente

Si prefieres lanzar Odoo manualmente con debugpy y luego conectarte:

```bash
python -m debugpy --listen 0.0.0.0:5678 --wait-for-client odoo.18.0/odoo-bin -c odoo.conf
```

Luego selecciona **"Odoo: Attach"** en el panel de Debug y presiona **F5**.

> **Nota:** `odoo.conf` ya está configurado con `workers = 0` y `limit_time_real = 0`, lo cual es necesario para que el debugging funcione correctamente.

## Enlaces útiles

- [Docker Desktop](https://docs.docker.com/get-started/get-docker/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Ultraviolet (UV) y Ruff](https://docs.astral.sh/)
- [Devcontainers](https://containers.dev)
