# Protein-Interaction-with-LLMs

## Project Overview

### Goal
This project focuses on predicting protein–protein interactions (PPIs) using large language models (LLMs) and protein-specific language models (pLMs). The objective is to design a flexible, modular architecture that can incorporate multiple biological data channels and adapt to different core models. The ultimate aim is to determine the most effective combination of models and input channels for interaction prediction.

---

## Core Models
The following backbone models are being evaluated:

1. **ESM-2** – Evolutionary scale modeling trained on large protein sequence datasets, effective in capturing functional and structural properties.  
2. **LLaMA-3 (adapted)** – Adapted from a general-purpose LLM for biological sequence understanding.  
3. **ProtBERT** – A BERT variant specialized for protein sequences, leveraging deep transformer architectures.  
4. **BERT (baseline)** – A general NLP transformer model, included as a baseline to evaluate the benefits of protein-specific pretraining.  

---

## Input Channels
To account for the complex nature of PPIs, the architecture integrates several complementary data sources:

1. **Global Sequences** – Full protein sequences for candidate pairs.  
2. **Local Sequences** – Masked or filtered subsequences that highlight likely interaction regions.  
3. **FAISS-based Embedding Retrieval** – Efficient similarity search across large embedding spaces.  
4. **Annotated Datasets (UniProt)** – Rich protein metadata and annotations to improve biological context.  
5. **Structural Data (Cα Coordinates)** – 3D backbone positions incorporated to model structural constraints in interactions.  

---

## Datasets
Multiple datasets will be used to support training, validation, and benchmarking:

- **Target–Malaria Dataset (curated)** – Contains aligned pairs of human protein targets and Plasmodium falciparum homologs, enriched with ligand-binding information and Cα structural coordinates.  
- **UniProt** – Source of annotated protein sequences and metadata to provide biological context.  
- **PINDER Dataset** – A comprehensive benchmark dataset specifically designed for protein–protein interaction prediction. PINDER provides standardized, high-quality interaction pairs with curated labels, making it suitable for evaluating generalization and benchmarking against existing approaches.  
- **Structural Data (PDB, AlphaFold)** – Used to extract 3D coordinates, solvent accessibility (SASA), and structural alignment features.  

---

## Implementation Strategy

### Modular Design
- **Model Interface** – All core models follow a standardized interface for seamless integration.  
- **Channel Handlers** – Independent modules for each type of input (sequence, structural, annotation).  
- **Extensibility** – New channels or backbone models can be added with minimal changes to the pipeline.  

### Experimentation Framework
- **Metrics** – Accuracy, precision, recall, F1-score, and residue-level metrics.  
- **Validation** – Standardized data splits and evaluation methods across experiments.  
- **Experiment Tracking** – Logging and tracking of runs using MLflow or Weights & Biases to ensure reproducibility.  

### Scalability and Optimization
- **GPU Acceleration** – Multi-GPU training and distributed setups where applicable.  
- **Performance Optimization** – Mixed precision training, quantization, and parameter-efficient fine-tuning (LoRA/PEFT).  

---

## Repository Structure

