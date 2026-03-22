#!/usr/bin/env bash
# Verify the systemd heredoc in install.sh matches the canonical systemd/sznuper.service file.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

CANONICAL="$REPO_DIR/systemd/sznuper.service"
INSTALL_SH="$REPO_DIR/install.sh"

# Extract heredoc between "cat > ... <<'EOF'" and "EOF"
INLINE=$(sed -n "/cat >.*<<'EOF'$/,/^EOF$/{ /cat >.*<<'EOF'$/d; /^EOF$/d; p; }" "$INSTALL_SH")

if diff -u "$CANONICAL" <(printf '%s\n' "$INLINE") >/dev/null 2>&1; then
    echo "OK: install.sh heredoc matches systemd/sznuper.service"
else
    echo "FAIL: install.sh heredoc does not match systemd/sznuper.service"
    echo ""
    diff -u "$CANONICAL" <(printf '%s\n' "$INLINE") || true
    exit 1
fi
