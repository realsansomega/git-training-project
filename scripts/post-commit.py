import glob
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

CHECKS = "E0602,E0102,W0612,C0301,C0114"

python_files = glob.glob(str(ROOT / "*.py"))

for filename in python_files:
    result = subprocess.run(
        [
            sys.executable,
            "-m",
            "pylint",
            "--disable=all",
            "--enable=" + CHECKS,
            "--score=n",
            "--reports=n",
            filename,
        ],
        cwd=ROOT,
        capture_output=True,
        text=True,
    )

    if result.stdout:
        print(result.stdout, end="")

    if result.stderr:
        print(result.stderr, file=sys.stderr, end="")
