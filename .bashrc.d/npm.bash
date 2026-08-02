# Define the package directory
export NPM_PACKAGES="$HOME/.npm-packages"

# Update PATH to prioritize user-wide global binaries
export PATH="$NPM_PACKAGES/bin:$PATH"

# Allow Node.js to locate the modules
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
