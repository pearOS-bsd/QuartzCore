# QuartzCore

> **CoreAnimation lives here.** On macOS there is no `CoreAnimation.framework`: Core Animation (`CALayer`, `CAAnimation`, `CATransaction`, `CAContext`, the `CoreAnimation.h` umbrella header) is part of `QuartzCore.framework` (checked on macOS 26.7.2: `/System/Library/Frameworks/CoreAnimation.framework` and the private one are absent). So this repository is the Core Animation repository; a separate one would not match Apple's layout. Liquid Glass (the `CASDF*` layers and the glass filters inside QuartzCore) is built on top of it in [Solarium](https://github.com/pearOS-bsd/Solarium).

CoreAnimation for pearOS: layers (`CALayer` and friends), the command stream decoder and the render path (`src/`, `include/`), with reference tests against the real QuartzCore (`make check-golden check-actions check-values`).

## Upstream sources (starting point)
`upstream/` holds unmodified source of other open projects (see [PROVENANCE.md](PROVENANCE.md)).  Survey: https://github.com/pearOS-bsd/docs/blob/main/development/EXISTING-PROJECTS.md
