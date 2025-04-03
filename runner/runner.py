import subprocess

def main():
    
    result = subprocess.Popen("docker compose config", env=env)
    for s in result.readlines():
        print(s.rstrip())
