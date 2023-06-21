import os
import sys
import yaml
from os import path
from git import Repo
from rich import inspect, print
from yaml.loader import SafeLoader

remote_url = os.getenv('REPO_URL', None)
head_branch = os.getenv('HEAD_BRANCH', None)
base_branch = os.getenv('BASE_BRANCH', None)
base_path = path.dirname(__file__)
git_path = path.join(base_path, '.git')

try:
    repo = Repo.init(git_path, bare=True)
    origin = repo.create_remote("origin", url=remote_url)
except Exception:
    repo = Repo(git_path)
    origin = repo.remotes['origin']

origin.fetch(base_branch)
origin.fetch(head_branch)

with open('project.yml', 'r') as f:
    data = yaml.load(f, Loader=SafeLoader)

changed_pipelines = []

for pipeline in data.get('pipelines'):
    pname = pipeline.get('name')
    ppath = pipeline.get('path')
    if not path.isdir(ppath):
        continue
    if len(origin.refs[base_branch].commit.diff(origin.refs[head_branch].commit, paths=[ppath])) > 0 and pname not in changed_pipelines:
        changed_pipelines.append(pname)

if len(changed_pipelines) > 1:
    print("Invalid commit, you are not allowed to make changes more than 1 pipeline in at the time")
    sys.exit(1)

print(changed_pipelines[0])
sys.exit(0)
