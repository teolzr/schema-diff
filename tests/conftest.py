import os
import sys
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent
project_path = str(PROJECT_ROOT)

if project_path not in sys.path:
    sys.path.insert(0, project_path)

existing_pythonpath = os.environ.get("PYTHONPATH")
if existing_pythonpath:
    if project_path not in existing_pythonpath.split(os.pathsep):
        os.environ["PYTHONPATH"] = os.pathsep.join([project_path, existing_pythonpath])
else:
    os.environ["PYTHONPATH"] = project_path
