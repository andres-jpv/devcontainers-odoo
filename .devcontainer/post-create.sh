#!/bin/bash
set -e

echo "==> Syncing Python dependencies (uv sync)..."
cd /workspace
uv sync

echo "==> Setup complete! Start Odoo with:"
echo "    python odoo.18.0/odoo-bin -c odoo.conf"
