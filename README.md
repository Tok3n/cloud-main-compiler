# cloud-main-compiler
Docker container for the Cloud_Main compiler

Usage:
---

```bash
docker pull tok3n/cloud-main-compiler
docker run -it -v /PATH/TO/Cloud_Main:/data/Cloud_Main tok3n/cloud-main-compiler
# Once inside, init the compiler
bash init-compiler.bash
# Then begin compiling
grunt --config=example
```

Note: Browser_reload does *not* work in Docker. Be sure to disable it in the config.json