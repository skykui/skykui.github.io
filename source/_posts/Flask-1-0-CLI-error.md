---
title: Flask >=1.0 CLI error
date: 2018-05-11 11:07:29
tags:
- Flask
categories:
---

For Flask <= 0.12.4, you can set environment variable as
```FLASK_APP=Path/to/your/app.py```
to use Flask CLI.

If you upgrade Flask to >=1.0, you must be careful because your commands will be broken. The error could be:
> Error: Could not import "..."

After checking Flask documents and source code, the issue is pretty easy to be solve.
Since Flask >=1.0, the setting of FLASK_APP should be the module name instead of absolute path. It also assumes that you are currently in the project folder which includes then entry point of your app.
Therefore, the correct way set your Flask CLI environment variable should be like:
```FLASK_APP=app.py```