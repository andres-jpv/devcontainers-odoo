#!/bin/bash
set -e

cd /workspace

# Clonar Odoo Enterprise (shallow clone, solo rama 18.0)
if [ ! -d "/workspace/enterprise.18.0" ]; then
    echo "==> Cloning Odoo Enterprise (branch 18.0, shallow)..."
    git clone --depth 1 --branch 18.0 https://github.com/odoo/enterprise.git /workspace/enterprise.18.0
else
    echo "==> Odoo Enterprise already present, skipping clone."
fi

echo "==> Syncing Python dependencies (uv sync)..."
uv sync

echo "==> Setup complete! Start Odoo with:"
echo "    python odoo.18.0/odoo-bin -c odoo.conf"
