# Use the official miniconda base image
FROM continuumio/miniconda

# Set the working directory in the container
WORKDIR /workspace

# Add the conda-forge channel and install dependencies
RUN conda config --add channels conda-forge \
    && conda install -y numpy msprime geopandas rasterio matplotlib scipy bitarray tskit scikit-learn statsmodels psutil nlmpy \
    && pip install geonomics \
    && conda clean -a -y

# Install Jupyter Notebook if not already included
RUN conda install -y notebook \
    && conda clean -a -y

# Expose the Jupyter Notebook port
EXPOSE 8888

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

