# Odoo 19 Devcontainers

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
uv pip install -r odoo.19.0/requirements.txt
```

4. Crear el role `odoo` en la base de datos.

> **Nota:** El archivo `init-db.sql` crea el role automáticamente al iniciar el contenedor de PostgreSQL por primera vez. Si necesitas crearlo manualmente, usa uno de los siguientes métodos:

**Desde la terminal del host (fuera del devcontainer):**

```bash
docker exec -it pgdb psql -U postgres -c "CREATE ROLE odoo WITH LOGIN PASSWORD 'odoo' CREATEDB;"
```

**Desde la terminal del devcontainer:**

```bash
psql -h pgdb -U postgres -c "CREATE ROLE odoo WITH LOGIN PASSWORD 'odoo' CREATEDB;"
```

Cuando se solicite la contraseña de `postgres`, ingresa: `admin`

**Verificar que el role fue creado:**

```bash
docker exec -it pgdb psql -U postgres -c "\du odoo"
```

También puedes usar el servicio `pgadmin` disponible en `http://localhost:8085` (usuario: `admin@example.com`, contraseña: `admin`).

5. Iniciar el servidor de odoo

```bash
python odoo.19.0/odoo-bin -c odoo.conf
```

## Enlaces útiles

- [Docker Desktop](https://docs.docker.com/get-started/get-docker/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Ultraviolet (UV) y Ruff](https://docs.astral.sh/)
- [Devcontainers](https://containers.dev)
