# ARM64V8 architecture 
FROM arm64v8/python:3.12-slim

# X86_64 architecture
# FROM python:3.12-slim

# Install required packages for AI/ML development
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    gfortran \
    python3-dev \
    libopenblas-dev \
    liblapack-dev \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    libglib2.0-0 \
    libgl1-mesa-glx \
    procps \
    screen \
    tmux \
    vim \
    nano \
    curl \
    sudo \
    git \
    wget \
    libbz2-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libffi-dev \
    libreadline-dev \
    libssl-dev \
    libsqlite3-dev \
    liblzma-dev \
    zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*

# Install Node.js (required for Claude Code and React frontend)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - \
    && apt-get install -y nodejs

# Set working directory
WORKDIR /workspace

# Copy requirements.txt and install dependencies
COPY requirements.txt /workspace/requirements.txt
RUN python -m pip install --upgrade pip \
  && python -m pip install --no-cache-dir -r requirements.txt


# Return to workspace root
WORKDIR /workspace

# Create non-root vscode user and switch
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME


# Create screen configuration file
RUN echo "startup_message off" > /etc/screenrc && \
    echo "hardstatus alwayslastline" >> /etc/screenrc && \
    echo "hardstatus string '%{= kG}[%{G}%H%{g}] %= %{= kw}%?%-Lw%?%{r}(%{W}%n*%f%t%{r})%{w}%?%+Lw%?%?%= %{g}[%{B}%m-%d %{W}%c%{g}]'" >> /etc/screenrc


# Change workspace directory ownership
RUN chown -R $USERNAME:$USERNAME /workspace

USER $USERNAME

# Install Claude Code CLI
RUN sudo npm install -g @anthropic-ai/claude-code

# Install Memory Bank MCP
RUN sudo mkdir -p /workspace/.mcp/memory-bank && \
    cd /workspace/.mcp/memory-bank && \
    sudo npm install @aakarsh-sasi/memory-bank-mcp && \
    sudo chown -R $USERNAME:$USERNAME /workspace/.mcp/memory-bank

# Install pyenv for Python version management
RUN curl https://pyenv.run | bash
ENV PATH="/home/vscode/.pyenv/bin:$PATH"
RUN echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> /home/vscode/.bashrc && \
    echo 'eval "$(pyenv init -)"' >> /home/vscode/.bashrc && \
    echo 'eval "$(pyenv virtualenv-init -)"' >> /home/vscode/.bashrc

# Install Python 3.11.13 via pyenv
RUN /home/vscode/.pyenv/bin/pyenv install 3.11.13


# Expose ports
EXPOSE 8000

CMD ["sleep", "infinity"]