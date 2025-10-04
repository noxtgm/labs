# Colors
NC='\033[0m'
RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Convenience functions
info() { 
    log_info "$1" 
}

success() { 
    log_success "$1" 
}

warning() { 
    log_warning "$1" 
}

error() { 
    log_error "$1" 
}

# Run install script with logging
run_logged() {
    local script="$1"

    export CURRENT_SCRIPT="$script"

    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Starting: $script" >>"$REPO_INSTALL_LOG_FILE"

    # Use bash -c to create a clean subshell
    bash -c "source '$script'" </dev/null >>"$REPO_INSTALL_LOG_FILE" 2>&1
    
    local exit_code=$?

    if [ $exit_code -eq 0 ]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Completed: $script" >>"$REPO_INSTALL_LOG_FILE"
        unset CURRENT_SCRIPT
    else
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Failed: $script (exit code: $exit_code)" >>"$REPO_INSTALL_LOG_FILE"
    fi

    return $exit_code
}
