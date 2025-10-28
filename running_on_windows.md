
# Running the code on Windows
## Installing the dependencies
The code was tested with python 3.12.

### Using uv
If you are using [uv](https://docs.astral.sh/uv/) to manage your python environments, you can simply run
```powershell
uv sync
```

### Using pip
If you are not using uv, you can install the dependencies with pip. First, create a virtual environment and activate it. Then install the dependencies from the `requirements.txt` file.
```powershell
python -m venv .venv
.venv\Scripts\activate
pip install --upgrade pip
pip install -r requirements.txt
```

## Running in docker

First [install docker](https://docs.docker.com/desktop/setup/install/windows-install/).

### Building the docker image
To run the code in a docker container, you can use the provided `Dockerfile`. Build the docker image with the following command (from the root of the repository): 
```powershell
docker build -t infer .
```

### Running the docker container
In Powershell enter
```powershell
docker run --gpus all -v ${pwd}:/working_directory -it infer bash
```

You can also [run the docker image in a VSCode devcontainer](running_in_a_devcontainer.md).

## Downloading the data
Download the data files from the [Zenodo repository](https://zenodo.org/records/14925758) and place them in the `data` folder.

Alternatively (on linux or in docker) you can use the script `shell/get-data.sh` from the root of the repository. Run it as follows:
```bash
bash shell/get-data.sh
```

## Running the code
> **Note**
> When using uv you can either run the code with `uv run main.py` each time, or run `uv sync` once and then use `python main.py` directly.
```powershell
uv sync
python main.py config/regular_runs/carotid/carotid_sa_1.yaml
```
