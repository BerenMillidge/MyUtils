import json
import requests
import subprocess
#authenticate with curl
subprocess.check_call("curl -u Bmillidgework https://api.github.com/user",shell=True)
content = requests.get("https://api.github.com/users/Bmillidgework/repos?per_page=200").content
repos = json.loads(content)
for repo in repos:
    repo_name = str(repo["name"]) + ".git"
    subprocess.check_call("bash github_replace_email.sh '%s'" %repo_name,  shell=True)
