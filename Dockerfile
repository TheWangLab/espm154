# Use the official Miniconda3 base image
FROM continuumio/miniconda3

# Set the working directory in the container
WORKDIR /workspace

# Add the conda-forge channel and install dependencies
RUN conda config --add channels conda-forge \
    && conda install -y msprime geopandas rasterio bitarray \
    && pip install geonomics \
    && conda clean -a -y

# Install Jupyter Notebook
RUN conda install -y notebook \
    && conda clean -a -y

# Expose the Jupyter Notebook port
EXPOSE 8888

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
