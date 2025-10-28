FROM zeahub/all:v0.0.4

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        dvipng \
        texlive-latex-extra \
        texlive-fonts-recommended \
        cm-super && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Copy requirements.txt into the container
COPY requirements.txt .

# Install all packages from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
