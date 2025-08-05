#!/bin/bash

# Setup Serena MCP server
echo "Setting up Serena MCP server..."

# Navigate to serena-env directory
cd /workspace/.mcp/serena-env

# Create pyenv virtual environment for serena
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv virtualenv 3.11.13 serena-env
pyenv activate serena-env

# Upgrade pip and install uv
pip install --upgrade pip uv

# Clone serena repository (clean install)
rm -rf serena
git clone https://github.com/oraios/serena.git
cd serena

# Make start script executable
chmod +x /workspace/.mcp/start-serena.sh

echo "Serena MCP server setup completed!"
echo ""
echo "Claude Code 로그인후 MCP 서버 등록을 위해 다음 명령어를 실행하세요:"
echo "   claude mcp add serena /workspace/.mcp/start-serena.sh"
echo ""