## HackMyResume Docker

This is a docker container of the [HackMyResume](https://github.com/hacksalot/HackMyResume) project.

I've included some samples that can be used in conjunction, or ignored, as desired.

### Usage

```
THEME=modern RESUME=in/resume.json make resume
```

### docker-compose.yml

Run the container with local directories mounted

### convert.rb

Write resume as a human friendly .yml file, then transform to .json
