#!/usr/bin/env bash
set -euo pipefail
BASE_URL="https://gemaquecontabilidade.com.br"
mkdir -p release-public
fetch(){ local p="$1"; mkdir -p "release-public/$(dirname "$p")"; if [ ! -f "release-public/$p" ]; then echo "fetch $p"; curl --retry 3 --connect-timeout 20 -fsSL "$BASE_URL/$p?v=8314-source" -o "release-public/$p"; fi; }
fetch 'pagina-vendas.html'
fetch 'logo-gemaque.png'
fetch 'index.html'
fetch 'gemaque-simbolo.png'
fetch 'gemaque-identidade.jpg'
fetch 'examples/extrato-modelo.csv'
fetch 'assets/central-closing.js'
fetch 'assets/supabase-config.js'
fetch 'assets/accounting-core.js'
fetch 'assets/pgdas-reconciliation.js'
fetch 'assets/dashboard-core.js'
fetch 'assets/closing-core.js'
fetch 'assets/logo-gemaque.png'
fetch 'assets/accounting-pendencies.js'
fetch 'assets/bank-statement-core.js'
fetch 'assets/erp-studio.js'
fetch 'assets/bank-import.js'
fetch 'assets/gemaque-identidade.jpg'
fetch 'assets/vendor/supabase-2.49.1/LICENSE'
fetch 'assets/vendor/supabase-2.49.1/supabase.js'
fetch 'assets/vendor/supabase-2.49.1/591.supabase.js'
echo "Release V8.3.18 preparado: $(find release-public -type f | wc -l) arquivos"
