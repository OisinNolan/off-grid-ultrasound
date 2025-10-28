# Running in a devcontainer within VScode
One nice way of working inside a container is to use the [VSCode Remote - Containers extension](https://code.visualstudio.com/docs/remote/containers).

- [Install docker](https://docs.docker.com/desktop/setup/install/windows-install/).
- [Install VSCode](https://code.visualstudio.com/download).

## Preparing the development container
In the root repository, add a .devcontainer folder with the file _devcontainer.json_, with the content:

```devcontainer.json
{
    "name": "off-grid-ultrasound",
    "build": {
        "dockerfile": "../Dockerfile",
        "context": ".."
    },
    "workspaceFolder": "/working_directory",
    "workspaceMount": "source=${localWorkspaceFolder},target=/working_directory,type=bind,consistency=cached",
    "runArgs": [
        "--gpus=all"
    ]
}
```

Now, in VSCode, click the remote button (bottom left), or use the top search bar, and search for `>Dev Containers: Reopen in Container`. The container should now start.
In the container, install the "Python" extension to allow debugging.

## Running the code
> **Note**
> When using uv you can either run the code with `uv run main.py` each time, or run `uv sync` once and then use `python main.py` directly.
```bash
uv sync
python main.py config/regular_runs/carotid/carotid_sa_1.yaml
```