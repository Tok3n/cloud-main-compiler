# cloud-main-compiler
Docker container for the Cloud_Main compiler

Usage:
---

```bash
docker pull tok3n/cloud-main-compiler
docker run -it -v /PATH/TO/Cloud_Main:/data/Cloud_Main tok3n/cloud-main-compiler
# Once inside, begin compiling
grunt --config=example
```