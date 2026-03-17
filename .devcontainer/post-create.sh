#!/bin/bash
set -e

cd /workspace

# Clonar Odoo Enterprise (shallow clone, solo rama 19.0)
if [ ! -d "/workspace/enterprise.19.0" ]; then
    echo "==> Cloning Odoo Enterprise (branch 19.0, shallow)..."
    git clone --depth 1 --branch 19.0 https://github.com/odoo/enterprise.git /workspace/enterprise.19.0
else
    echo "==> Odoo Enterprise already present, skipping clone."
fi

echo "==> Syncing Python dependencies (uv sync)..."
uv sync

echo "==> Setup complete! Start Odoo with:"
echo "    python odoo.19.0/odoo-bin -c odoo.conf"
