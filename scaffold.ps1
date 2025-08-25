# Folders (existing ones are fine)
$dirs = @(
  "Notebooks",
  "Dataset/raw","Dataset/processed","Dataset/metadata",
  "Model/checkpoints","Model/configs","Model/logs",
  "Benchmark/results","Benchmark/reports",
  "src","src/data","src/models","src/training","src/evaluation",
  "configs","scripts","tests","outputs"
)
foreach ($d in $dirs) { mkdir $d -Force | Out-Null }

# .gitkeep placeholders
$keep = @(
  "Notebooks/.gitkeep",
  "Dataset/raw/.gitkeep","Dataset/processed/.gitkeep","Dataset/metadata/.gitkeep",
  "Model/checkpoints/.gitkeep","Model/configs/.gitkeep","Model/logs/.gitkeep",
  "Benchmark/results/.gitkeep","Benchmark/reports/.gitkeep",
  "outputs/.gitkeep"
)
foreach ($f in $keep) { New-Item -ItemType File $f -Force | Out-Null }

# src package placeholders
$pyInits = @(
  "src/__init__.py","src/data/__init__.py","src/models/__init__.py",
  "src/training/__init__.py","src/evaluation/__init__.py"
)
foreach ($f in $pyInits) { Set-Content -Path $f -Value "# placeholder" }

# src/train.py
@'
# TODO: training entry point
def main():
    print("train stub")

if __name__ == "__main__":
    main()
'@ | Set-Content -Path "src/train.py"

# configs/default.yaml
@'
# TODO: default project config
project:
  name: protein-interaction-with-llms
  seed: 42
  output_dir: outputs
'@ | Set-Content -Path "configs/default.yaml"

# scripts/*.sh
$scriptNames = @("setup.sh","format.sh","test.sh","run_experiment.sh","download_data.sh")
foreach ($s in $scriptNames) {
  @'
#!/usr/bin/env bash
# TODO: script placeholder
'@ | Set-Content -Path "scripts/$s"
}

# tests/test_placeholder.py
'def test_placeholder(): assert True' | Set-Content -Path "tests/test_placeholder.py"

# environment.yml
@'
# TODO: pin as needed
name: protein-llms
channels: [conda-forge, pytorch, nvidia]
dependencies:
  - python=3.10
  - pip
  - pip:
      - -e .
'@ | Set-Content -Path "environment.yml"

# pyproject.toml
@'
# TODO: fill in metadata/deps later
[build-system]
requires = ["setuptools>=68", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "protein-interaction-with-llms"
version = "0.1.0"
requires-python = ">=3.10"
dependencies = []
'@ | Set-Content -Path "pyproject.toml"

# .pre-commit-config.yaml
'repos: []  # TODO: add hooks later' | Set-Content -Path ".pre-commit-config.yaml"

# .gitignore (append if missing entries)
$gitignore = @"
__pycache__/
*.pyc
.venv/
venv/
.env
.ipynb_checkpoints/
outputs/
Dataset/raw/
Model/checkpoints/
Model/logs/
"@
if (Test-Path .gitignore) {
  Add-Content .gitignore "`n$gitignore"
} else {
  $gitignore | Set-Content -Path ".gitignore"
}

# Stage & commit
git add .
git commit -m "Scaffold: configs, src, scripts, tests; keep existing Notebooks/Dataset/Model/Benchmark"
