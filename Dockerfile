# Use the official Anaconda3 base image
FROM continuumio/anaconda3

# Set the working directory in the container
WORKDIR /workspace

# Install additional dependencies if needed
RUN conda install -y msprime geopandas rasterio bitarray \
    && pip install NLMpy \
    && pip install geonomics \
    && conda clean -a -y

# Install Jupyter Notebook if not already included
RUN conda install -y notebook \
    && conda clean -a -y

# Expose the Jupyter Notebook port
EXPOSE 8888

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
