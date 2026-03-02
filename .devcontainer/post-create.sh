#!/bin/bash
set -e

echo "==> Syncing Python dependencies (uv sync)..."
cd /workspace
uv sync

echo "==> Installing Odoo requirements..."
uv pip install -r /workspace/odoo.19.0/requirements.txt

echo "==> Setup complete! Start Odoo with:"
echo "    python odoo.19.0/odoo-bin -c odoo.conf"
