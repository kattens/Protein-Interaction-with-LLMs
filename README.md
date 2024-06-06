# Protein-Interaction-with-LLMs

## Project Overview

### Goal of the Project
The purpose of the model is to efficiently adapt to the number of channels, introducing various variables and properties into the context of protein-protein interaction predictions. We aim to explore the flexibility of changing the core model of the architecture to identify the most suitable core for this approach.

### Core Models
We are considering several core models, each with unique characteristics:

1. **ESM 2**: This model uses evolutionary scale modeling, trained on a large-scale dataset of protein sequences, to capture the essence of protein functionalities.
2. **Llama 3**: Inspired by the capabilities of large language models, Llama 3 is adapted for specific nuances in biological sequence understanding.
3. **ProtBert**: A derivative of BERT, specifically tuned for protein sequences, leveraging deep transformer networks to understand the biological sequences domain.
4. **Bert**: As a baseline, the general BERT model will help assess the benefits of using more specialized architectures like ProtBert for biological data.

### Channels of Input
To provide a comprehensive understanding of protein interactions, we plan to integrate multiple channels of information:

1. **Local Inputs with Faiss**: Utilizing FAISS for efficient similarity searches among embeddings, which could help quickly retrieve relevant sequence contexts.
2. **Local Inputs from UniProt Database**: These datasets are rich in annotations and offer deep biological insights, sourced from a comprehensive protein database.
3. **Coordinates of the Amino Acid’s Calpha**: By incorporating structural information, I aim to enhance the model's ability to predict physical interaction possibilities beyond mere sequence data.

## Implementation Strategy

### Modular Design
To ensure flexibility, we are designing each component of the model architecture should be designed to be modular. This approach will allow easy swapping of core models and channels without major overhauls of the system:

- **Model Interface**: A standardized interface for all core models ensures they can be easily integrated into the overall architecture.
- **Data Handling**: Standardizing data handling for various channels ensures consistent and efficient processing.

### Experimentation Framework
To systematically test and compare different configurations, we are setting up a robust experimentation framework:

- **Metrics**: we will use accuracy, precision, recall, and F1-score to evaluate model performance.
- **Validation**: A consistent validation approach across all experiments will help compare the effectiveness of different models and channels.
- **Experiment Tracking**: Tools like MLflow or Weights & Biases will be employed to log configurations, results, and models for thorough analysis and reproducibility.

### Scalability and Optimization
Considering the potentially intensive computational demands:

- **Parallel Processing**: We plan to utilize GPU resources effectively and explore multi-GPU setups or distributed computing if necessary.
- **Performance Optimizations**: Techniques such as mixed-precision training, model quantization, and efficient data loading will be crucial.
